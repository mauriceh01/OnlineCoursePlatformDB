-- ====================================================================================================================================================
-- Maurice Hazan
-- July 13, 2025
-- OnlineCoursePlatformDB_Reports
-- ====================================================================================================================================================

USE OnlineCoursePlatformDB;

--  1. Course Licensing & Revenue Dashboard (by Instructor)
-- Shows how much each instructor has earned indirectly through course licensing.


SELECT 
    u.FullName AS InstructorName,
    c.Title AS CourseTitle,
    COUNT(cl.LicenseID) AS TotalLicenses,
    SUM(cl.LicenseFee) AS TotalRevenue,
    MAX(cl.LicenseEndDate) AS LastLicenseEndDate
FROM Courses c
JOIN Users u ON c.InstructorID = u.UserID
LEFT JOIN ContentLicensing cl ON cl.CourseID = c.CourseID
GROUP BY c.CourseID, u.FullName
ORDER BY TotalRevenue DESC;


-- 2. Top Performing Students (Across Quizzes, Achievements, and Streaks)
-- Pulls high achievers based on quiz accuracy, achievements, and active streaks.


SELECT 
    u.FullName,
    COUNT(DISTINCT a.AchievementID) AS AchievementsEarned,
    ROUND(AVG(CASE WHEN qr.IsCorrect THEN 1 ELSE 0 END) * 100, 2) AS QuizAccuracy,
    ls.CurrentStreak,
    ls.LongestStreak
FROM Users u
LEFT JOIN UserAchievements ua ON u.UserID = ua.UserID
LEFT JOIN Achievements a ON ua.AchievementID = a.AchievementID
LEFT JOIN QuizResults qr ON u.UserID = qr.StudentID
LEFT JOIN LearningStreaks ls ON u.UserID = ls.UserID
GROUP BY u.UserID
ORDER BY AchievementsEarned DESC, QuizAccuracy DESC, CurrentStreak DESC
LIMIT 10;

-- 3. User Engagement & Activity Overview
-- gives you a high-level snapshot of user engagement across multiple learning dimensions, 
-- making it perfect for admin dashboards or detailed engagement reports

SELECT 
    u.FullName,
    COUNT(DISTINCT e.CourseID) AS TotalCourses,
    COALESCE(SUM(p.Amount), 0) AS TotalPayments,
    COUNT(DISTINCT qr.QuizID) AS QuizzesTaken,
    COUNT(DISTINCT wp.ContentID) AS VideosWatched
FROM Users u
LEFT JOIN Enrollments e ON u.UserID = e.StudentID
LEFT JOIN Payments p ON u.UserID = p.PaymentID AND p.Status = 'completed'
LEFT JOIN QuizResults qr ON u.UserID = qr.StudentID
LEFT JOIN WatchProgress wp ON u.UserID = wp.StudentID
GROUP BY u.UserID;


-- 4. Active Student Engagement Report
-- Shows who is currently engaging with content and how consistently.


SELECT 
    u.FullName,
    COUNT(DISTINCT wp.ContentID) AS UniqueVideosWatched,
    ROUND(AVG(wp.ProgressPercent), 1) AS AvgProgress,
    MAX(wp.LastWatchedAt) AS LastWatched,
    COUNT(DISTINCT qr.QuizID) AS QuizzesAttempted,
    ROUND(AVG(CASE WHEN qr.IsCorrect THEN 1 ELSE 0 END) * 100, 2) AS QuizAccuracy
FROM Users u
LEFT JOIN WatchProgress wp ON u.UserID = wp.StudentID
LEFT JOIN QuizResults qr ON u.UserID = qr.StudentID
GROUP BY u.UserID
ORDER BY LastWatched DESC
LIMIT 15;

-- 5. Course Completion & Certification Summary
-- Compares total enrollments vs completions and who got certified.

SELECT 
    c.Title AS CourseTitle,
    COUNT(e.EnrollmentID) AS TotalEnrolled,
    SUM(CASE WHEN e.CompletionStatus = 'completed' THEN 1 ELSE 0 END) AS Completed,
    SUM(CASE WHEN cert.CertificateID IS NOT NULL THEN 1 ELSE 0 END) AS Certified,
    ROUND(SUM(CASE WHEN e.CompletionStatus = 'completed' THEN 1 ELSE 0 END) / COUNT(e.EnrollmentID) * 100, 1) AS CompletionRate
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
LEFT JOIN Certificates cert ON e.EnrollmentID = cert.EnrollmentID
GROUP BY c.CourseID
ORDER BY CompletionRate DESC;


-- 6. Support Load & Satisfaction Metrics
-- Show support performance and satisfaction per agent (or ticket responder).

SELECT 
    u.FullName AS SupportAgent,
    COUNT(st.TicketID) AS TicketsHandled,
    AVG(TIMESTAMPDIFF(HOUR, st.CreatedAt, st.ResolvedAt)) AS AvgResolutionTimeHours,
    ROUND(AVG(st.Rating), 1) AS AvgSatisfactionRating,
    MAX(st.ResolvedAt) AS LastResolved
FROM SupportTickets st
JOIN Users u ON st.AssignedTo = u.UserID
WHERE st.Status = 'resolved'
GROUP BY u.UserID
ORDER BY AvgResolutionTimeHours ASC;


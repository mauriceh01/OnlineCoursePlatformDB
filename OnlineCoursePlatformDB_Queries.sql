-- =================================================================================================================================
-- Maurice Hazan
-- July 13, 2025
-- 30 Queries to test the data for OnlineCoursePlatformDB
-- ==================================================================================================================================

USE OnlineCoursePlatformDB;



-- 1. Show referral rewards status by user

SELECT 
    u1.FullName AS Referrer,
    u2.FullName AS Referred,
    rr.RewardAmount,
    rr.Status,
    rr.RewardDate
FROM ReferralRewards rr
JOIN Users u1 ON rr.ReferrerUserID = u1.UserID
JOIN Users u2 ON rr.ReferredUserID = u2.UserID;

--  2. Find active content licenses that will expire within 60 days

SELECT 
    cl.LicenseeName,
    c.Title AS CourseTitle,
    cl.LicenseEndDate
FROM ContentLicensing cl
JOIN Courses c ON cl.CourseID = c.CourseID
WHERE cl.LicenseEndDate BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 60 DAY);

--  3. List users with the longest current learning streaks

SELECT 
    u.FullName,
    ls.CurrentStreak,
    ls.LongestStreak,
    ls.LastActiveDate
FROM LearningStreaks ls
JOIN Users u ON ls.UserID = u.UserID
ORDER BY ls.CurrentStreak DESC
LIMIT 5;

--  4. Find regions where default language is not English

SELECT 
    RegionCode,
    RegionName,
    DefaultLanguage
FROM RegionalSettings
WHERE DefaultLanguage <> 'en';

--  5. Get currently enabled feature flags

SELECT 
    FeatureName,
    Description,
    UpdatedAt
FROM FeatureFlags
WHERE IsEnabled = TRUE;

--  6. Get the most recent AI model training log with highest accuracy

SELECT 
    ModelName,
    Version,
    Accuracy,
    TrainingStart,
    TrainingEnd
FROM AIModelTrainingLogs
ORDER BY Accuracy DESC, TrainingEnd DESC
LIMIT 1;

--  7. List the top 3 largest CDN assets uploaded

SELECT 
    FileName,
    URL,
    FileSizeBytes,
    ContentType,
    UploadedAt
FROM CDNAssets
ORDER BY FileSizeBytes DESC
LIMIT 3;

--  8. Find transcript accuracy for each content item

SELECT 
    cc.Title AS ContentTitle,
    vt.Accuracy,
    vt.GeneratedAt
FROM VoiceTranscripts vt
JOIN CourseContent cc ON vt.ContentID = cc.ContentID;

--  9. Audit: See what tables were most recently updated or changed

SELECT 
    TableName,
    ChangeType,
    ChangeTimestamp,
    u.FullName AS ChangedBy,
    JSON_EXTRACT(NewData, '$.Title') AS NewTitle
FROM AuditTrailVersions atv
JOIN Users u ON atv.ChangedBy = u.UserID
ORDER BY ChangeTimestamp DESC
LIMIT 10;

--  10. Count of records per change type in audit log

SELECT 
    ChangeType,
    COUNT(*) AS TotalChanges
FROM AuditTrailVersions
GROUP BY ChangeType;

-- 11. List all users with roles and subscription status

SELECT 
    u.UserID, u.FullName, u.Email, ur.RoleName, s.PlanName, s.IsActive
FROM Users u
LEFT JOIN UserRoleAssignments ura ON u.UserID = ura.UserID
LEFT JOIN UserRoles ur ON ura.RoleID = ur.RoleID
LEFT JOIN Subscriptions s ON u.UserID = s.UserID;

-- 12. Show users who earned achievements

SELECT 
    u.FullName, a.Title AS Achievement, ua.EarnedAt
FROM UserAchievements ua
JOIN Users u ON ua.UserID = u.UserID
JOIN Achievements a ON ua.AchievementID = a.AchievementID;

--  Courses & Categories
-- 13. List published courses and their categories

SELECT 
    c.Title AS CourseTitle,
    cat.Name AS Category
FROM Courses c
JOIN CourseCategories cc ON c.CourseID = cc.CourseID
JOIN Categories cat ON cc.CategoryID = cat.CategoryID
WHERE c.Status = 'published';

-- 14. Count courses by difficulty level

SELECT Level, COUNT(*) AS TotalCourses
FROM Courses
GROUP BY Level;

--  Enrollments, Quizzes, Content
-- 15. Track student progress in course content

SELECT 
    u.FullName, 
    cc.Title AS ContentTitle, 
    wp.ProgressPercent, 
    wp.LastWatchedAt
FROM WatchProgress wp
JOIN Users u ON wp.StudentID = u.UserID
JOIN CourseContent cc ON wp.ContentID = cc.ContentID
ORDER BY wp.LastWatchedAt DESC;

-- 16. Average quiz score per student

SELECT 
    u.FullName,
    ROUND(AVG(CASE WHEN qr.IsCorrect THEN 1 ELSE 0 END) * 100, 2) AS AccuracyPercent
FROM QuizResults qr
JOIN Users u ON qr.StudentID = u.UserID
GROUP BY qr.StudentID;

--  Payments, Payouts, Affiliates
-- 17. Instructor payouts summary

SELECT 
    u.FullName AS Instructor,
    SUM(ip.Amount) AS TotalEarned
FROM InstructorPayouts ip
JOIN Users u ON ip.InstructorID = u.UserID
WHERE ip.Status = 'paid'
GROUP BY ip.InstructorID;

-- 18. Track affiliate commissions

SELECT 
    a.ReferralCode,
    u.FullName AS AffiliateName,
    SUM(ac.Amount) AS TotalCommission
FROM Affiliates a
JOIN Users u ON a.UserID = u.UserID
JOIN AffiliateCommissions ac ON a.AffiliateID = ac.AffiliateID
GROUP BY a.AffiliateID;

--  Certificates, Assignments, Exams
-- 19. List students who completed a course and got certificates

SELECT 
    u.FullName,
    c.Title AS CourseTitle,
    cert.IssuedDate,
    cert.CertificateURL
FROM Certificates cert
JOIN Enrollments e ON cert.EnrollmentID = e.EnrollmentID
JOIN Users u ON e.StudentID = u.UserID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE e.CompletionStatus = 'completed';

-- 20. Show exam attempts with pass/fail

SELECT 
    u.FullName,
    ce.Title AS ExamTitle,
    ea.Score,
    ea.Passed,
    ea.AttemptedAt
FROM ExamAttempts ea
JOIN CertificationExams ce ON ea.ExamID = ce.ExamID
JOIN Users u ON ea.StudentID = u.UserID;

-- ‍  Mentorship, CareerPaths
-- 21. Find students in mentorship programs

SELECT 
    mp.Title AS Mentorship,
    u.FullName AS Student,
    me.EnrolledAt
FROM MentorshipEnrollments me
JOIN MentorshipPrograms mp ON me.MentorshipID = mp.MentorshipID
JOIN Users u ON me.StudentID = u.UserID;

-- 22. Show user progress in career paths

SELECT 
    u.FullName, 
    cp.Name AS CareerPath, 
    ucp.EnrolledAt
FROM UserCareerPaths ucp
JOIN Users u ON ucp.UserID = u.UserID
JOIN CareerPaths cp ON ucp.PathID = cp.PathID;

--  Notifications, Support, Community
-- 23. Unread notifications per user

SELECT 
    u.FullName,
    COUNT(*) AS UnreadNotifications
FROM Notifications n
JOIN Users u ON n.UserID = u.UserID
WHERE n.IsRead = FALSE
GROUP BY u.UserID;

-- 24. Active support tickets with replies

SELECT 
    st.Subject,
    u.FullName AS SubmittedBy,
    st.Status,
    COUNT(tr.ReplyID) AS Replies
FROM SupportTickets st
JOIN Users u ON st.UserID = u.UserID
LEFT JOIN TicketReplies tr ON st.TicketID = tr.TicketID
GROUP BY st.TicketID;

--  Marketing, Campaigns, A/B Testing
-- 25. Active marketing campaigns with users who claimed them

SELECT 
    mc.Name AS Campaign,
    u.FullName,
    ce.ClaimedAt
FROM CampaignEnrollments ce
JOIN MarketingCampaigns mc ON ce.CampaignID = mc.CampaignID
JOIN Users u ON ce.UserID = u.UserID
WHERE CURDATE() BETWEEN mc.StartDate AND mc.EndDate;

-- 26. A/B test summary

SELECT 
    TestName,
    VariationA,
    VariationB,
    StartDate,
    EndDate,
    MetricTracked
FROM ABTests;

--  Logs, Audits, System
-- 27. Recent system audit trail changes

SELECT 
    TableName,
    ChangeType,
    ChangeTimestamp,
    u.FullName AS ChangedBy
FROM AuditTrailVersions atv
JOIN Users u ON atv.ChangedBy = u.UserID
ORDER BY ChangeTimestamp DESC
LIMIT 10;

-- 28. Recent error logs

SELECT 
    ErrorType,
    Message,
	LoggedAt
	FROM ErrorLogs
	ORDER BY LoggedAt DESC
	LIMIT 10;

--  Localization, Multilingual
-- 29. Translations for non-English courses

SELECT 
    t.ContentType,
    t.FieldName,
    t.TranslatedText,
    t.LanguageCode
FROM Translations t
WHERE t.LanguageCode <> 'en'
LIMIT 10;

-- 30. Course language support

SELECT 
    c.Title AS CourseTitle,
    cl.LanguageCode,
    cl.IsPrimary
FROM CourseLanguages cl
JOIN Courses c ON cl.CourseID = c.CourseID;



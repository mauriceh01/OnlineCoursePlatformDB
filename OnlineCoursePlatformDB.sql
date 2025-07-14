-- ========================================================================================================================================================================
-- Author: Maurice Hazan
-- Created: July 13, 2025
-- Project Name: OnlineCoursePlatformDB
-- A full-featured relational SQL database designed to support a scalable, feature-rich online learning platform similar to Udemy, Coursera, or edX. 
--     This schema supports everything from core course delivery and student tracking to advanced features like gamification, AI-powered recommendations, 
--     certification exams, and compliance logging.
-- *** Key Features ***
--     Multi-role user support: Students, instructors, and admins
--     Courses & multimedia content: Videos, quizzes, and articles
--     Enrollments & completion tracking
--     Quiz system: Auto-scoring and analytics
--     Achievements & leaderboards: Engagement incentives
--     Subscriptions & bundles: Monetization and upselling
--     Notifications, support tickets, and messaging
--     AI recommendations: Personalized learning suggestions
--     Certification exams: Proctored, scored, and tracked
--     Career paths & mentorships: Structured learning tracks
--     Audit logs, API keys, backups, and error tracking
--     Mobile app logs & accessibility compliance
--     Tagging, categories, and content flags for moderation
--     Analytics dashboards, data exports, and system settings

-- ========================================================================================================================================================================


CREATE DATABASE OnlineCoursePlatformDB;

USE OnlineCoursePlatformDB; 

-- ========================================================================================
-- ************************** 1. Users table **********************************************
-- ========================================================================================

CREATE TABLE Users (
    UserID 							INT PRIMARY KEY AUTO_INCREMENT,
    FullName 						VARCHAR(100),
    Email 							VARCHAR(100) UNIQUE,
    PasswordHash 					VARCHAR(255),
    Role 							ENUM('student', 'instructor', 'admin') DEFAULT 'student',
    CreatedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ========================================================================================
-- ************************** 2. Courses table ********************************************
-- ========================================================================================


CREATE TABLE Courses (
    CourseID 						INT PRIMARY KEY AUTO_INCREMENT,
    InstructorID 					INT,
    Title 							VARCHAR(200),
    Description 					TEXT,
    Price 							DECIMAL(8,2),
    Level 							ENUM('beginner', 'intermediate', 'advanced'),
    Language 						VARCHAR(50),
    Status 							ENUM('draft', 'published', 'archived') DEFAULT 'draft',
    CreatedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (InstructorID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 3. Categories table *****************************************
-- ========================================================================================

CREATE TABLE Categories (
    CategoryID 						INT PRIMARY KEY AUTO_INCREMENT,
    Name 							VARCHAR(100) UNIQUE
);

-- ========================================================================================
-- ************************** 4. CourseCategories table  (many-to-many) *******************
-- ========================================================================================


CREATE TABLE CourseCategories (
    CourseID 						INT,
    CategoryID 						INT,
    PRIMARY KEY (CourseID, CategoryID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- ========================================================================================
-- ************************** 5. Enrollments table ***************************************
-- ========================================================================================

CREATE TABLE Enrollments (
    EnrollmentID 					INT PRIMARY KEY AUTO_INCREMENT,
    CourseID 						INT,
    StudentID 						INT,
    EnrolledAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    CompletionStatus 				ENUM('in_progress', 'completed', 'dropped') DEFAULT 'in_progress',
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (StudentID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 6. CourseContent table **************************************
-- ========================================================================================

CREATE TABLE CourseContent (
    ContentID 						INT PRIMARY KEY AUTO_INCREMENT,
    CourseID 						INT,
    Title 							VARCHAR(200),
    ContentType 					ENUM('video', 'article', 'quiz'),
    URL 							TEXT,
    Duration 						INT,  -- in minutes
    SortOrder 						INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- ========================================================================================
-- ************************** 7. Quizzes table ********************************************
-- ========================================================================================

CREATE TABLE Quizzes (
    QuizID 							INT PRIMARY KEY AUTO_INCREMENT,
    ContentID 						INT,
    Question 						TEXT,
    OptionA 						VARCHAR(255),
    OptionB 						VARCHAR(255),
    OptionC 						VARCHAR(255),
    OptionD 						VARCHAR(255),
    CorrectOption 					CHAR(1),  -- A, B, C, D
    FOREIGN KEY (ContentID) REFERENCES CourseContent(ContentID)
);

-- ========================================================================================
-- ************************** 8. QuizResults table ****************************************
-- ========================================================================================

CREATE TABLE QuizResults (
    ResultID 						INT PRIMARY KEY AUTO_INCREMENT,
    StudentID 						INT,
    QuizID 							INT,
    SelectedOption 					CHAR(1),
    IsCorrect 						BOOLEAN,
    AttemptedAt 					DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Users(UserID),
    FOREIGN KEY (QuizID) REFERENCES Quizzes(QuizID)
);

-- ========================================================================================
-- ************************** 9. Reviews table ********************************************
-- ========================================================================================

CREATE TABLE Reviews (
    ReviewID 						INT PRIMARY KEY AUTO_INCREMENT,
    CourseID 						INT,
    StudentID 						INT,
    Rating 							INT CHECK (Rating BETWEEN 1 AND 5),
    Comment 						TEXT,
    ReviewedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (StudentID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 10. Payments table ******************************************
-- ========================================================================================

CREATE TABLE Payments (
    PaymentID 						INT PRIMARY KEY AUTO_INCREMENT,
    StudentID 						INT,
    CourseID 						INT,
    Amount 							DECIMAL(8,2),
    PaymentDate 					DATETIME DEFAULT CURRENT_TIMESTAMP,
    PaymentMethod 					ENUM('credit_card', 'paypal', 'crypto'),
    Status 							ENUM('completed', 'incomplete', 'pending'),
    FOREIGN KEY (StudentID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


-- ========================================================================================
-- ************************** 11. Certificates table **************************************
-- ========================================================================================

CREATE TABLE Certificates (
    CertificateID 					INT PRIMARY KEY AUTO_INCREMENT,
    EnrollmentID 					INT,
    IssuedDate 						DATE,
    CertificateURL 					TEXT,
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID)
);


-- ========================================================================================
-- ************************** 12. WatchProgress table *************************************
-- ========================================================================================
-- Tracks how much of each content item a student has watched or completed.


CREATE TABLE WatchProgress (
    ProgressID 						INT PRIMARY KEY AUTO_INCREMENT,
    StudentID 						INT,
    ContentID 						INT,
    ProgressPercent 				DECIMAL(5,2), -- e.g., 75.00
    LastWatchedAt 					DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Users(UserID),
    FOREIGN KEY (ContentID) REFERENCES CourseContent(ContentID)
);

-- ========================================================================================
-- ************************** 13. InstructorPayouts table *********************************
-- ========================================================================================
-- Tracks how much instructors are owed or paid for course sales.


CREATE TABLE InstructorPayouts (
    PayoutID 						INT PRIMARY KEY AUTO_INCREMENT,
    InstructorID 					INT,
    CourseID 						INT,
    Amount 							DECIMAL(10,2),
    Status 							ENUM('pending', 'paid', 'rejected') DEFAULT 'pending',
    PayoutDate 						DATE,
    FOREIGN KEY (InstructorID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- ========================================================================================
-- ************************** 14. Affiliates table ****************************************
-- ========================================================================================
-- Optional table to support affiliate/referral marketing.


CREATE TABLE Affiliates (
    AffiliateID 					INT PRIMARY KEY AUTO_INCREMENT,
    UserID 							INT,
    ReferralCode 					VARCHAR(20) UNIQUE,
    TotalEarnings 					DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 15. AffiliateCommissions table ******************************
-- ========================================================================================
-- Tracks commission earned from referred sales.


CREATE TABLE AffiliateCommissions (
    CommissionID 					INT PRIMARY KEY AUTO_INCREMENT,
    AffiliateID 					INT,
    CourseID 						INT,
    StudentID 						INT,
    Amount 							DECIMAL(8,2),
    PurchaseDate 					DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AffiliateID) REFERENCES Affiliates(AffiliateID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (StudentID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 16. Notifications table *************************************
-- ========================================================================================
-- In-app notification system (e.g., course updates, new quiz posted, payment receipt, etc.)


CREATE TABLE Notifications (
    NotificationID 					INT PRIMARY KEY AUTO_INCREMENT,
    UserID 							INT,
    Message 						TEXT,
    IsRead 							BOOLEAN DEFAULT FALSE,
    CreatedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 17. CourseBundles table *************************************
-- ========================================================================================
-- Bundles multiple courses into one purchase (for marketing or specialization tracks).


CREATE TABLE CourseBundles (
    BundleID 						INT PRIMARY KEY AUTO_INCREMENT,
    Title 							VARCHAR(150),
    Description 					TEXT,
    Price 							DECIMAL(8,2),
    CreatedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ========================================================================================
-- ************************** 18. BundleCourses table *************************************
-- ========================================================================================
-- Maps which courses belong to which bundle (many-to-many).


CREATE TABLE BundleCourses (
    BundleID 						INT,
    CourseID 						INT,
    PRIMARY 						KEY (BundleID, CourseID),
    FOREIGN 						KEY (BundleID) REFERENCES CourseBundles(BundleID),
    FOREIGN 						KEY (CourseID) REFERENCES Courses(CourseID)
);

-- ========================================================================================
-- ************************** 19. BundlePurchases table ***********************************
-- ========================================================================================
-- Tracks bundle purchases by students.

CREATE TABLE BundlePurchases (
    PurchaseID 						INT PRIMARY KEY AUTO_INCREMENT,
    StudentID 						INT,
    BundleID 						INT,
    TotalAmount 					DECIMAL(8,2),
    PurchaseDate					DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Users(UserID),
    FOREIGN KEY (BundleID) REFERENCES CourseBundles(BundleID)
);

-- ========================================================================================
-- ************************** 20. CourseVersions table ************************************
-- ========================================================================================
-- Track edits to course content (version control for instructors).


CREATE TABLE CourseVersions (
    VersionID 						INT PRIMARY KEY AUTO_INCREMENT,
    CourseID 						INT,
    VersionNote 					TEXT,
    UpdatedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


-- ========================================================================================
-- ************************** 21. AIRecommendations table *********************************
-- ========================================================================================
-- Store personalized course recommendations for each student (generated via internal ML engine or algorithmic logic).


CREATE TABLE AIRecommendations (
    RecommendationID 				INT PRIMARY KEY AUTO_INCREMENT,
    StudentID 						INT,
    CourseID 						INT,
    Reason 							TEXT,
    Score 							DECIMAL(5,2), -- e.g., match strength from 0.00 to 1.00
    RecommendedAt 					DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- ========================================================================================
-- ************************** 22. Achievements table **************************************
-- ========================================================================================
-- Define gamified achievements students can earn.


CREATE TABLE Achievements (
    AchievementID 					INT PRIMARY KEY AUTO_INCREMENT,
    Title 							VARCHAR(100),
    Description 					TEXT,
    IconURL 						TEXT
);

-- ========================================================================================
-- ************************** 23. UserAchievements table **********************************
-- ========================================================================================
-- Track which achievements a user has earned.


CREATE TABLE UserAchievements (
    UserID 							INT,
    AchievementID 					INT,
    EarnedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (UserID, AchievementID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (AchievementID) REFERENCES Achievements(AchievementID)
);

-- ========================================================================================
-- ************************** 24. Subscriptions table *************************************
-- ========================================================================================
-- Track recurring paid subscriptions for access to premium or all-access content.


CREATE TABLE Subscriptions (
    SubscriptionID 					INT PRIMARY KEY AUTO_INCREMENT,
    UserID 							INT,
    PlanName 						VARCHAR(100),
    Amount 							DECIMAL(8,2),
    BillingCycle 					ENUM('monthly', 'yearly'),
    StartDate 						DATE,
    EndDate 						DATE,
    IsActive 						BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 25. Tags table **********************************************
-- ========================================================================================
-- More flexible tagging system (in addition to fixed categories), supporting skills, technologies, etc.


CREATE TABLE Tags (
    TagID 							INT PRIMARY KEY AUTO_INCREMENT,
    TagName 						VARCHAR(50) UNIQUE
);

-- ========================================================================================
-- ************************** 26. CourseTags table ****************************************
-- ========================================================================================
-- Many-to-many mapping between tags and courses.


CREATE TABLE CourseTags (
    CourseID 						INT,
    TagID 							INT,
    PRIMARY KEY (CourseID, TagID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (TagID) REFERENCES Tags(TagID)
);

-- ========================================================================================
-- ************************** 27. AuditLogs table *****************************************
-- ========================================================================================
-- Track user actions for security, compliance, and troubleshooting.


CREATE TABLE AuditLogs (
    LogID 							INT PRIMARY KEY AUTO_INCREMENT,
    UserID 							INT,
    ActionType 						VARCHAR(100),
    Description 					TEXT,
    ActionTime 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 28. SupportTickets table ************************************
-- ========================================================================================
-- For users to submit issues or questions (technical support, course-related, etc.)


CREATE TABLE SupportTickets (
    TicketID 						INT PRIMARY KEY AUTO_INCREMENT,
    UserID 							INT,
    Subject 						VARCHAR(150),
    Message 						TEXT,
    Status 							ENUM('open', 'in_progress', 'resolved', 'closed') DEFAULT 'open',
    CreatedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    AssignedTo 						INT,
    ResolvedAt 						DATETIME,
    Rating 							DECIMAL(2,1),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (AssignedTo) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 29. TicketReplies table *************************************
-- ========================================================================================
-- Staff or instructors can respond to support tickets.


CREATE TABLE TicketReplies (
    ReplyID 						INT PRIMARY KEY AUTO_INCREMENT,
    TicketID						INT,
    ResponderID						INT,
    Message 						TEXT,
    RepliedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (TicketID) REFERENCES SupportTickets(TicketID),
    FOREIGN KEY (ResponderID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 30. SavedCourses table **************************************
-- ========================================================================================
-- Wishlist functionality for students to bookmark courses.


CREATE TABLE SavedCourses (
    StudentID 						INT,
    CourseID 						INT,
    SavedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


-- ========================================================================================
-- ************************** 31. Webinars table ******************************************
-- ========================================================================================
-- Live events hosted by instructors, optionally linked to a course.


CREATE TABLE Webinars (
    WebinarID 						INT PRIMARY KEY AUTO_INCREMENT,
    Title 							VARCHAR(150),
    Description 					TEXT,
    InstructorID 					INT,
    CourseID 						INT, -- Nullable
    ScheduledAt 					DATETIME,
    DurationMinutes 				INT,
    WebinarURL 						TEXT,
    FOREIGN KEY (InstructorID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- ========================================================================================
-- ************************** 32. WebinarRegistrations table ******************************
-- ========================================================================================
-- Tracks which students signed up for which webinars.


CREATE TABLE WebinarRegistrations (
    WebinarID 						INT,
    StudentID 						INT,
    RegisteredAt 					DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (WebinarID, StudentID),
    FOREIGN KEY (WebinarID) REFERENCES Webinars(WebinarID),
    FOREIGN KEY (StudentID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 33. MentorshipPrograms table ********************************
-- ========================================================================================
-- One-on-one or small group mentoring sessions for advanced learners.


CREATE TABLE MentorshipPrograms (
    MentorshipID 					INT PRIMARY KEY AUTO_INCREMENT,
    Title 							VARCHAR(150),
    MentorID 						INT,
    Description 					TEXT,
    MaxStudents 					INT,
    StartDate 						DATE,
    EndDate 						DATE,
    FOREIGN KEY (MentorID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 34. MentorshipEnrollments table *****************************
-- ========================================================================================
-- Links students to mentorship programs.


CREATE TABLE MentorshipEnrollments (
    MentorshipID 					INT,
    StudentID 						INT,
    EnrolledAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (MentorshipID, StudentID),
    FOREIGN KEY (MentorshipID) REFERENCES MentorshipPrograms(MentorshipID),
    FOREIGN KEY (StudentID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 35. CareerPaths table ***************************************
-- ========================================================================================
-- Defines structured learning tracks (like "Full Stack Developer" or "Data Scientist").

CREATE TABLE CareerPaths (
    PathID 							INT PRIMARY KEY AUTO_INCREMENT,
    Name 							VARCHAR(150),
    Description 					TEXT,
    EstimatedDurationWeeks 			INT
);

-- ========================================================================================
-- ************************** 36. PathCourses table ***************************************
-- ========================================================================================
-- Maps specific courses to a career path, with recommended order.


CREATE TABLE PathCourses (
    PathID 							INT,
    CourseID 						INT,
    Sequence 						INT,
    PRIMARY KEY (PathID, CourseID),
    FOREIGN KEY (PathID) REFERENCES CareerPaths(PathID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- ========================================================================================
-- ************************** 37. UserCareerPaths table ***********************************
-- ========================================================================================
-- Tracks student enrollments in learning paths.


CREATE TABLE UserCareerPaths (
    UserID 							INT,
    PathID 							INT,
    EnrolledAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (UserID, PathID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (PathID) REFERENCES CareerPaths(PathID)
);

-- ========================================================================================
-- ************************** 38. APIKeys table *******************************************
-- ========================================================================================
-- For developers or partners to integrate with the platform programmatically.


CREATE TABLE APIKeys (
    APIKeyID 						INT PRIMARY KEY AUTO_INCREMENT,
    UserID 							INT,
    ApiKey 							VARCHAR(64) UNIQUE,
    Description 					TEXT,
    CreatedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    IsActive 						BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 39. SystemSettings table ************************************
-- ========================================================================================
-- Centralized app-level config flags (e.g., maintenance mode, payment gateway keys).


CREATE TABLE SystemSettings (
    SettingKey 						VARCHAR(100) PRIMARY KEY,
    SettingValue 					TEXT,
    UpdatedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ========================================================================================
-- ************************** 40. ActivityLogs table **************************************
-- ========================================================================================
-- Detailed logging for instructors/admins to monitor user activity (vs AuditLogs which are system-level).


CREATE TABLE ActivityLogs (
    LogID 							INT PRIMARY KEY AUTO_INCREMENT,
    UserID 							INT,
    CourseID 						INT,
    ActivityType 					VARCHAR(100),  -- e.g., "Watched Video", "Posted Review"
    Detail 							TEXT,
    ActivityTime 					DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- ========================================================================================
-- ************************** 41. DiscussionThreads table *********************************
-- ========================================================================================
-- Student/instructor forum discussions related to a course.


CREATE TABLE DiscussionThreads (
    ThreadID 						INT PRIMARY KEY AUTO_INCREMENT,
    CourseID 						INT,
    AuthorID 						INT,
    Title 							VARCHAR(200),
    Body 							TEXT,
    CreatedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (AuthorID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 42. ThreadReplies table *************************************
-- ========================================================================================
-- Replies to discussion threads.


CREATE TABLE ThreadReplies (
    ReplyID 						INT PRIMARY KEY AUTO_INCREMENT,
    ThreadID 						INT,
    AuthorID 						INT,
    Message 						TEXT,
    CreatedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ThreadID) REFERENCES DiscussionThreads(ThreadID),
    FOREIGN KEY (AuthorID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 43. ContentFlags table **************************************
-- ========================================================================================
-- Students flag inappropriate or low-quality content (for moderation).


CREATE TABLE ContentFlags (
    FlagID 							INT PRIMARY KEY AUTO_INCREMENT,
    ContentType 					ENUM('course', 'thread', 'reply', 'review'),
    ContentID 						INT,
    FlaggedBy 						INT,
    Reason 							TEXT,
    FlaggedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (FlaggedBy) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 44. RefundRequests table ************************************
-- ========================================================================================
-- Track refund claims for courses or bundles.


CREATE TABLE RefundRequests (
    RequestID 						INT PRIMARY KEY AUTO_INCREMENT,
    StudentID 						INT,
    CourseID 						INT, -- Nullable if bundle
    BundleID 						INT, -- Nullable if course
    Reason 							TEXT,
    Status 							ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    RequestedAt 					DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (BundleID) REFERENCES CourseBundles(BundleID)
);

-- ========================================================================================
-- ************************** 45. MarketingCampaigns table ********************************
-- ========================================================================================
-- Track marketing pushes, promo codes, or seasonal offers.


CREATE TABLE MarketingCampaigns (
    CampaignID 						INT PRIMARY KEY AUTO_INCREMENT,
    Name 							VARCHAR(150),
    Description 					TEXT,
    StartDate 						DATE,
    EndDate 						DATE,
    DiscountPercent 				DECIMAL(5,2),
    TargetGroup 					ENUM('all', 'new_users', 'inactive_users'),
    PromoCode 						VARCHAR(50) UNIQUE
);

-- ========================================================================================
-- ************************** 46. CampaignEnrollments table *******************************
-- ========================================================================================
-- Tracks which users claimed or used a promotion.


CREATE TABLE CampaignEnrollments (
    CampaignID 						INT,
    UserID 							INT,
    ClaimedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (CampaignID, UserID),
    FOREIGN KEY (CampaignID) REFERENCES MarketingCampaigns(CampaignID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 47. NewsletterSubscriptions table ***************************
-- ========================================================================================
-- Track opt-ins to platform email updates.


CREATE TABLE NewsletterSubscriptions (
    SubscriptionID 					INT PRIMARY KEY AUTO_INCREMENT,
    Email 							VARCHAR(150) UNIQUE,
    IsConfirmed 					BOOLEAN DEFAULT FALSE,
    SubscribedAt 					DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ========================================================================================
-- ************************** 48. ContentAnalytics table **********************************
-- ========================================================================================
-- Track course engagement at a detailed level.


CREATE TABLE ContentAnalytics (
    AnalyticsID 					INT PRIMARY KEY AUTO_INCREMENT,
    CourseID 						INT,
    ContentID 						INT,
    Views 							INT DEFAULT 0,
    AverageWatchTime	  			DECIMAL(6,2), -- in minutes
    LastAccessed 					DATETIME,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (ContentID) REFERENCES CourseContent(ContentID)
);

-- ========================================================================================
-- ************************** 49. UserRoles table *****************************************
-- ========================================================================================
-- Granular permission model beyond just student/instructor/admin (e.g., moderators, editors).


CREATE TABLE UserRoles (
    RoleID 							INT PRIMARY KEY AUTO_INCREMENT,
    RoleName 						VARCHAR(50) UNIQUE,
    Description 					TEXT
);

-- ========================================================================================
-- ************************** 50. UserRoleAssignments table *******************************
-- ========================================================================================
-- Assign one or more roles to users (many-to-many).


CREATE TABLE UserRoleAssignments (
    UserID 							INT,
    RoleID 							INT,
    AssignedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (UserID, RoleID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (RoleID) REFERENCES UserRoles(RoleID)
);

-- ========================================================================================
-- ************************** 51. Assignments table ***************************************
-- ========================================================================================
-- Allow instructors to assign homework/projects to students.


CREATE TABLE Assignments (	
    AssignmentID 					INT PRIMARY KEY AUTO_INCREMENT,
    CourseID 						INT,
    Title 							VARCHAR(150),
    Description 					TEXT,
    DueDate 						DATE,
    MaxScore 						DECIMAL(5,2),
    CreatedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- ========================================================================================
-- ************************** 52. AssignmentSubmissions table *****************************
-- ========================================================================================
-- Students submit work for instructor grading.


CREATE TABLE AssignmentSubmissions (
    SubmissionID 					INT PRIMARY KEY AUTO_INCREMENT,
    AssignmentID 					INT,
    StudentID 						INT,
    SubmissionURL 					TEXT,
    SubmittedAt 					DATETIME DEFAULT CURRENT_TIMESTAMP,
    Score 							DECIMAL(5,2),
    Feedback 						TEXT,
    FOREIGN KEY (AssignmentID) REFERENCES Assignments(AssignmentID),
    FOREIGN KEY (StudentID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 53. CourseLanguages table ***********************************
-- ========================================================================================
-- Supported languages for each course (for multilingual content).


CREATE TABLE CourseLanguages (
    CourseID 						INT,
    LanguageCode 					VARCHAR(10),
    IsPrimary 						BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (CourseID, LanguageCode),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- ========================================================================================
-- ************************** 54. Translations table **************************************
-- ========================================================================================
-- Content translations for multilingual support (can be applied to UI or course text).


CREATE TABLE Translations (
    TranslationID 					INT PRIMARY KEY AUTO_INCREMENT,
    LanguageCode 					VARCHAR(10),
    ContentType 					VARCHAR(50),  -- e.g., 'course', 'quiz', 'ui_label'
    ContentID 						INT,
    FieldName 						VARCHAR(50),
    TranslatedText 					TEXT
);

-- ========================================================================================
-- ************************** 55. CertificateTemplates table ******************************
-- ========================================================================================
-- Instructors/admins define custom certificate designs.


CREATE TABLE CertificateTemplates (
    TemplateID 						INT PRIMARY KEY AUTO_INCREMENT,
    Title 							VARCHAR(100),
    BackgroundImageURL 				TEXT,
    TextPositioning 				JSON,
    CreatedBy 						INT,
    CreatedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CreatedBy) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 56. CourseCertificates table ********************************
-- ========================================================================================
-- Track which certificate template a course uses (custom branding).


CREATE TABLE CourseCertificates (
    CourseID 						INT PRIMARY KEY,
    TemplateID 						INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (TemplateID) REFERENCES CertificateTemplates(TemplateID)
);

-- ========================================================================================
-- ************************** 57. InstructorCollaborators table ***************************
-- ========================================================================================
-- Support for co-instructors on a course (shared teaching roles).


CREATE TABLE InstructorCollaborators (
    CourseID 						INT,
    CollaboratorID 					INT,
    PRIMARY KEY (CourseID, CollaboratorID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (CollaboratorID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 58. CourseApprovalRequests table ****************************
-- ========================================================================================
-- Admins approve or reject course submissions before they go live.


CREATE TABLE CourseApprovalRequests (
    RequestID 						INT PRIMARY KEY AUTO_INCREMENT,
    CourseID 						INT,
    SubmittedBy 					INT,
    Status 							ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    Feedback 						TEXT,
    SubmittedAt 					DATETIME DEFAULT CURRENT_TIMESTAMP,
    ReviewedAt 						DATETIME,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (SubmittedBy) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 59. Leaderboard table ***************************************
-- ========================================================================================
-- Tracks top learners by course completions, quiz scores, or engagement.


CREATE TABLE Leaderboard (
    EntryID         				INT PRIMARY KEY AUTO_INCREMENT,
    StudentID       				INT,
    MetricType      				ENUM('course_completions', 'quiz_score', 'engagement'),
    Value          					DECIMAL(10,2),
    RankPosition    				INT,
    RecordedAt      				DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) 		REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 60. APIRateLimits table *************************************
-- ========================================================================================
-- Tracks how many requests a user/app can make (for public APIs or partner access).


CREATE TABLE APIRateLimits (
    APIKeyID 						INT,
    LimitPerHour 					INT,
    RequestsMade 					INT DEFAULT 0,
    LastReset 						DATETIME,
    PRIMARY KEY (APIKeyID),
    FOREIGN KEY (APIKeyID) REFERENCES APIKeys(APIKeyID)
);

-- ========================================================================================
-- ************************** 61. Webhooks table ******************************************
-- ========================================================================================
-- Trigger outbound events to external systems (e.g., Zapier, Slack, CRMs).


CREATE TABLE Webhooks (
    WebhookID 						INT PRIMARY KEY AUTO_INCREMENT,
    URL 							TEXT,
    EventType 						VARCHAR(100),  -- e.g., "payment_success", "course_completed"
    IsActive 						BOOLEAN DEFAULT TRUE,
    CreatedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ========================================================================================
-- ************************** 62. WebhookLogs table ***************************************
-- ========================================================================================
-- Log webhook deliveries (for retries/debugging).


CREATE TABLE WebhookLogs (
    LogID 							INT PRIMARY KEY AUTO_INCREMENT,
    WebhookID 						INT,
    Payload 						JSON,
    ResponseCode 					INT,
    DeliveredAt 					DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (WebhookID) 		REFERENCES Webhooks(WebhookID)
);

-- ========================================================================================
-- ************************** 63. ScheduledJobs table *************************************
-- ========================================================================================
-- Track background or cron jobs (e.g., daily reports, email digests).


CREATE TABLE ScheduledJobs (
    JobID 							INT PRIMARY KEY AUTO_INCREMENT,
    JobName 						VARCHAR(100),
    Status 							ENUM('pending', 'running', 'completed', 'failed'),
    StartedAt 						DATETIME,
    FinishedAt 						DATETIME,
    Logs 							TEXT
);

-- ========================================================================================
-- ************************** 64. AccessibilityReports table ******************************
-- ========================================================================================
-- Track compliance with accessibility standards (e.g., WCAG).


CREATE TABLE AccessibilityReports (
    ReportID 						INT PRIMARY KEY AUTO_INCREMENT,
    CourseID 						INT,
    CheckedBy 						INT,
    AccessibilityScore				DECIMAL(5,2), -- e.g., 87.50
    IssuesFound 					INT,
    ReportDate 						DATE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (CheckedBy) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 65. DataExports table ***************************************
-- ========================================================================================
-- Admins/users can request data exports (e.g., .csv of quiz results, grades).


CREATE TABLE DataExports (
    ExportID 						INT PRIMARY KEY AUTO_INCREMENT,
    RequestedBy 					INT,
    ExportType 						VARCHAR(100), -- e.g., "QuizResults", "CourseStats"
    FileURL 						TEXT,
    Status 							ENUM('processing', 'ready', 'failed') DEFAULT 'processing',
    RequestedAt 					DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (RequestedBy) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 66. BackupLogs table ****************************************
-- ========================================================================================
-- Track database backups (time, size, status).


CREATE TABLE BackupLogs (
    BackupID 						INT PRIMARY KEY AUTO_INCREMENT,
    Filename 						VARCHAR(255),
    FileSizeMB 						DECIMAL(10,2),
    Status 							ENUM('completed', 'failed'),
    BackupTime 						DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ========================================================================================
-- ************************** 67. AdminNotes table ****************************************
-- ========================================================================================
-- Allow internal staff/admins to write private notes on users (e.g., for trust/safety).


CREATE TABLE AdminNotes (
    NoteID 							INT PRIMARY KEY AUTO_INCREMENT,
    UserID 							INT,
    AdminID 						INT,
    Note 							TEXT,
    CreatedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (AdminID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 68. InternalDocs table **************************************
-- ========================================================================================
-- Internal documentation or SOPs for support staff, moderators, admins.


CREATE TABLE InternalDocs (
    DocID 							INT PRIMARY KEY AUTO_INCREMENT,
    Title 							VARCHAR(150),
    Body 							TEXT,
    Category 						VARCHAR(100),
    CreatedBy 						INT,
    CreatedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CreatedBy) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 69. ErrorLogs table *****************************************
-- ========================================================================================
-- Generic error/event logging for application diagnostics.


CREATE TABLE ErrorLogs (
    ErrorID 						INT PRIMARY KEY AUTO_INCREMENT,
    ErrorType 						VARCHAR(100),
    Message 						TEXT,
    StackTrace 						TEXT,
    LoggedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ========================================================================================
-- ************************** 70. DataPipelines table *************************************
-- ========================================================================================
-- ETL/ELT job metadata for syncing this platform with external BI or ML systems.


CREATE TABLE DataPipelines (
    PipelineID 						INT PRIMARY KEY AUTO_INCREMENT,
    Name 							VARCHAR(100),
    Source 							VARCHAR(100),     -- e.g., "MySQL", "API"
    Destination 					VARCHAR(100),     -- e.g., "BigQuery", "S3"
    Frequency 						ENUM('hourly', 'daily', 'weekly'),
    LastRun 						DATETIME,
    Status 							ENUM('active', 'paused') DEFAULT 'active'
);

-- ========================================================================================
-- ************************** 71. CertificationExams table ********************************
-- ========================================================================================
-- Track official high-stakes exams that require proctoring, separate from quizzes.


CREATE TABLE CertificationExams (
    ExamID 							INT PRIMARY KEY AUTO_INCREMENT,
    CourseID 						INT,
    Title 							VARCHAR(150),
    Description 					TEXT,
    PassingScore 					DECIMAL(5,2),
    DurationMinutes 				INT,
    ScheduledDate 					DATETIME,
    IsProctored 					BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- ========================================================================================
-- ************************** 72. ExamAttempts table **************************************
-- ========================================================================================
-- Track exam attempts per student.


CREATE TABLE ExamAttempts (
    AttemptID 						INT PRIMARY KEY AUTO_INCREMENT,
    ExamID 							INT,
    StudentID 						INT,
    Score 							DECIMAL(5,2),
    Passed 							BOOLEAN,
    AttemptedAt 					DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ExamID) REFERENCES CertificationExams(ExamID),
    FOREIGN KEY (StudentID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 73. Accreditations table ************************************
-- ========================================================================================
-- Track which courses are officially accredited and by whom.


CREATE TABLE Accreditations (
    AccreditationID 				INT PRIMARY KEY AUTO_INCREMENT,
    AccreditorName 					VARCHAR(150),
    CourseID 						INT,
    AccreditationDate 				DATE,
    ExpirationDate 					DATE,
    AccreditationDocURL 			TEXT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- ========================================================================================
-- ************************** 74. Resumes table *******************************************
-- ========================================================================================
-- Allow students to build and manage resumes within the platform.


CREATE TABLE Resumes (
    ResumeID 						INT PRIMARY KEY AUTO_INCREMENT,
    StudentID 						INT,
    Title 							VARCHAR(100),
    Summary 						TEXT,
    LastUpdated 					DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 75. ResumeEntries table *************************************
-- ========================================================================================
-- Education, experience, projects, skills linked to a resume.


CREATE TABLE ResumeEntries (
    EntryID 						INT PRIMARY KEY AUTO_INCREMENT,
    ResumeID 						INT,
    EntryType 						ENUM('education', 'experience', 'project', 'skill'),
    Title 							VARCHAR(150),
    Description 					TEXT,
    StartDate 						DATE,
    EndDate 						DATE,
    FOREIGN KEY (ResumeID) REFERENCES Resumes(ResumeID)
);

-- ========================================================================================
-- ************************** 76. EmployerPartners table **********************************
-- ========================================================================================
-- Companies that recruit from the platform or offer sponsorships.


CREATE TABLE EmployerPartners (
    EmployerID 						INT PRIMARY KEY AUTO_INCREMENT,
    CompanyName 					VARCHAR(150),
    Industry 						VARCHAR(100),
    WebsiteURL 						TEXT,
    IsActive 						BOOLEAN DEFAULT TRUE
);

-- ========================================================================================
-- ************************** 77. EmployerRequests table **********************************
-- ========================================================================================
-- Employers request student access, post jobs, or invite top performers.


CREATE TABLE EmployerRequests (
    RequestID 						INT PRIMARY KEY AUTO_INCREMENT,
    EmployerID 						INT,
    StudentID 						INT,
    RequestType 					ENUM('resume_review', 'job_interview', 'portfolio_request'),
    Status 							ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    RequestedAt 					DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (EmployerID) REFERENCES EmployerPartners(EmployerID),
    FOREIGN KEY (StudentID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 78. ABTests table *******************************************
-- ========================================================================================
-- Track A/B testing experiments (e.g., UI layouts, pricing models).


CREATE TABLE ABTests (
    TestID 							INT PRIMARY KEY AUTO_INCREMENT,
    TestName 						VARCHAR(150),
    VariationA 						VARCHAR(100),
    VariationB 						VARCHAR(100),
    StartDate 						DATE,
    EndDate 						DATE,
    MetricTracked 					VARCHAR(100)
);

-- ========================================================================================
-- ************************** 79. UserSurveys table ***************************************
-- ========================================================================================
-- Collect post-course feedback or onboarding survey answers.


CREATE TABLE UserSurveys (
    SurveyID 						INT PRIMARY KEY AUTO_INCREMENT,
    UserID 							INT,
    SurveyName 						VARCHAR(100),
    Question 						TEXT,
    Answer 							TEXT,
    SubmittedAt 					DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 80. MobileAppLogs table *************************************
-- ========================================================================================
-- Track actions taken in the mobile app (optional for Firebase-style logging).


CREATE TABLE MobileAppLogs (
    LogID 							INT PRIMARY KEY AUTO_INCREMENT,
    UserID 							INT,
    EventType				 		VARCHAR(100),
    DeviceInfo 						TEXT,
    EventTime 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 81. GamifiedChallenges table ********************************
-- ========================================================================================
-- Weekly team or solo learning challenges with rewards.


CREATE TABLE GamifiedChallenges (
    ChallengeID 					INT PRIMARY KEY AUTO_INCREMENT,
    Title 							VARCHAR(150),
    Description 					TEXT,
    StartDate 						DATE,
    EndDate 						DATE,
    ChallengeType 					ENUM('solo', 'team'),
    RewardPoints 					INT
);

-- ========================================================================================
-- ************************** 82. ReferralRewards table **********************************
-- ========================================================================================
-- Invite friends and earn credits/referrals.


CREATE TABLE ReferralRewards (
    ReferralID 						INT PRIMARY KEY AUTO_INCREMENT,
    ReferrerUserID 					INT,
    ReferredUserID 					INT,
    RewardAmount 					DECIMAL(8,2),
    RewardDate 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status 							ENUM('pending', 'awarded', 'revoked') DEFAULT 'pending',
    FOREIGN KEY (ReferrerUserID) REFERENCES Users(UserID),
    FOREIGN KEY (ReferredUserID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 83. ContentLicensing table **********************************
-- ========================================================================================
-- Licensing courses to other institutions or platforms.


CREATE TABLE ContentLicensing (
    LicenseID 						INT PRIMARY KEY AUTO_INCREMENT,
    CourseID 						INT,
    LicenseeName 					VARCHAR(150),
    LicenseStartDate				DATE,
    LicenseEndDate 					DATE,
    LicenseTerms 					TEXT,
    LicenseFee 						DECIMAL(10,2),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- ========================================================================================
-- ************************** 84. LearningStreaks table ***********************************
-- ========================================================================================
-- Daily learning streak tracking for users.


CREATE TABLE LearningStreaks (
    UserID 							INT PRIMARY KEY,
    CurrentStreak 					INT DEFAULT 0,
    LongestStreak 					INT DEFAULT 0,
    LastActiveDate 					DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 85. RegionalSettings table **********************************
-- ========================================================================================
-- Location-specific content or compliance rules.


CREATE TABLE RegionalSettings (
    RegionCode 						VARCHAR(10) PRIMARY KEY,
    RegionName 						VARCHAR(100),
    ComplianceRules 				TEXT,
    DefaultLanguage 				VARCHAR(10)
);

-- ========================================================================================
-- ************************** 86. FeatureFlags table **************************************
-- ========================================================================================
-- Toggle features on/off for testing or rollout.


CREATE TABLE FeatureFlags (
    FeatureName 					VARCHAR(100) PRIMARY KEY,
    IsEnabled 						BOOLEAN DEFAULT FALSE,
    Description 					TEXT,
    CreatedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt 						DATETIME
);

-- ========================================================================================
-- ************************** 87. AIModelTrainingLogs table *******************************
-- ========================================================================================
-- Logs for training AI recommendation or analytics models.


CREATE TABLE AIModelTrainingLogs (
    TrainingID 						INT PRIMARY KEY AUTO_INCREMENT,
    ModelName 						VARCHAR(100),
    Version 						VARCHAR(20),
    TrainingStart 					DATETIME,
    TrainingEnd 					DATETIME,
    Accuracy 						DECIMAL(5,4),
    TrainingDataSize 				INT,
    Notes 							TEXT
);

-- ========================================================================================
-- ************************** 88. CDNAssets table *****************************************
-- ========================================================================================
-- Track versioned media or static files on a CDN.

CREATE TABLE CDNAssets (
    AssetID 						INT PRIMARY KEY AUTO_INCREMENT,
    FileName 						VARCHAR(255),
    Version 						VARCHAR(50),
    URL 							TEXT,
    UploadedAt 						DATETIME DEFAULT CURRENT_TIMESTAMP,
    FileSizeBytes 					BIGINT,
    ContentType 					VARCHAR(100)
);

-- ========================================================================================
-- ************************** 89. VoiceTranscripts table **********************************
-- ========================================================================================
-- Speech-to-text transcripts of video/audio lectures.


CREATE TABLE VoiceTranscripts (
    TranscriptID 					INT PRIMARY KEY AUTO_INCREMENT,
    ContentID 						INT,
    TranscriptText 					LONGTEXT,
    GeneratedAt 					DATETIME DEFAULT CURRENT_TIMESTAMP,
    Accuracy 						DECIMAL(5,2),
    FOREIGN KEY (ContentID) REFERENCES CourseContent(ContentID)
);

-- ========================================================================================
-- ************************** 90. AuditTrailVersions table ********************************
-- ========================================================================================
-- Historical snapshots of important data rows (for auditing).


CREATE TABLE AuditTrailVersions (
    AuditID 						INT PRIMARY KEY AUTO_INCREMENT,
    TableName 						VARCHAR(100),
    RecordID 						INT,
    ChangedBy 						INT,
    ChangeType 						ENUM('INSERT', 'UPDATE', 'DELETE'),
    ChangeTimestamp 				DATETIME DEFAULT CURRENT_TIMESTAMP,
    OldData 						JSON,
    NewData 						JSON,
    FOREIGN KEY (ChangedBy) REFERENCES Users(UserID)
);

-- ========================================================================================
-- ************************** 91. UserPoints table ****************************************
-- ======================================================================================== 

CREATE TABLE UserPoints (
    PointID        INT PRIMARY KEY AUTO_INCREMENT,
    UserID         INT,
    Points         INT,
    Reason         VARCHAR(255),
    Source         ENUM('referral', 'course_completion', 'quiz_score', 'achievement', 'manual', 'other') DEFAULT 'other',
    CreatedAt      DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
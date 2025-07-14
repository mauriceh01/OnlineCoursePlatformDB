-- ========================================================================================================================================
-- Maurice Hazan
-- July 12, 2025
-- OnlinCoursePlatformDB data inserts
-- =========================================================================================================================================


USE OnlineCoursePlatformDB;

INSERT INTO Users (FullName, Email, PasswordHash, Role)
VALUES
('Alice Johnson', 'alice@example.com', 'hashed_pw_1', 'instructor'),
('Bob Smith', 'bob@example.com', 'hashed_pw_2', 'student'),
('Carol Lee', 'carol@example.com', 'hashed_pw_3', 'student'),
('David Brown', 'david@example.com', 'hashed_pw_4', 'admin'),
('Emma Davis', 'emma@example.com', 'hashed_pw_5', 'instructor'),
(7, 'Fiona Greene', 'fiona.greene@example.com', 'hashed_pw_7', 'student', '2025-07-12 11:06:13'),
(8, 'George Martinez', 'george.martinez@example.com', 'hashed_pw_8', 'student', '2025-07-12 11:06:13'),
(9, 'Hannah White', 'hannah.white@example.com', 'hashed_pw_9', 'instructor', '2025-07-12 11:06:13'),
(10, 'Ian Black', 'ian.black@example.com', 'hashed_pw_10', 'student', '2025-07-12 11:06:13'),
(11, 'Julia Kim', 'julia.kim@example.com', 'hashed_pw_11', 'student', '2025-07-12 11:06:13'),
(12, 'Kevin Chen', 'kevin.chen@example.com', 'hashed_pw_12', 'admin', '2025-07-12 11:06:13'),
(13, 'Laura Moore', 'laura.moore@example.com', 'hashed_pw_13', 'instructor', '2025-07-12 11:06:13'),
(14, 'Michael Nguyen', 'michael.nguyen@example.com', 'hashed_pw_14', 'student', '2025-07-12 11:06:13'),
(15, 'Natalie Perez', 'natalie.perez@example.com', 'hashed_pw_15', 'student', '2025-07-12 11:06:13'),
(16, 'Oscar Rivera', 'oscar.rivera@example.com', 'hashed_pw_16', 'student', '2025-07-12 11:06:13'),
(17, 'Priya Shah', 'priya.shah@example.com', 'hashed_pw_17', 'instructor', '2025-07-12 11:06:13'),
(18, 'Quinn Adams', 'quinn.adams@example.com', 'hashed_pw_18', 'student', '2025-07-12 11:06:13'),
(19, 'Rita Flores', 'rita.flores@example.com', 'hashed_pw_19', 'student', '2025-07-12 11:06:13'),
(20, 'Steve Thomas', 'steve.thomas@example.com', 'hashed_pw_20', 'instructor', '2025-07-12 11:06:13'),
(21, 'Tina Zhang', 'tina.zhang@example.com', 'hashed_pw_21', 'admin', '2025-07-12 11:06:13'),
(22, 'Umar Ali', 'umar.ali@example.com', 'hashed_pw_22', 'student', '2025-07-12 11:06:13'),
(23, 'Vanessa Reed', 'vanessa.reed@example.com', 'hashed_pw_23', 'student', '2025-07-12 11:06:13'),
(24, 'William Scott', 'william.scott@example.com', 'hashed_pw_24', 'instructor', '2025-07-12 11:06:13'),
(25, 'Ximena Morales', 'ximena.morales@example.com', 'hashed_pw_25', 'student', '2025-07-12 11:06:13'),
(26, 'Yusuf Patel', 'yusuf.patel@example.com', 'hashed_pw_26', 'student', '2025-07-12 11:06:13'),
(27, 'Zoey Brooks', 'zoey.brooks@example.com', 'hashed_pw_27', 'student', '2025-07-12 11:06:13'),
(28, 'Aaron Miles', 'aaron.miles@example.com', 'hashed_pw_28', 'instructor', '2025-07-12 11:06:13'),
(29, 'Brielle Knight', 'brielle.knight@example.com', 'hashed_pw_29', 'student', '2025-07-12 11:06:13'),
(30, 'Carlos Vega', 'carlos.vega@example.com', 'hashed_pw_30', 'student', '2025-07-12 11:06:13'),
(31, 'Dana Simmons', 'dana.simmons@example.com', 'hashed_pw_31', 'student', '2025-07-12 11:06:13'),
(32, 'Elliot Foster', 'elliot.foster@example.com', 'hashed_pw_32', 'admin', '2025-07-12 11:06:13'),
(33, 'Fatima Hassan', 'fatima.hassan@example.com', 'hashed_pw_33', 'student', '2025-07-12 11:06:13'),
(34, 'Giovanni Rossi', 'giovanni.rossi@example.com', 'hashed_pw_34', 'student', '2025-07-12 11:06:13'),
(35, 'Haley Brooks', 'haley.brooks@example.com', 'hashed_pw_35', 'instructor', '2025-07-12 11:06:13'),
(36, 'Isaiah Wells', 'isaiah.wells@example.com', 'hashed_pw_36', 'student', '2025-07-12 11:06:13');




--  Courses

INSERT INTO Courses (InstructorID, Title, Description, Price, Level, Language, Status)
VALUES
(1, 'Introduction to Python', 'Learn Python from scratch.', 49.99, 'beginner', 'English', 'published'),
(1, 'Advanced Python Projects', 'Build real-world applications in Python.', 99.99, 'advanced', 'English', 'published'),
(5, 'Data Science Basics', 'Fundamentals of Data Science using Python.', 59.99, 'intermediate', 'English', 'published'),
(5, 'Machine Learning 101', 'An introduction to machine learning concepts.', 89.99, 'beginner', 'English', 'draft'),
(1, 'Flask Web Development', 'Create web apps using Flask framework.', 79.99, 'intermediate', 'English', 'archived'),
(9, 'JavaScript for Beginners', 'Start coding in JavaScript from the ground up.', 44.99, 'beginner', 'English', 'published'),
(13, 'Full Stack Web Development', 'Master frontend and backend development.', 129.99, 'advanced', 'English', 'published'),
(17, 'SQL & Database Design', 'Learn how to design and query databases using SQL.', 69.99, 'intermediate', 'English', 'published'),
(20, 'Introduction to Cybersecurity', 'Protect systems and networks from attacks.', 74.99, 'beginner', 'English', 'published'),
(24, 'DevOps Essentials', 'Learn CI/CD, automation, and deployment.', 89.99, 'intermediate', 'English', 'draft'),
(28, 'AI for Everyone', 'A non-technical introduction to AI.', 39.99, 'beginner', 'English', 'published'),
(35, 'React & Frontend Frameworks', 'Build dynamic UIs with React.js.', 84.99, 'intermediate', 'English', 'published'),
(1, 'Data Visualization with Python', 'Use Matplotlib and Seaborn for beautiful charts.', 59.99, 'intermediate', 'English', 'archived'),
(13, 'Git & GitHub Mastery', 'Master version control and collaboration tools.', 29.99, 'beginner', 'English', 'published'),
(5, 'Natural Language Processing', 'Intro to NLP techniques using Python.', 94.99, 'advanced', 'English', 'published'),
(20, 'Advanced SQL Analytics', 'Learn advanced SQL techniques.', 79.99, 'advanced', 'English', 'published'),
(24, 'Python for Data Science', 'Python and data workflows.', 69.99, 'intermediate', 'English', 'published'),
(28, 'AI in Education', 'Explore AI use in online learning.', 89.99, 'advanced', 'English', 'published'),
(17, 'Intro to Cybersecurity', 'Basics of online security.', 59.99, 'beginner', 'English', 'published'),
(35, 'Machine Learning Foundations', 'ML theory and practice.', 99.99, 'advanced', 'English', 'published'),
(37, 'Business Communication Skills', 'Soft skills for professionals.', 49.99, 'beginner', 'English', 'published');


--  Categories

INSERT INTO Categories (Name)
VALUES
('Programming'),
('Data Science'),
('Machine Learning'),
('Web Development'),
('Python'),
('Cybersecurity'),
('Cloud Computing'),
('Artificial Intelligence'),
('DevOps'),
('Mobile Development'),
('UI/UX Design'),
('Databases'),
('Project Management'),
('Blockchain'),
('Software Testing');


--  CourseCategories (many-to-many relationships)

INSERT INTO CourseCategories (CourseID, CategoryID)
VALUES
(1, 1),  -- Intro to Python -> Programming
(1, 5),  -- Intro to Python -> Python
(2, 1),  -- Advanced Python -> Programming
(2, 5),  -- Advanced Python -> Python
(3, 2),  -- Data Science Basics -> Data Science
(3, 5),  -- Data Science Basics -> Python
(4, 3),  -- ML 101 -> Machine Learning
(4, 2),  -- ML 101 -> Data Science
(5, 1),  -- Flask -> Programming
(5, 4),  -- Flask -> Web Development
(2, 3),   -- Advanced Python -> Machine Learning
(3, 1),   -- Data Science Basics -> Programming
(4, 5),   -- Machine Learning 101 -> Python
(5, 5),   -- Flask Web Development -> Python
(1, 2),   -- Intro to Python -> Data Science
(2, 2),   -- Advanced Python -> Data Science
(3, 7),   -- Data Science Basics -> Databases
(4, 10),  -- ML 101 -> Software Testing
(5, 6),   -- Flask -> UI/UX Design
(5, 9);   -- Flask -> Blockchain (as a test mapping)


 -- 5. Enrollments

INSERT INTO Enrollments (CourseID, StudentID, CompletionStatus)
VALUES
(1, 2, 'completed'),
(1, 3, 'in_progress'),
(2, 2, 'dropped'),
(3, 3, 'in_progress'),
(4, 3, 'in_progress'),
(2, 6, 'completed'),
(3, 6, 'in_progress'),
(5, 2, 'in_progress'),
(4, 6, 'dropped'),
(1, 6, 'completed'),
(5, 3, 'completed'),
(2, 3, 'in_progress'),
(3, 2, 'completed'),
(4, 2, 'in_progress'),
(5, 6, 'in_progress');

--  6. CourseContent

INSERT INTO CourseContent (CourseID, Title, ContentType, URL, Duration, SortOrder)
VALUES
(1, 'Getting Started with Python', 'video', 'https://example.com/python-intro', 10, 1),
(1, 'Variables and Data Types', 'article', 'https://example.com/python-variables', 5, 2),
(1, 'Python Basics Quiz', 'quiz', '', 0, 3),
(2, 'Advanced Functions', 'video', 'https://example.com/adv-functions', 20, 1),
(3, 'Intro to Data Science', 'article', 'https://example.com/data-science-basics', 8, 1),
(1, 'Control Flow in Python', 'video', 'https://example.com/control-flow', 12, 4),
(1, 'Loops and Iterations', 'article', 'https://example.com/loops', 6, 5),
(1, 'Functions in Python', 'video', 'https://example.com/functions', 15, 6),
(2, 'Decorators and Generators', 'article', 'https://example.com/decorators', 7, 2),
(2, 'Project: Build a CLI App', 'video', 'https://example.com/cli-project', 25, 3),
(3, 'Data Science with Pandas', 'video', 'https://example.com/pandas', 18, 2),
(3, 'Cleaning Data', 'article', 'https://example.com/cleaning-data', 10, 3),
(3, 'Quiz: Data Science Basics', 'quiz', '', 0, 4),
(4, 'Supervised vs Unsupervised Learning', 'video', 'https://example.com/ml-types', 14, 1),
(5, 'Flask Setup and Routing', 'video', 'https://example.com/flask-routing', 16, 2);



--  7. Quizzes
-- Assume only the 3rd content item (ContentID = 3) is a quiz:


INSERT INTO Quizzes (ContentID, Question, OptionA, OptionB, OptionC, OptionD, CorrectOption)
VALUES
(3, 'Which of the following is a valid variable name in Python?', 
 '2var', 'var_2', 'var-2', 'var 2', 'B'),
(1, 'What is the output of print(2 ** 3)?', '5', '6', '8', '9', 'C'),
(2, 'Which keyword is used to create a function in Python?', 'func', 'def', 'function', 'define', 'B'),
(3, 'Which of the following is a valid variable name in Python?', '2var', 'var_2', 'var-2', 'var 2', 'B'),
(4, 'What does the len() function do?', 'Returns length of an object', 'Prints the object', 'Deletes an object', 'None of the above', 'A'),
(5, 'How do you start a comment in Python?', '//', '#', '--', '/*', 'B'),
(6, 'Which data type is immutable?', 'list', 'dict', 'set', 'tuple', 'D'),
(7, 'What will be the output of: bool("")?', 'True', 'False', 'None', 'Error', 'B'),
(8, 'Which operator is used for string concatenation?', '+', '*', '&', '|', 'A'),
(9, 'What does the range(5) function produce?', '0 to 5', '1 to 5', '0 to 4', '1 to 4', 'C'),
(10, 'Which method adds an element to the end of a list?', 'append()', 'add()', 'insert()', 'extend()', 'A');
 
--  8. QuizResults

INSERT INTO QuizResults (StudentID, QuizID, SelectedOption, IsCorrect)
VALUES
(2, 1, 'B', TRUE),
(3, 1, 'A', FALSE);

INSERT INTO QuizResults (StudentID, QuizID, SelectedOption, IsCorrect)
VALUES
(6, 1, 'B', TRUE),
(6, 2, 'C', FALSE),
(2, 3, 'A', TRUE),
(3, 1, 'D', TRUE),
(3, 4, 'C', FALSE),
(6, 5, 'A', TRUE),
(2, 2, 'B', TRUE),
(3, 3, 'D', FALSE),
(6, 4, 'C', TRUE),
(2, 5, 'A', TRUE);



-- Bob Smith (5 quizzes)
INSERT INTO QuizResults (StudentID, QuizID, IsCorrect, AttemptedAt)
VALUES 
(1001, 1, TRUE, NOW() - INTERVAL 5 DAY),
(1001, 1, FALSE, NOW() - INTERVAL 5 DAY),
(1001, 2, TRUE, NOW() - INTERVAL 4 DAY),
(1001, 2, TRUE, NOW() - INTERVAL 4 DAY),
(1001, 3, TRUE, NOW() - INTERVAL 3 DAY);

-- Carol Lee (3 quizzes)
INSERT INTO QuizResults (StudentID, QuizID, IsCorrect, AttemptedAt)
VALUES 
(1002, 1, TRUE, NOW() - INTERVAL 3 DAY),
(1002, 1, FALSE, NOW() - INTERVAL 3 DAY),
(1002, 2, TRUE, NOW() - INTERVAL 2 DAY);

-- Bob Smith - 5 correct
INSERT INTO QuizResults (StudentID, QuizID, IsCorrect, AttemptedAt) VALUES
(1001, 1, TRUE, NOW()), (1001, 2, TRUE, NOW()), (1001, 3, TRUE, NOW()),
(1001, 4, TRUE, NOW()), (1001, 5, TRUE, NOW());

-- Emma Davis - 3 correct, 1 incorrect
INSERT INTO QuizResults (StudentID, QuizID, IsCorrect, AttemptedAt) VALUES
(5, 1, TRUE, NOW()), (5, 2, TRUE, NOW()), (5, 3, FALSE, NOW()), (5, 4, TRUE, NOW());

-- Carol Lee - 2 correct, 1 incorrect
INSERT INTO QuizResults (StudentID, QuizID, IsCorrect, AttemptedAt) VALUES
(1002, 1, TRUE, NOW()), (1002, 2, FALSE, NOW()), (1002, 3, TRUE, NOW());

-- Johnny Walker - 1 correct, 2 incorrect
INSERT INTO QuizResults (StudentID, QuizID, IsCorrect, AttemptedAt) VALUES
(6, 1, FALSE, NOW()), (6, 2, FALSE, NOW()), (6, 3, TRUE, NOW());

-- George Martinez - 2 correct
INSERT INTO QuizResults (StudentID, QuizID, IsCorrect, AttemptedAt) VALUES
(8, 1, TRUE, NOW()), (8, 2, TRUE, NOW());

-- Fiona Greene - 1 correct
INSERT INTO QuizResults (StudentID, QuizID, IsCorrect, AttemptedAt) VALUES
(7, 1, TRUE, NOW());

-- Ian Black - 3 correct, 4 incorrect
INSERT INTO QuizResults (StudentID, QuizID, IsCorrect, AttemptedAt) VALUES
(10, 1, TRUE, NOW()), (10, 2, FALSE, NOW()), (10, 3, FALSE, NOW()), (10, 4, TRUE, NOW()),
(10, 5, TRUE, NOW()), (10, 1, FALSE, NOW()), (10, 2, FALSE, NOW());

-- Hannah White - 2 correct, 2 incorrect
INSERT INTO QuizResults (StudentID, QuizID, IsCorrect, AttemptedAt) VALUES
(9, 1, TRUE, NOW()), (9, 2, FALSE, NOW()), (9, 3, TRUE, NOW()), (9, 4, FALSE, NOW());

-- Julia Kim - 1 incorrect
INSERT INTO QuizResults (StudentID, QuizID, IsCorrect, AttemptedAt) VALUES
(11, 1, FALSE, NOW());


INSERT INTO QuizResults (StudentID, QuizID, IsCorrect, AttemptedAt) VALUES
(3, 1, TRUE, NOW()), (3, 2, FALSE, NOW()), (3, 3, TRUE, NOW());




--  9. Reviews

INSERT INTO Reviews (CourseID, StudentID, Rating, Comment)
VALUES
(1, 2, 5, 'Great beginner course!'),
(1, 3, 4, 'Good course but some topics need more depth.'),
(2, 2, 2, 'Too advanced without enough explanation.');

--  10. Payments

INSERT INTO Payments (StudentID, CourseID, Amount, PaymentMethod)
VALUES
(2, 1, 49.99, 'credit_card'),
(3, 1, 49.99, 'paypal'),
(2, 2, 99.99, 'crypto'),
(3, 3, 59.99, 'credit_card'),
(1001, 100.00, CURDATE() - INTERVAL 2 DAY, 'credit_card', 'completed');


-- 11. Certificates
-- We'll only issue certificates for enrollments with status 'completed'.


-- Alice (StudentID 2) completed CourseID 1

INSERT INTO Certificates (EnrollmentID, IssuedDate, CertificateURL)
VALUES
(1, '2025-06-01', 'https://example.com/certificates/enroll_1_cert.pdf'),
(6, '2025-07-10', 'https://example.com/certificates/enroll6.pdf'),
(10, '2025-07-12', 'https://example.com/certificates/enroll10.pdf'),
(13, '2025-07-11', 'https://example.com/certificates/enroll13.pdf');



INSERT INTO Certificates (EnrollmentID, IssuedDate, CertificateURL)
VALUES
(6, '2025-08-05', 'https://example.com/certificates/advanced-python-bob.pdf'),
(10, '2025-08-18', 'https://example.com/certificates/flask-johnny.pdf'),
(1, '2025-08-25', 'https://example.com/certificates/capstone-bob.pdf'),
(2, '2025-07-15', 'https://example.com/certificates/python-intro-carol.pdf'),
(3, '2025-07-18', 'https://example.com/certificates/data-science-bob.pdf'),
(4, '2025-07-20', 'https://example.com/certificates/data-science-carol.pdf'),
(5, '2025-07-22', 'https://example.com/certificates/ml101-johnny.pdf'),
(7, '2025-07-25', 'https://example.com/certificates/flask-dev-bob.pdf'),
(8, '2025-07-28', 'https://example.com/certificates/adv-python-emma.pdf'),
(9, '2025-07-30', 'https://example.com/certificates/ml101-emma.pdf'),
(10, '2025-08-02', 'https://example.com/certificates/python-capstone-johnny.pdf'),
(11, '2025-08-05', 'https://example.com/certificates/data-science-basics-johnny.pdf'),
(12, '2025-08-07', 'https://example.com/certificates/web-dev-bob.pdf');




--  12. WatchProgress
-- Assuming students are watching content items from CourseID 1 and 3:


INSERT INTO WatchProgress (StudentID, ContentID, ProgressPercent)
VALUES
(2, 1, 100.00),  -- Alice completed video 1
(2, 2, 90.00),   -- Alice read article 1
(3, 1, 75.00),   -- Carol partially watched video 1
(3, 5, 30.00);   -- Carol started Data Science article

INSERT INTO WatchProgress (StudentID, ContentID, ProgressPercent)
VALUES
(6, 1, 100.00),
(6, 2, 80.50),
(2, 7, 55.75),
(6, 8, 95.00),
(3, 4, 100.00),
(2, 6, 20.00),
(3, 5, 88.25),
(2, 3, 72.40),
(6, 9, 40.00),
(3, 10, 63.70);

-- Bob Smith (10 videos)
INSERT INTO WatchProgress (StudentID, ContentID, ProgressPercent, LastWatchedAt)
SELECT 1001, ContentID, 100, NOW() - INTERVAL FLOOR(RAND() * 10) DAY
FROM CourseContent
LIMIT 10;

-- Carol Lee (7 videos)
INSERT INTO WatchProgress (StudentID, ContentID, ProgressPercent, LastWatchedAt)
SELECT 1002, ContentID, 100, NOW() - INTERVAL FLOOR(RAND() * 10) DAY
FROM CourseContent
LIMIT 7;



--  13. InstructorPayouts
-- Assume instructors earn 70% of the course price per sale:

-- Alice (InstructorID 1) teaches CourseID 1 and 2
-- Emma (InstructorID 5) teaches CourseID 3

INSERT INTO InstructorPayouts (InstructorID, CourseID, Amount, Status, PayoutDate)
VALUES
(1, 1, 34.99, 'paid', '2025-06-02'),     -- from Alice's course sold to 2 students
(1, 2, 69.99, 'pending', NULL),         -- 1 crypto sale
(5, 3, 41.99, 'paid', '2025-06-04');    -- Emma's course sold to Carol

--  14. Affiliates
-- Let’s say Bob (StudentID 2) and Emma (InstructorID 5) are also affiliates:


INSERT INTO Affiliates (UserID, ReferralCode, TotalEarnings)
VALUES
(2, 'BOB123', 9.99),
(5, 'EMMA77', 13.50);

--  15. AffiliateCommissions


-- Bob referred Carol who bought CourseID 3
-- Emma referred Bob who bought CourseID 1

INSERT INTO AffiliateCommissions (AffiliateID, CourseID, StudentID, Amount)
VALUES
(1, 3, 3, 9.99),   -- Bob earned from Carol
(2, 1, 2, 13.50);  -- Emma earned from Bob


-- 16. Notifications

INSERT INTO Notifications (UserID, Message, IsRead)
VALUES
(2, 'Your payment for "Introduction to Python" has been received.', TRUE),
(3, 'New quiz posted in "Data Science Basics".', FALSE),
(2, 'Certificate available for "Introduction to Python".', FALSE),
(5, 'Your course "Machine Learning 101" was published.', TRUE),
(4, 'ReferralRewardAwarded', 'User 4 was awarded $10.00 for referring User 7'),
(3, 'ReferralRewardAwarded', 'User 3 was awarded $15.00 for referring User 9'),
(7, 'ReferralRewardAwarded', 'User 7 was awarded $10.00 for referring User 12'),
(3, 'ReferralRewardAwarded', 'User 3 was awarded $15.00 for referring User 13'),
(2, 'ReferralRewardAwarded', 'User 2 was awarded $15.00 for referring User 16');



-- 17. CourseBundles


INSERT INTO CourseBundles (Title, Description, Price)
VALUES
('Python Mastery Pack', 'Complete Python track from beginner to advanced.', 129.99),
('Data Science Starter Kit', 'Bundle of essential data science courses.', 99.99);

--  18. BundleCourses
-- Assuming BundleID 1 = Python Mastery Pack, BundleID 2 = Data Science Starter Kit:


INSERT INTO BundleCourses (BundleID, CourseID)
VALUES
(1, 1),  -- Intro to Python
(1, 2),  -- Advanced Python
(2, 3),  -- Data Science Basics
(2, 4);  -- Machine Learning 101
--  19. BundlePurchases
-- Assuming StudentID 3 purchased the Data Science bundle:


INSERT INTO BundlePurchases (StudentID, BundleID, TotalAmount)
VALUES
(3, 2, 99.99);

--  20. CourseVersions

INSERT INTO CourseVersions (CourseID, VersionNote)
VALUES
(1, 'Added new video on Python 3.12 syntax.'),
(1, 'Updated quiz with new questions.'),
(3, 'Improved clarity in article content.'),
(5, 'Archived outdated Flask content.');

--  21. AIRecommendations


INSERT INTO AIRecommendations (StudentID, CourseID, Reason, Score)
VALUES
(2, 3, 'Based on your progress in Python, Data Science is a good next step.', 0.88),
(3, 2, 'You completed beginner Python — try advanced topics next.', 0.75),
(3, 5, 'We noticed interest in web dev — try Flask.', 0.65);


INSERT INTO Achievements (Title, Description, IconURL)
VALUES
('First Course Completed', 'Awarded after completing your first course.', 'https://example.com/icons/first-course.png'),
('Quiz Master', 'Scored 100% on a quiz.', 'https://example.com/icons/quiz-master.png'),
('Certified Learner', 'Earned a certificate.', 'https://example.com/icons/certificate.png'),
('Power Learner', 'Watched 10+ hours of content.', 'https://example.com/icons/power-learner.png'),
('Discussion Starter', 'Started your first discussion thread.', 'https://example.com/icons/discussion.png'),
('First Upvote', 'Received an upvote on your discussion post.', 'https://example.com/icons/upvote.png'),
('Quiz Streak', 'Completed 5 quizzes in a row.', 'https://example.com/icons/quiz-streak.png'),
('Streak Keeper', 'Logged in for 7 consecutive days.', 'https://example.com/icons/streak.png'),
('Early Bird', 'Completed a course before the due date.', 'https://example.com/icons/early-bird.png'),
('Certificate Collector', 'Earned 5 certificates.', 'https://example.com/icons/cert-collector.png'),
('Top Scorer', 'Ranked in the top 10 on the leaderboard.', 'https://example.com/icons/top-scorer.png'),
('Course Binger', 'Completed 3 courses in a single week.', 'https://example.com/icons/binge.png'),
('Active Commenter', 'Replied to 10 discussion threads.', 'https://example.com/icons/commenter.png'),
('Beta Tester', 'Used a beta feature during early access.', 'https://example.com/icons/beta.png'),
('Mentor Buddy', 'Participated in a mentorship program.', 'https://example.com/icons/mentor.png'),
('Bundle Explorer', 'Purchased a course bundle.', 'https://example.com/icons/bundle.png'),
('App Explorer', 'Logged in from the mobile app.', 'https://example.com/icons/mobile.png'),
('Fast Finisher', 'Completed a course in less than 2 days.', 'https://example.com/icons/fast.png'),
('Profile Complete', 'Filled out your full user profile.', 'https://example.com/icons/profile.png'),
('Team Player', 'Joined a team challenge.', 'https://example.com/icons/team.png'),
('Referral Champ', 'Referred 3 new learners.', 'https://example.com/icons/referral.png'),
('Bug Spotter', 'Reported a valid bug.', 'https://example.com/icons/bug.png'),
('Customizer', 'Changed your theme or layout settings.', 'https://example.com/icons/custom.png'),
('Quiz Grinder', 'Completed 20 quizzes across courses.', 'https://example.com/icons/grinder.png'),
('Referral Champion', 'Awarded for successfully referring a new user.', 'https://example.com/icons/referral-champion.png');


--  23. UserAchievements

INSERT INTO UserAchievements (UserID, AchievementID)
VALUES
(2, 1),  -- Alice: First Course Completed
(2, 2),  -- Alice: Quiz Master
(2, 3),  -- Alice: Certified Learner
(3, 1),  -- Carol: First Course Completed
(2, 4),  -- Alice: Power Learner
(3, 2),  -- Carol: Quiz Master
(3, 3),  -- Carol: Certified Learner
(3, 5),  -- Carol: Discussion Starter
(4, 1),  -- David: First Course Completed
(4, 2),  -- David: Quiz Master
(4, 4),  -- David: Power Learner
(5, 1),  -- Emma: First Course Completed
(5, 6),  -- Emma: Certificate Collector
(5, 11), -- Emma: Mentor Buddy
(6, 1),  -- Johnny: First Course Completed
(6, 7),  -- Johnny: Top Scorer
(6, 8),  -- Johnny: Course Binger
(7, 1),  -- User 7: First Course Completed
(7, 4),  -- User 7: Power Learner
(7, 9),  -- User 7: Active Commenter
(8, 1),  -- User 8: First Course Completed
(8, 5),  -- User 8: Discussion Starter
(8, 6),  -- User 8: Certificate Collector
(9, 2),  -- User 9: Quiz Master
(9, 10), -- User 9: Beta Tester
(10, 3), -- User 10: Certified Learner
(10, 12),-- User 10: Bundle Explorer
(11, 13),-- User 11: App Explorer
(11, 4), -- User 11: Power Learner
(12, 14),-- User 12: Fast Finisher
(13, 15),-- User 13: Profile Complete
(13, 1), -- User 13: First Course Completed
(14, 16),-- User 14: Team Player
(15, 17);-- User 15: Referral Champ

INSERT INTO UserAchievements (UserID, AchievementID)
VALUES
(4, 5),
(3, 5),
(7, 5),
(2, 5);



INSERT IGNORE INTO UserAchievements (UserID, AchievementID)
VALUES
(3, 3),
(2, 3),
(6, 3),
(5, 3);



--  24. Subscriptions

INSERT INTO Subscriptions (UserID, PlanName, Amount, BillingCycle, StartDate, EndDate)
VALUES
(2, 'All Access Monthly', 29.99, 'monthly', '2025-06-01', '2025-07-01'),
(3, 'All Access Yearly', 299.00, 'yearly', '2025-01-01', '2026-01-01'),
(4, 'All Access Monthly', 29.99, 'monthly', '2025-06-15', '2025-07-15'),
(5, 'All Access Yearly', 299.00, 'yearly', '2024-12-01', '2025-12-01'),
(6, 'Premium Monthly', 19.99, 'monthly', '2025-07-01', '2025-08-01'),
(7, 'Student Annual', 149.99, 'yearly', '2025-03-01', '2026-03-01'),
(8, 'All Access Monthly', 29.99, 'monthly', '2025-07-05', '2025-08-05'),
(9, 'All Access Monthly', 29.99, 'monthly', '2025-06-20', '2025-07-20'),
(10, 'Premium Yearly', 199.00, 'yearly', '2025-01-10', '2026-01-10'),
(11, 'All Access Monthly', 29.99, 'monthly', '2025-05-25', '2025-06-25'),
(12, 'All Access Monthly', 29.99, 'monthly', '2025-07-01', '2025-08-01'),
(13, 'Student Annual', 149.99, 'yearly', '2025-02-01', '2026-02-01'),
(4, 'All Access Monthly', 29.99, 'monthly', '2025-06-15', '2025-07-15'),
(5, 'All Access Yearly', 299.00, 'yearly', '2024-12-01', '2025-12-01'),
(6, 'Premium Monthly', 19.99, 'monthly', '2025-07-01', '2025-08-01'),
(7, 'Student Annual', 149.99, 'yearly', '2025-03-01', '2026-03-01'),
(8, 'All Access Monthly', 29.99, 'monthly', '2025-07-05', '2025-08-05'),
(9, 'All Access Monthly', 29.99, 'monthly', '2025-06-20', '2025-07-20'),
(10, 'Premium Yearly', 199.00, 'yearly', '2025-01-10', '2026-01-10'),
(11, 'All Access Monthly', 29.99, 'monthly', '2025-05-25', '2025-06-25'),
(12, 'All Access Monthly', 29.99, 'monthly', '2025-07-01', '2025-08-01'),
(13, 'Student Annual', 149.99, 'yearly', '2025-02-01', '2026-02-01');



-- 25. Tags

INSERT INTO Tags (TagName)
VALUES
('Python'),
('Machine Learning'),
('Data Science'),
('Flask'),
('Web Development');

INSERT INTO Tags (TagName)
VALUES
('Deep Learning'),
('AI'),
('SQL'),
('NoSQL'),
('Data Visualization'),
('Natural Language Processing'),
('Computer Vision'),
('APIs'),
('REST'),
('Django'),
('JavaScript'),
('HTML'),
('CSS'),
('React'),
('Node.js'),
('DevOps'),
('Cloud Computing'),
('AWS'),
('Azure'),
('Agile Development');


--  26. CourseTags

INSERT INTO CourseTags (CourseID, TagID)
VALUES
(1, 1),  -- Intro to Python → Python
(2, 1),  -- Advanced Python → Python
(3, 3),  -- Data Science → Data Science
(4, 2),  -- ML 101 → Machine Learning
(5, 4),  -- Flask → Flask
(5, 5);  -- Flask → Web Development


-- Intro to Python (CourseID: 1)
INSERT INTO CourseTags (CourseID, TagID)
VALUES
(1, 1),  -- Python
(1, 3),   -- Data Science
(1, 10),  -- JavaScript
(1, 11);  -- HTML

-- Advanced Python Projects (CourseID: 2)
INSERT INTO CourseTags (CourseID, TagID)
VALUES
(2, 1),   -- Python
(2, 2),   -- Machine Learning
(2, 6),   -- NLP
(2, 8);   -- APIs

-- Data Science Basics (CourseID: 3)
INSERT INTO CourseTags (CourseID, TagID)
VALUES
(3, 3),   -- Data Science
(3, 5),   -- Data Visualization
(3, 7),   -- Computer Vision
(3, 12);  -- CSS

-- Machine Learning 101 (CourseID: 4)
INSERT INTO CourseTags (CourseID, TagID)
VALUES
(4, 2),   -- Machine Learning
(4, 6),   -- NLP
(4, 1),   -- Python
(4, 15);  -- DevOps

-- Flask Web Development (CourseID: 5)
INSERT INTO CourseTags (CourseID, TagID)
VALUES
(5, 4),   -- Flask
(5, 5),   -- Web Development
(5, 9),   -- REST
(5, 13);  -- React




--  27. AuditLogs

INSERT INTO AuditLogs (UserID, ActionType, Description)
VALUES
(2, 'Login', 'User logged into the platform'),
(2, 'CompletedCourse', 'Completed "Introduction to Python"'),
(3, 'StartedQuiz', 'Started quiz on "Data Science Basics"'),
(5, 'PublishedCourse', 'Published new course "Machine Learning 101"'),


(2, 'ViewedContent', 'Watched "Getting Started with Python" video'),
(2, 'PostedComment', 'Commented on discussion thread for "Intro to Python"'),
(2, 'UpdatedProfile', 'Changed profile picture'),
(2, 'DownloadedCertificate', 'Downloaded certificate for "Intro to Python"'),

(3, 'ViewedContent', 'Read article "Variables and Data Types"'),
(3, 'AttemptedQuiz', 'Took quiz on "Python Basics"'),
(3, 'SavedCourse', 'Saved course "Machine Learning 101" to wishlist'),
(3, 'RatedCourse', 'Rated course "Data Science Basics" 4 stars'),

(4, 'CreatedUser', 'Created new user account for instructor Emily Green'),
(4, 'DeletedThread', 'Removed inappropriate discussion thread'),
(4, 'ApprovedCourse', 'Approved course "Flask Web Development"'),
(4, 'GeneratedReport', 'Exported student activity report'),

(5, 'UpdatedCourse', 'Updated course description for "Data Science Basics"'),
(5, 'AssignedQuiz', 'Linked new quiz to "Advanced Python Projects"'),
(5, 'HeldWebinar', 'Hosted webinar on "AI in Python"'),
(5, 'RespondedToTicket', 'Replied to support ticket from student Bob'),

(6, 'RegisteredWebinar', 'Signed up for "Flask Web Development" webinar'),
(6, 'StartedCourse', 'Began course "Machine Learning 101"'),
(6, 'JoinedDiscussion', 'Replied to thread about Flask tutorials'),
(6, 'SubmittedAssignment', 'Submitted assignment for "Advanced Functions"'),


(2, 'EarnedCertificate', 'User passed Advanced Python Certification'),
(6, 'EarnedCertificate', 'User passed Flask Web Development Certification'),
(2, 'EarnedCertificate', 'User passed Python Capstone Exam'),


(3, 'CertificateIssued', 'Issued certificate for course completion (EnrollmentID: 2)'),
(2, 'CertificateIssued', 'Issued certificate for course completion (EnrollmentID: 3)'),
(3, 'CertificateIssued', 'Issued certificate for course completion (EnrollmentID: 4)'),
(6, 'CertificateIssued', 'Issued certificate for course completion (EnrollmentID: 5)'),
(2, 'CertificateIssued', 'Issued certificate for course completion (EnrollmentID: 7)'),
(5, 'CertificateIssued', 'Issued certificate for course completion (EnrollmentID: 8)'),
(5, 'CertificateIssued', 'Issued certificate for course completion (EnrollmentID: 9)'),
(6, 'CertificateIssued', 'Issued certificate for course completion (EnrollmentID: 10)'),
(6, 'CertificateIssued', 'Issued certificate for course completion (EnrollmentID: 11)'),
(2, 'CertificateIssued', 'Issued certificate for course completion (EnrollmentID: 12)');



INSERT INTO SupportTickets (UserID, Subject, Message, Status)
VALUES
(2, 'Issue with Certificate', 'I completed the course but cannot download the certificate.', 'open'),
(3, 'Quiz not loading', 'The quiz on Data Science Basics is stuck on loading.', 'in_progress'),
-- Open ticket, no assignment yet
(2, 'Issue with course enrollment', 'I cannot enroll in Python course.', 'open', NOW() - INTERVAL 2 DAY, NULL, NULL, NULL),

-- In progress ticket assigned to user 3
(3, 'Quiz not submitting', 'I get an error when submitting quiz.', 'in_progress', NOW() - INTERVAL 5 DAY, 2, NULL, NULL),

-- Resolved ticket, handled by user 2
(2, 'Certificate not generated', 'I completed the course but no certificate was issued.', 'resolved', NOW() - INTERVAL 7 DAY, 3, NOW() - INTERVAL 2 DAY, 4.5),

-- Closed ticket, handled by user 3
(3, 'Cannot access premium content', 'I paid for the course but content is locked.', 'closed', NOW() - INTERVAL 10 DAY, 2, NOW() - INTERVAL 5 DAY, 4.0),

-- Resolved fast ticket, high rating
(2, 'Typo in video transcript', 'There are multiple spelling errors in the transcript.', 'resolved', NOW() - INTERVAL 3 DAY, 3, NOW() - INTERVAL 2 DAY, 5.0);



--  29. TicketReplies

INSERT INTO TicketReplies (TicketID, ResponderID, Message)
VALUES
(1, 4, 'Thanks for reporting. We have reissued your certificate. Please check again.'),
(2, 4, 'We are investigating the quiz loading issue and will update you shortly.');

-- Assumes ResponderID = 4 is an admin or support staff (David Brown from earlier inserts).

--  30. SavedCourses

INSERT INTO SavedCourses (StudentID, CourseID)
VALUES
(2, 3),  -- Alice saved Data Science Basics
(2, 4),  -- Alice saved Machine Learning 101
(3, 2);  -- Carol saved Advanced Python

--  31. Webinars

INSERT INTO Webinars (Title, Description, InstructorID, CourseID, ScheduledAt, DurationMinutes, WebinarURL)
VALUES
('Live Python Q&A', 'Ask anything about Python basics.', 1, 1, '2025-07-15 10:00:00', 60, 'https://example.com/webinars/python-qa'),
('Getting Started in Data Science', 'Intro webinar for aspiring data scientists.', 5, 3, '2025-07-20 14:00:00', 90, 'https://example.com/webinars/data-science-start');

--  32. WebinarRegistrations

INSERT INTO WebinarRegistrations (WebinarID, StudentID)
VALUES
(1, 2),  -- Alice registered for Python Q&A
(1, 3),  -- Carol registered for Python Q&A
(2, 3);  -- Carol registered for Data Science webinar

--  33. MentorshipPrograms

INSERT INTO MentorshipPrograms (Title, MentorID, Description, MaxStudents, StartDate, EndDate)
VALUES
('Advanced Python Mentorship', 1, 'Weekly 1-on-1 sessions for deep Python topics.', 3, '2025-07-10', '2025-08-10'),
('Data Science Career Track', 5, 'Group mentorship focusing on DS projects and portfolios.', 5, '2025-07-15', '2025-09-01');


-- 34. MentorshipEnrollments

INSERT INTO MentorshipEnrollments (MentorshipID, StudentID)
VALUES
(1, 2),  -- Alice joined Advanced Python Mentorship
(2, 3);  -- Carol joined Data Science Career Track

--  35. CareerPaths

INSERT INTO CareerPaths (Name, Description, EstimatedDurationWeeks)
VALUES
('Full Stack Developer', 'Track covering frontend, backend, and deployment.', 24),
('Data Scientist', 'Comprehensive path covering data analysis, ML, and visualization.', 20);

--  36. PathCourses

-- Full Stack Developer (PathID = 1)
INSERT INTO PathCourses (PathID, CourseID, Sequence)
VALUES
(1, 1, 1),  -- Intro to Python
(1, 5, 2);  -- Flask Web Development


-- Data Scientist (PathID = 2)
INSERT INTO PathCourses (PathID, CourseID, Sequence)
VALUES
(2, 1, 1),  -- Intro to Python
(2, 3, 2),  -- Data Science Basics
(2, 4, 3);  -- ML 101


--  37. UserCareerPaths

INSERT INTO UserCareerPaths (UserID, PathID)
VALUES
(2, 2),  -- Alice joined Data Scientist path
(3, 1);  -- Carol joined Full Stack Developer path

--  38. APIKeys

INSERT INTO APIKeys (UserID, ApiKey, Description)
VALUES
(4, 'e8b1f6c471f9df1c2a84b2d7a8d04f3bca2e6a2a4d93b7e1d918b8d58fa1324c', 'Admin panel access'),
(5, '67fc849cb94ce42be8aa172aa6ddbd74f3b84f7ef67d8f66a1c0215f3651183a', 'Emma\'s course analytics tool');

--  39. SystemSettings

INSERT INTO SystemSettings (SettingKey, SettingValue)
VALUES
('maintenance_mode', 'false'),
('default_currency', 'USD'),
('max_login_attempts', '5'),
('stripe_public_key', 'pk_test_1234567890'),
('enable_affiliates', 'true');

--  40. ActivityLogs

INSERT INTO ActivityLogs (UserID, CourseID, ActivityType, Detail)
VALUES
(2, 1, 'Watched Video', 'Watched "Getting Started with Python"'),
(2, 1, 'Posted Review', 'Left a 5-star review'),
(3, 3, 'Attempted Quiz', 'Tried the Data Science Basics quiz'),
(3, 2, 'Saved Course', 'Saved "Advanced Python Projects" to wishlist');


-- 41. DiscussionThreads

INSERT INTO DiscussionThreads (CourseID, AuthorID, Title, Body)
VALUES
(1, 2, 'Best Python IDEs for Beginners?', 'What editor or IDE do you recommend for someone just starting with Python?'),
(3, 3, 'Stuck on data wrangling section', 'I don’t understand how to reshape the dataset using pandas. Help?');

--  42. ThreadReplies


INSERT INTO ThreadReplies (ThreadID, AuthorID, Message)
VALUES
(1, 1, 'Try VS Code or PyCharm Community Edition — both are great for beginners.'),
(2, 5, 'You can use `melt` and `pivot_table` in pandas. Share your code?');

--  43. ContentFlags

INSERT INTO ContentFlags (ContentType, ContentID, FlaggedBy, Reason)
VALUES
('reply', 1, 3, 'The answer is incorrect and misleading.'),
('course', 4, 2, 'Outdated and not maintained.');

--  44. RefundRequests


-- Refund for CourseID 4 (ML 101), submitted by Carol
INSERT INTO RefundRequests (StudentID, CourseID, Reason, Status)
VALUES
(3, 4, 'The course was not as described and lacked depth.', 'pending');


-- Refund for BundleID 2 (Data Science Starter Kit), submitted by Alice
INSERT INTO RefundRequests (StudentID, BundleID, Reason, Status)
VALUES
(2, 2, 'Duplicate content already taken in individual courses.', 'pending');

--  45. MarketingCampaigns

INSERT INTO MarketingCampaigns (Name, Description, StartDate, EndDate, DiscountPercent, TargetGroup, PromoCode)
VALUES
('Summer Kickoff', 'Get 20% off all courses to start your summer learning!', '2025-07-01', '2025-07-31', 20.00, 'all', 'SUMMER20'),
('Welcome Bonus', 'Exclusive discount for new users.', '2025-06-01', '2025-12-31', 25.00, 'new_users', 'WELCOME25');

--  46. CampaignEnrollments

INSERT INTO CampaignEnrollments (CampaignID, UserID)
VALUES
(1, 2),  -- Alice used SUMMER20
(2, 3);  -- Carol used WELCOME25

--  47. NewsletterSubscriptions

INSERT INTO NewsletterSubscriptions (Email, IsConfirmed)
VALUES
('alice@example.com', TRUE),
('carol@example.com', TRUE),
('newuser@example.com', FALSE);

--  48. ContentAnalytics

INSERT INTO ContentAnalytics (CourseID, ContentID, Views, AverageWatchTime, LastAccessed)
VALUES
(1, 1, 120, 9.25, '2025-07-10 10:30:00'),
(1, 2, 85, 4.50, '2025-07-11 16:00:00'),
(3, 5, 65, 6.75, '2025-07-09 20:15:00');


-- 49. UserRoles

INSERT INTO UserRoles (RoleName, Description)
VALUES
('student', 'Default learner role with access to enroll and complete courses'),
('instructor', 'Can create and manage their own courses'),
('admin', 'Full platform administrative privileges'),
('moderator', 'Can manage discussions, flags, and user content');

--  50. UserRoleAssignments

INSERT INTO UserRoleAssignments (UserID, RoleID)
VALUES
(2, 1),  -- Alice is a student
(3, 1),  -- Carol is a student
(1, 2),  -- Alice Smith is an instructor
(5, 2),  -- Emma White is also an instructor
(4, 3);  -- David Brown is an admin

--  51. Assignments

INSERT INTO Assignments (CourseID, Title, Description, DueDate, MaxScore)
VALUES
(1, 'Python Project 1', 'Build a basic calculator using functions.', '2025-07-15', 100.00),
(3, 'Data Cleaning Task', 'Clean a raw dataset using pandas.', '2025-07-18', 50.00);

--  52. AssignmentSubmissions

INSERT INTO AssignmentSubmissions (AssignmentID, StudentID, SubmissionURL, Score, Feedback)
VALUES
(1, 2, 'https://example.com/submissions/alice_python_project1.zip', 92.50, 'Well done! Minor improvements needed on error handling.'),
(2, 3, 'https://example.com/submissions/carol_ds_cleaning.csv', 45.00, 'Great job! Watch out for missing values.');

--  53. CourseLanguages

-- Courses offered in multiple languages
INSERT INTO CourseLanguages (CourseID, LanguageCode, IsPrimary)
VALUES
(1, 'en', TRUE),
(1, 'es', FALSE),
(3, 'en', TRUE),
(3, 'fr', FALSE),
(5, 'en', TRUE),
(5, 'de', FALSE);

--  54. Translations
-- Translating CourseID 1 (title + description) to Spanish

INSERT INTO Translations (LanguageCode, ContentType, ContentID, FieldName, TranslatedText)
VALUES
('es', 'course', 1, 'Title', 'Introducción a Python'),
('es', 'course', 1, 'Description', 'Un curso para principiantes para aprender Python desde cero.'),

-- Translating CourseID 3 (title) to French
('fr', 'course', 3, 'Title', 'Principes de base de la science des données'),

-- UI label example
('fr', 'ui_label', 0, 'EnrollNow', 'Inscrivez-vous maintenant');

-- CertificateTemplates

INSERT INTO CertificateTemplates (Title, BackgroundImageURL, TextPositioning, CreatedBy)
VALUES
('Classic Blue Template', 'https://example.com/images/certificates/classic-blue.png', 
 '{"name": {"x": 300, "y": 200}, "date": {"x": 300, "y": 400}}', 1),
('Modern Minimalist', 'https://example.com/images/certificates/minimalist.png', 
 '{"name": {"x": 250, "y": 180}, "date": {"x": 250, "y": 360}}', 4);
 
--  56. CourseCertificates

INSERT INTO CourseCertificates (CourseID, TemplateID)
VALUES
(1, 1),  -- Intro to Python → Classic Blue Template
(3, 2);  -- Data Science Basics → Modern Minimalist

--  57. InstructorCollaborators

INSERT INTO InstructorCollaborators (CourseID, CollaboratorID)
VALUES
(3, 1),  -- Alice co-teaching Data Science Basics
(4, 5);  -- Emma assisting on Machine Learning 101

--  58. CourseApprovalRequests

INSERT INTO CourseApprovalRequests (CourseID, SubmittedBy, Status, Feedback, ReviewedAt)
VALUES
(4, 5, 'approved', 'Excellent structure and relevant content.', '2025-07-05 15:00:00'),
(5, 1, 'rejected', 'Missing assessments and needs more depth.', '2025-07-08 11:30:00');

-- 59. Leaderboard

INSERT INTO Leaderboard (StudentID, MetricType, Value, RankPosition)
VALUES
(2, 'course_completions', 5, 1),
(3, 'quiz_score', 92.50, 1),
(2, 'engagement', 480.00, 2);  -- minutes watched

-- 60. APIRateLimits

INSERT INTO APIRateLimits (APIKeyID, LimitPerHour, RequestsMade, LastReset)
VALUES
(1, 1000, 120, '2025-07-12 00:00:00'),
(2, 500, 75, '2025-07-12 00:00:00');

--  61. Webhooks

INSERT INTO Webhooks (URL, EventType)
VALUES
('https://hooks.example.com/zapier/payment', 'payment_success'),
('https://hooks.example.com/crm/course-complete', 'course_completed'),
('https://hooks.example.com/slack/enrollment', 'new_enrollment');


-- 62. WebhookLogs

INSERT INTO WebhookLogs (WebhookID, Payload, ResponseCode)
VALUES
(1, '{"payment_id": "abc123", "amount": 59.99, "status": "success"}', 200),
(2, '{"course_id": 3, "student_id": 2, "completed_at": "2025-07-11T15:20:00Z"}', 200),
(3, '{"enrollment_id": 45, "user_id": 3}', 500);

--  63. ScheduledJobs

INSERT INTO ScheduledJobs (JobName, Status, StartedAt, FinishedAt, Logs)
VALUES
('Daily Report Generation', 'completed', '2025-07-12 00:00:01', '2025-07-12 00:05:12', 'Report generated successfully.'),
('Weekly Email Digest', 'running', '2025-07-12 08:00:00', NULL, ''),
('Backup Database', 'failed', '2025-07-11 23:00:00', '2025-07-11 23:02:00', 'Backup process failed due to disk space.');
--  64. AccessibilityReports

INSERT INTO AccessibilityReports (CourseID, CheckedBy, AccessibilityScore, IssuesFound, ReportDate)
VALUES
(1, 4, 95.50, 3, '2025-07-01'),
(3, 5, 87.00, 7, '2025-07-08');
--  65. DataExports

INSERT INTO DataExports (RequestedBy, ExportType, FileURL, Status)
VALUES
(4, 'QuizResults', 'https://example.com/exports/quiz_results_2025_07_11.csv', 'ready'),
(2, 'CourseStats', 'https://example.com/exports/course_stats_2025_07_10.csv', 'processing');
--  66. BackupLogs

INSERT INTO BackupLogs (Filename, FileSizeMB, Status)
VALUES
('backup_2025_07_11.sql.gz', 145.23, 'completed'),
('backup_2025_07_10.sql.gz', 147.89, 'failed');

--  67. AdminNotes

INSERT INTO AdminNotes (UserID, AdminID, Note)
VALUES
(2, 4, 'User reported slow progress, offered additional mentoring support.'),
(3, 4, 'Flagged for potential cheating during quiz attempts.');

--  68. InternalDocs

INSERT INTO InternalDocs (Title, Body, Category, CreatedBy)
VALUES
('Password Reset Procedure', 'Steps to securely reset user passwords...', 'Support', 4),
('Content Moderation Guidelines', 'Criteria for reviewing flagged content...', 'Moderation', 5);


INSERT INTO ErrorLogs (ErrorType, Message, StackTrace)
VALUES
('DatabaseError', 'Failed to insert record into Enrollments.', 'Traceback (most recent call last): ...'),
('APIError', 'Timeout while calling external payment gateway.', 'TimeoutException at PaymentService.process()');

-- 70. DataPipelines

INSERT INTO DataPipelines (Name, Source, Destination, Frequency, LastRun, Status)
VALUES
('Daily User Activity Sync', 'MySQL', 'BigQuery', 'daily', '2025-07-12 02:00:00', 'active'),
('Real-time Payment Events', 'API', 'S3', 'hourly', '2025-07-12 09:00:00', 'active'),
('Weekly Backup Export', 'MySQL', 'S3', 'weekly', '2025-07-05 23:00:00', 'paused');

-- 71. CertificationExams

INSERT INTO CertificationExams (CourseID, Title, Description, PassingScore, DurationMinutes, ScheduledDate)
VALUES
(1, 'Python Fundamentals Certification', 'Official exam for Python fundamentals course.', 75.00, 90, '2025-08-01 09:00:00'),
(3, 'Data Science Certification Exam', 'Proctored certification exam for data science course.', 80.00, 120, '2025-08-15 13:00:00'),
(2, 'Advanced Python Certification', 'Exam focused on advanced Python concepts including OOP, decorators, and performance.', 78.00, 105, '2025-08-05 10:00:00'),

(4, 'Machine Learning Proficiency Exam', 'Test covering fundamentals and algorithms in Machine Learning 101.', 82.00, 110, '2025-08-12 11:30:00'),

(5, 'Flask Web Development Certification', 'Certify your skills in developing web applications using Flask.', 77.00, 90, '2025-08-18 15:00:00'),

(1, 'Python Capstone Exam', 'Final comprehensive exam for Python mastery track.', 85.00, 120, '2025-08-25 09:30:00'),

(3, 'Data Science Final Assessment', 'Comprehensive assessment on statistics, Python, and data analysis.', 80.00, 100, '2025-08-30 14:00:00');


-- 72. ExamAttempts

INSERT INTO ExamAttempts (ExamID, StudentID, Score, Passed)
VALUES
(1, 2, 88.5, TRUE),
(1, 3, 72.0, FALSE),
(2, 3, 85.0, TRUE),
(1, 4, 91.0, TRUE),
(1, 5, 65.5, FALSE),
(1, 6, 78.0, TRUE),
(1, 7, 59.0, FALSE),
(1, 8, 80.5, TRUE),
(2, 2, 90.0, TRUE),
(2, 5, 69.5, FALSE),
(2, 6, 72.5, TRUE),
(2, 9, 68.0, FALSE),
(2, 10, 87.0, TRUE),
(3, 2, 70.0, TRUE),
(3, 3, 60.0, FALSE),
(3, 4, 95.0, TRUE),
(3, 7, 77.0, TRUE),
(3, 11, 55.0, FALSE),
(4, 5, 82.0, TRUE),
(4, 6, 79.0, TRUE),
(4, 8, 63.5, FALSE),
(4, 9, 88.5, TRUE),
(4, 10, 91.0, TRUE);



-- 73. Accreditations

INSERT INTO Accreditations (AccreditorName, CourseID, AccreditationDate, ExpirationDate, AccreditationDocURL)
VALUES
('International Computing Association', 1, '2024-01-15', '2027-01-14', 'https://example.com/accreditations/ica_python.pdf'),
('Global Data Science Board', 3, '2023-06-01', '2026-06-01', 'https://example.com/accreditations/gdsb_datascience.pdf');

-- 74. Resumes

INSERT INTO Resumes (StudentID, Title, Summary)
VALUES
(2, 'Data Analyst Resume', 'Experienced data analyst skilled in SQL, Python, and Tableau. Seeking to leverage data to drive business insights.'),
(3, 'Aspiring Software Developer', 'Passionate about software development with projects in Python and JavaScript. Completed multiple certifications.');


-- 75. ResumeEntries


INSERT INTO ResumeEntries (ResumeID, EntryType, Title, Description, StartDate, EndDate)
VALUES
(1, 'education', 'Bachelor of Science in Data Analytics', 'Studied data wrangling, statistics, and machine learning.', '2019-09-01', '2023-05-15'),
(1, 'experience', 'Data Analyst Intern at TechNova', 'Worked on customer churn analysis using Python and SQL.', '2022-06-01', '2022-08-31'),
(1, 'project', 'E-Commerce Dashboard', 'Built an interactive dashboard using Tableau and MySQL.', '2023-01-01', '2023-03-01'),
(2, 'skill', 'Python Programming', 'Proficient in Python for data manipulation and scripting.', NULL, NULL);


--  76. EmployerPartners


INSERT INTO EmployerPartners (CompanyName, Industry, WebsiteURL)
VALUES
('TechNova Solutions', 'Technology', 'https://www.technovasolutions.com'),
('HealthInsights Inc.', 'Healthcare Analytics', 'https://www.healthinsights.io'),
('FinEdge Capital', 'Finance', 'https://www.finedgecapital.com');

--  77. EmployerRequests

INSERT INTO EmployerRequests (EmployerID, StudentID, RequestType)
VALUES
(1, 2, 'job_interview'),
(2, 3, 'resume_review'),
(3, 2, 'portfolio_request');

--  78. ABTests

INSERT INTO ABTests (TestName, VariationA, VariationB, StartDate, EndDate, MetricTracked)
VALUES
('Landing Page CTA', 'Blue Button', 'Green Button', '2025-07-01', '2025-07-10', 'ClickThroughRate'),
('Course Pricing Model', 'One-Time Payment', 'Subscription', '2025-07-05', '2025-07-20', 'ConversionRate');

--  79. UserSurveys

INSERT INTO UserSurveys (UserID, SurveyName, Question, Answer)
VALUES
(2, 'Course Feedback: Python Basics', 'How would you rate the course content?', 'Excellent'),
(3, 'Onboarding Survey', 'What is your main goal using this platform?', 'To become a data scientist');

--  80. MobileAppLogs


INSERT INTO MobileAppLogs (UserID, EventType, DeviceInfo)
VALUES
(2, 'Login', 'Android - Pixel 6 - OS 13'),
(3, 'Completed Quiz', 'iPhone 13 Pro - iOS 17.4'),
(2, 'Watched Video', 'Android - Samsung Galaxy S21');

--  81. GamifiedChallenges

INSERT INTO GamifiedChallenges (Title, Description, StartDate, EndDate, ChallengeType, RewardPoints)
VALUES
('7-Day Learning Streak', 'Complete any lesson daily for 7 consecutive days.', '2025-07-10', '2025-07-17', 'solo', 100),
('Team Code Sprint', 'Form a team and complete 5 coding projects in a week.', '2025-07-15', '2025-07-22', 'team', 250);


--  82. ReferralRewards

INSERT INTO ReferralRewards (ReferrerUserID, ReferredUserID, RewardAmount, Status)
VALUES
(2, 4, 10.00, 'awarded'),
(3, 5, 15.00, 'pending'),
(2, 6, 10.00, 'revoked'),
(4, 7, 10.00, 'awarded'),
(5, 8, 10.00, 'pending'),
(3, 9, 15.00, 'awarded'),
(2, 10, 10.00, 'pending'),
(6, 11, 20.00, 'revoked'),
(7, 12, 10.00, 'awarded'),
(3, 13, 15.00, 'awarded'),
(5, 14, 10.00, 'pending'),
(4, 15, 10.00, 'revoked'),
(2, 16, 15.00, 'awarded');


--  83. ContentLicensing

INSERT INTO ContentLicensing (CourseID, LicenseeName, LicenseStartDate, LicenseEndDate, LicenseTerms, LicenseFee)
VALUES
(1, 'State University Online', '2025-01-01', '2026-01-01', 'One-year use with attribution required.', 5000.00),
(2, 'Global Learn Co.', '2025-03-01', '2026-03-01', 'Non-exclusive rights to distribute content globally.', 3200.00),
(3, 1, 'University of Techville', CURDATE() - INTERVAL 30 DAY, CURDATE() + INTERVAL 10 DAY, 'Standard 1-year license', 5000.00),
(4, 2, 'DataCorp Ltd.', CURDATE() - INTERVAL 15 DAY, CURDATE() + INTERVAL 25 DAY, 'Annual access with auto-renewal', 8000.00),
(5, 3, 'Global Learning Partners', CURDATE() - INTERVAL 5 DAY, CURDATE() + INTERVAL 59 DAY, '6-month licensing agreement', 6200.00),

(1, 'University of Techville', CURDATE() - INTERVAL 30 DAY, CURDATE() + INTERVAL 10 DAY, 'Standard 1-year license', 5000.00),
(2, 'DataCorp Ltd.', CURDATE() - INTERVAL 15 DAY, CURDATE() + INTERVAL 25 DAY, 'Annual access with auto-renewal', 8000.00),
(3, 'Global Learning Partners', CURDATE() - INTERVAL 5 DAY, CURDATE() + INTERVAL 59 DAY, '6-month licensing agreement', 6200.00),

-- Expired
(4, 'CyberTech Academy', CURDATE() - INTERVAL 180 DAY, CURDATE() - INTERVAL 10 DAY, '6-month agreement', 4000.00),
(5, 'AI World Institute', CURDATE() - INTERVAL 365 DAY, CURDATE() - INTERVAL 5 DAY, '1-year license', 9500.00),

-- Long-term active
(6, 'BusinessEdge Online', CURDATE() - INTERVAL 30 DAY, CURDATE() + INTERVAL 180 DAY, 'Corporate training license', 12000.00),
(1, 'TechBridge International', CURDATE() - INTERVAL 60 DAY, CURDATE() + INTERVAL 365 DAY, 'Multiyear contract', 20000.00),

-- Future license
(2, 'EduGlobal Ventures', CURDATE() + INTERVAL 90 DAY, CURDATE() + INTERVAL 180 DAY, 'Future pilot licensing', 6700.00),
-- Course 7: Full Stack Web Development
(7, 'TechBridge Academy', '2025-03-01', '2026-03-01', '1-year multi-seat license', 22000.00),

-- Course 8: SQL & Database Design
(8, 'University of Digital Tech', '2025-07-01', '2026-07-01', 'Standard institutional license', 16000.00),

-- Course 9: Introduction to Cybersecurity
(9, 'CyberGuard Inc.', '2025-01-01', '2025-12-31', 'Corporate annual license', 18000.00),

-- Course 10: DevOps Essentials
(10, 'CodeBase Academy', '2025-06-01', '2026-06-01', 'Team license', 14500.00),

-- Course 11: AI for Everyone
(11, 'EdAI International', '2025-05-15', '2026-05-15', 'AI learning package', 20000.00),

-- Course 12: React & Frontend Frameworks
(12, 'Frontend Masters', '2025-04-01', '2026-04-01', 'Frontend bootcamp license', 17500.00),

-- Course 13: Data Visualization with Python
(13, 'DataViz Academy', '2025-07-01', '2026-07-01', 'Data track license', 15500.00),

-- Course 14: Git & GitHub Mastery
(14, 'CodeVersion Training', '2025-08-01', '2026-08-01', 'Version control training', 8800.00),

-- Course 15: Natural Language Processing
(15, 'LanguageAI Learning', '2025-07-01', '2026-07-01', 'NLP developer license', 11200.00),

-- Course 22: Advanced SQL Analytics
(22, 'DataNexus Corp', '2025-05-01', '2026-05-01', 'SQL analytics license', 13800.00),

-- Course 23: Python for Data Science
(23, 'SciTech Institute', '2025-07-01', '2026-07-01', 'Data science bootcamp', 14800.00),

-- Course 24: AI in Education
(24, 'FutureEd Labs', '2025-07-01', '2026-07-01', 'AI in Ed research license', 17200.00),

-- Course 25: Intro to Cybersecurity
(25, 'SecureTech College', '2025-06-01', '2026-06-01', 'Cybersecurity intro package', 13200.00),

-- Course 26: Machine Learning Foundations
(26, 'MLStarter Academy', '2025-06-15', '2026-06-15', 'Foundational ML license', 16400.00),

-- Course 27: Business Communication Skills
(27, 'ProEdge University', '2025-05-15', '2026-05-15', 'Professional development license', 11900.00);





--  84. LearningStreaks

INSERT INTO LearningStreaks (UserID, CurrentStreak, LongestStreak, LastActiveDate)
VALUES
(2, 5, 10, '2025-07-11'),
(3, 3, 7, '2025-07-10'),
(4, 0, 6, '2025-07-06');

-- -- 85. RegionalSettings

INSERT INTO RegionalSettings (RegionCode, RegionName, ComplianceRules, DefaultLanguage)
VALUES
('US', 'United States', 'FERPA-compliant content access only.', 'en'),
('EU', 'European Union', 'GDPR applies. Data must be anonymized for analytics.', 'en'),
('IN', 'India', 'AICTE-compliance for professional certifications.', 'hi');

-- 86. FeatureFlags

INSERT INTO FeatureFlags (FeatureName, IsEnabled, Description, CreatedAt, UpdatedAt)
VALUES
('AI_Course_Recommendations', TRUE, 'Enable ML-driven course suggestions.', NOW(), NOW()),
('GamifiedDashboard', FALSE, 'Beta version of gamification-based dashboard.', NOW(), NULL),
('CertificateBadgeSystem', TRUE, 'Display badges on student profile upon certificate issuance.', NOW(), NOW());

-- 87. AIModelTrainingLogs

INSERT INTO AIModelTrainingLogs (ModelName, Version, TrainingStart, TrainingEnd, Accuracy, TrainingDataSize, Notes)
VALUES
('RecommendationEngine', 'v1.2', '2025-07-01 00:00:00', '2025-07-01 02:30:00', 0.8723, 50000, 'Trained with 2024 Q4 activity data.'),
('DropoutPrediction', 'v0.9', '2025-06-28 03:00:00', '2025-06-28 04:10:00', 0.7945, 30000, 'Used engagement, quiz scores, and login frequency.');

-- 88. CDNAssets

INSERT INTO CDNAssets (FileName, Version, URL, FileSizeBytes, ContentType)
VALUES
('intro_python.mp4', 'v1.0', 'https://cdn.lms.io/assets/videos/intro_python_v1.mp4', 105823423, 'video/mp4'),
('course_styles.css', 'v2.1', 'https://cdn.lms.io/assets/css/course_styles_v2.1.css', 24182, 'text/css'),
('logo.svg', 'v3.0', 'https://cdn.lms.io/assets/images/logo_v3.svg', 1234, 'image/svg+xml');

-- 89. VoiceTranscripts

INSERT INTO VoiceTranscripts (ContentID, TranscriptText, Accuracy)
VALUES
(1, 'Welcome to the Python course. In this lesson, we will learn about variables and data types...', 97.45),
(2, 'Today we are diving into SQL joins. Inner joins, outer joins, and self joins will be covered.', 94.88);

-- 90. AuditTrailVersions

INSERT INTO AuditTrailVersions (TableName, RecordID, ChangedBy, ChangeType, OldData, NewData)
VALUES
('Users', 2, 1, 'UPDATE', '{"FullName":"John Smith"}', '{"FullName":"John A. Smith"}'),
('Courses', 1, 2, 'DELETE', '{"Title":"Intro to Java"}', NULL),
('Courses', 3, 4, 'INSERT', NULL, '{"Title":"Deep Learning with TensorFlow"}');



-- 91 

INSERT INTO UserPoints (UserID, Points, Reason, Source)
VALUES
(2, 100, 'Completed Introduction to Python', 'course_completion'),
(3, 50, 'Scored 100% on quiz', 'quiz_score'),
(2, 150, 'Referral reward for user 4', 'referral'),
(3, 150, 'Referral reward for user 5', 'referral'),
(2, 50, 'Earned Referral Champion achievement', 'achievement');


# 🎓 Online Learning Platform Database

A full-featured relational SQL database designed to support a scalable, feature-rich online learning platform similar to Udemy, Coursera, or edX. This schema supports everything from core course delivery and student tracking to advanced features like gamification, AI-powered recommendations, certification exams, and compliance logging.

---

## 📌 Executive Summary

This project models a modern, enterprise-grade learning management system (LMS) with comprehensive support for:

- Course creation, multimedia content, enrollments, and quizzes.
- Payment systems, subscriptions, and promotional bundles.
- Gamification, achievements, leaderboards, and referral tracking.
- AI recommendations, accessibility compliance, audit trails, and support ticketing.
- Business intelligence features like data exports, error logging, ETL pipelines, and mobile analytics.
- Internal admin tooling, content moderation, and system-level feature flags.

Designed with over **90 normalized tables**, this schema captures all layers of platform functionality from user interaction to system automation, ensuring high extensibility and performance.

---

## 🚀 Key Features

- 👨‍🏫 **Multi-role user support**: Students, instructors, and admins
- 🎥 **Courses & multimedia content**: Videos, quizzes, and articles
- 📝 **Enrollments & completion tracking**
- 📊 **Quiz system**: Auto-scoring and analytics
- 🏆 **Achievements & leaderboards**: Engagement incentives
- 💳 **Subscriptions & bundles**: Monetization and upselling
- 📧 **Notifications, support tickets, and messaging**
- 🧠 **AI recommendations**: Personalized learning suggestions
- 🧾 **Certification exams**: Proctored, scored, and tracked
- 🎓 **Career paths & mentorships**: Structured learning tracks
- 🔒 **Audit logs, API keys, backups, and error tracking**
- 📱 **Mobile app logs & accessibility compliance**
- 🏷️ **Tagging, categories, and content flags for moderation**
- 📈 **Analytics dashboards, data exports, and system settings**

---

## 🧱 Database Structure Overview

**Total Tables:** 90+  
**Primary Modules:**

### 1. 🧑‍🎓 Users & Roles
- `Users`, `UserRoles`, `UserRoleAssignments`, `UserAchievements`, `UserPoints`, `AuditLogs`, `AdminNotes`

### 2. 📚 Courses & Content
- `Courses`, `Categories`, `CourseCategories`, `CourseContent`, `CourseLanguages`, `Translations`, `CourseCertificates`, `CertificateTemplates`, `InstructorCollaborators`, `CourseVersions`, `CourseApprovalRequests`, `Tags`, `CourseTags`

### 3. 📝 Quizzes & Exams
- `Quizzes`, `CertificationExams`, `ExamAttempts`, `Assignments`, `AssignmentSubmissions`

### 4. 👥 Enrollment & Learning
- `Enrollments`, `SavedCourses`, `UserCareerPaths`, `CareerPaths`, `PathCourses`, `LearningStreaks`

### 5. 💵 Payments & Plans
- `Payments`, `Subscriptions`, `CourseBundles`, `BundleCourses`, `BundlePurchases`, `ReferralRewards`, `MarketingCampaigns`, `CampaignEnrollments`, `RefundRequests`

### 6. 🧠 AI & Recommendations
- `AIRecommendations`, `AIModelTrainingLogs`

### 7. 🏅 Gamification
- `Achievements`, `UserAchievements`, `Leaderboard`, `GamifiedChallenges`

### 8. 📣 Communication & Support
- `Notifications`, `SupportTickets`, `TicketReplies`, `InternalDocs`

### 9. 🌐 Web & System Infrastructure
- `APIKeys`, `APIRateLimits`, `Webhooks`, `WebhookLogs`, `FeatureFlags`, `SystemSettings`, `ScheduledJobs`, `BackupLogs`, `ErrorLogs`, `AuditTrailVersions`

### 10. 📊 Analytics & Reports
- `ActivityLogs`, `ContentAnalytics`, `DataExports`, `AccessibilityReports`, `MobileAppLogs`, `VoiceTranscripts`, `DataPipelines`

### 11. 🤝 Employer & Outreach
- `EmployerPartners`, `EmployerRequests`, `ContentLicensing`, `Resumes`, `ResumeEntries`

### 12. 💬 Community
- `DiscussionThreads`, `ThreadReplies`, `ContentFlags`, `UserSurveys`

---
## ⚙️Technical Overview

The database uses MySQL-compatible SQL syntax and implements foreign key constraints for data integrity. ENUM types enforce controlled vocabularies. Timestamp defaults support audit trails. JSON fields store flexible data such as certificate text positioning and audit change snapshots.

The schema supports multi-tenancy and extensibility, enabling integration with external systems through APIs, webhooks, and data pipelines. It supports internationalization through language tables and translations.

---

## 🧪 Sample Data & Queries

> See the `/sql/seed/` folder for sample data insertion scripts and test queries including:
- Multi-course enrollments
- Quiz scoring and attempts
- Exam certifications
- Achievement triggers
- Subscription logic
- AI recommendation scoring
- Leaderboard ranking
- Payment and referral tracking

---
## 📊 Sample Analytical Reports (Views)

- Course Licensing & Revenue Dashboard (by Instructor)
- Top Performing Students (Across Quizzes, Achievements, and Streaks)
- User Engagement & Activity Overview
- Active Student Engagement Report
- Course Completion & Certification Summary
- Support Load & Satisfaction Metrics

---


## 📌 Project Goals

- ✅ Showcase advanced SQL data modeling skills
- ✅ Simulate real-world LMS functionality
- ✅ Demonstrate extensibility, modular design, and normalization
- ✅ Serve as a portfolio centerpiece for data-related job applications

---

## 💡 Business Use Cases

- Enable an educational platform to onboard instructors and students efficiently.  
- Manage course content lifecycle from creation, review, publishing, to versioning.  
- Track student learning progress, assessments, certifications, and achievements.  
- Facilitate monetization through direct course sales, bundles, subscriptions, and affiliate marketing.  
- Provide analytics and personalized recommendations for improved learning outcomes.  
- Support community engagement via forums, reviews, gamified challenges, and webinars.  
- Ensure regulatory compliance with accessibility reports and audit trails.  
- Support enterprise customers with employer partnerships and career services.  
- Maintain operational reliability with logging, backups, support tickets, and feature flagging.
  
---

## 🛠️ Tech Stack

- **Database:** MySQL (or compatible relational DBMS)  
- **Backend:** Any server-side language that supports SQL integration (e.g., Python/Flask, Node.js/Express)  
- **Frontend:** Web UI with HTML/CSS/JavaScript frameworks (React, Vue, Angular)  
- **APIs:** RESTful or GraphQL endpoints backed by this schema  
- **DevOps:** CI/CD pipelines, backups, and monitoring tools  
- **AI/ML:** External or internal services for recommendations and analytics  

---

## 📂 File Structure

```bash
/OnlineCoursePlatformDB
project-root/
├── app.py                         # Main Python Flask app
├── schema.sql                     # Full SQL schema (91 tables)
├── sample_data/                   # Sample INSERT scripts
│   ├── users.sql
│   ├── courses.sql
│   └── enrollments.sql
├── views/                         # Predefined SQL Views
│   └── vw_activestudentengagement.sql
|   └── vw_coursecompletionstats.sql
|   └── vw_courselicensingrevenue.sql
|   └── vw_supportperformancemetrics.sql
|   └── vw_topstudentachievements.sql
|   └── vw_userlearningengagementsummary.sql
├── procedures/                    # Stored procedures and triggers
│   └── sp_calculate_certificates.sql
├── reports/                       # Sample reporting queries
│   ├── 
│   └── 
├── templates/                     # HTML templates for web interface
│   ├── base.html
│   ├── dashboard.html
│   ├── login.html
│   ├── pdf_template.html
│   └── view.html
└── README.md                      # Project documentation


```
---
## 1. Flask Backend (`app.py`)

This is the main Python Flask application that:

- Manages user login/logout with session-based authentication.
- Connects securely to the MySQL database using PyMySQL.
- Dynamically fetches data from SQL views based on URL parameters.
- Renders data views with charts using Chart.js.
- Generates downloadable PDF reports from HTML templates using xhtml2pdf.
- Protects routes to ensure only authenticated users can access reports.
---
**Key Highlights:**

- Database config is stored in `DB_CONFIG` — update credentials before deployment.
- Login checks the `Users` table with email and password.
- Routes:
  - `/login` — User authentication page.
  - `/logout` — Clears session.
  - `/` — Dashboard landing page.
  - `/view/<view_name>` — Render SQL view data with dynamic charts.
  - `/pdf/<view_name>` — Generate and download PDF reports.
 
---
## 2. Base Template (`base.html`)

Provides the common page structure and styling for all pages:

- Uses Bootstrap 5.3 for styling and layout.
- Includes Bootstrap Icons and Chart.js libraries.
- Features a top dark navbar with dynamic user greeting and logout button.
- Contains a report selector dropdown for easy navigation among reports.
- Supports displaying flash messages styled with Bootstrap alerts.
- Contains a content block where child templates insert page-specific content.

---

## 3. Dashboard Page (`dashboard.html`)

The main landing page after login:

- Extends `base.html`.
- Displays a list-group menu linking to six key report views.
- Allows users to quickly navigate to reports like Course Licensing & Revenue, Top Students, Engagement Summaries, and Support Metrics.

---

## 4. Dynamic Report View (`view.html`)

Core template to display detailed report data:

- Extends `base.html`.
- Dynamically renders the report title from the SQL view name.
- Shows an **Export PDF** button for downloading the current report.
- Uses Chart.js to display multiple chart types (bar, line, radar) tailored to each report:
  - Course completion rates
  - Licensing revenue
  - Student achievements
  - Learning engagement
  - Active student activity
  - Support performance
- Automatically highlights the current report in the base dropdown.
- Renders a responsive HTML table with all report data.
- Shows a "No data found" message if empty.

---

## 5. Login Page (`login.html`)

User authentication page styled with Tailwind CSS:

- Responsive centered login form with gradient background.
- Displays error messages upon failed login attempts.
- Simple form with email and password fields.
- Styled login button with hover effects.
- Meant to be served by the `/login` route and integrate with Flask session management.

---

## 6. Simple Table View (`simple_view.html`)

An alternative minimal report view template:

- Extends `base.html`.
- Displays report title dynamically.
- Renders all data in a basic HTML table with minimal styling.
- Useful as a fallback or when JavaScript/charting is not required.
- Auto-formats column headers by replacing underscores and capitalizing.

---

### Prerequisites

- Python 3.7+
- MySQL server with `OnlineCoursePlatformDB` and relevant user privileges
- Required Python packages:

---

```bash
pip install Flask pymysql xhtml2pdf
Running the App
python app.py
Access the app at http://127.0.0.1:5000/
```

---
## Python Project Structure

1. **Flask Backend (`app.py`)**  
   Handles routing, authentication, database connection, and PDF generation.

2. **Base Template (`base.html`)**  
   Common page layout with navbar, report selector, and flash messages.

3. **Dashboard Page (`dashboard.html`)**  
   Landing page after login with quick links to reports.

4. **Dynamic Report View (`view.html`)**  
   Displays detailed reports with charts and tables.

5. **Login Page (`login.html`)**  
   User login form styled with Tailwind CSS.

6. **Simple Table View (`simple_view.html`)**  
   Minimal tabular data view without JavaScript or charts.

---

## 📃 License

This project is licensed under the MIT License.  
Feel free to use, adapt, or build upon this schema for educational, professional, or commercial purposes.

---

## 🔐 Compliance & Security

- Implements user roles and granular permissions with `UserRoles` and `UserRoleAssignments`.  
- Uses hashed passwords and secure authentication principles.  
- Tracks audit logs and activity logs for compliance and troubleshooting.  
- Supports GDPR compliance with data export requests and subscription confirmations.  
- Provides accessibility compliance tracking via `AccessibilityReports`.  
- Enables API rate limiting and key management to prevent abuse.  
- Stores error logs and backup logs to ensure system reliability.  
- Supports data privacy through role-based access and logging.  
- Facilitates secure payment processing with status tracking and refund management.

---

## 🙌 Acknowledgments

Built by Maurice Hazan July 11 - July 13, 2025 to model the future of scalable online learning systems.  
Inspired by leading LMS platforms and best practices in data architecture and edtech product design.

---


👨‍💻 Author:
Maurice Hazan:  mauriceh01@hotmail.com | www.LinkedIn.com/in/mohazan  
Database Architect 

💼 Portfolio includes: OnlineCoursePlatformDB, InsurancePolicyDB, JobMarketDB, HealthCareDB, RetailDB, NorthwindDB, JobBoardDB, CollegeTranscriptDB, FinancialPortfolioDB

⭐ Star This Project
If you find this database design helpful or inspirational, feel free to ⭐ star it on GitHub and share with fellow analysts or developers.

📬 Contact
For feedback, collaborations, or freelance opportunities, please reach out directly.

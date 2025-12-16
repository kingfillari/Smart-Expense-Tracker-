## Smart Expense Tracker 💰
A feature-rich, cross-platform expense tracking application built with Flutter. Track your spending, visualize your finances, and manage your budget with a beautiful, intuitive interface.
```bash
https://img.shields.io/badge/Flutter-3.38.5-blue.svg
https://img.shields.io/badge/Platform-Windows%2520%257C%2520Web%2520%257C%2520Android-brightgreen.svg
https://img.shields.io/badge/License-MIT-yellow.svg

## ✨ Features

📊 Core Functionality
Add & Manage Expenses: Record expenses with title, amount, category, date, and optional description

CRUD Operations: Full Create, Read, Update, Delete functionality for expenses

Categorization: Organize expenses by custom categories (Food, Transport, Shopping, etc.)

Search & Filter: Quickly find expenses by title, category, or date range

## 📈 Visualization & Insights
Interactive Charts: Beautiful pie charts showing spending distribution by category

Real-time Statistics: Dashboard displaying total spent, transaction count, and category breakdown

Monthly Tracking: View expenses filtered by specific months

## 🎨 User Experience
Clean Material Design: Modern, responsive UI following Material Design guidelines

Dark/Light Mode Ready: Built with theme support for different preferences

Intuitive Navigation: Easy-to-use interface with clear action buttons

Form Validation: Robust input validation with helpful error messages

## 💾 Data Management
Local SQLite Database: Secure, persistent local storage using sqflite

Cross-Platform Support: Works seamlessly on Windows desktop and web

Data Export Ready: Architecture supports future CSV/PDF export features

## 🚀 Getting Started
Prerequisites
Flutter SDK (≥ 3.0.0)

Visual Studio 2022+ with "Desktop development with C++" workload (for Windows builds)

Android Studio (optional, for Android builds)

VS Code (recommended) with Flutter and Dart extensions

Installation
Clone the repository

```bash
git clone https://github.com/kingfillari/Smart-Expense-Tracker-.git

cd smart_expense_tracker

Install dependencies

```bash
flutter pub get

Run the application

```bash
# For Windows desktop
flutter run -d windows

# For web
flutter run -d chrome

# For Android (requires Android SDK setup)
flutter run -d android
## 🏗️ Project Architecture

```bash
smart_expense_tracker/
├── lib/
│   ├── models/          # Data models (Expense, etc.)
│   ├── services/        # Database and API services
│   ├── repositories/    # Data access layer
│   ├── providers/       # State management (Provider)
│   ├── screens/         # Main UI pages
│   ├── widgets/         # Reusable UI components
│   └── main.dart        # Application entry point
├── assets/              # Images, fonts, icons
├── windows/             # Windows-specific configuration
└── pubspec.yaml         # Dependencies and metadata

## Key Dependencies
Package	Purpose	Version
provider	State management	^6.1.2
sqflite + sqflite_common_ffi	Local SQLite database	^2.4.0
fl_chart	Data visualization charts	^0.66.2
intl	Date/time formatting	^0.19.0
flutter_form_builder	Advanced form handling	^10.0.1
path_provider	Filesystem path utilities	^2.1.1
📱 Screens
Home Screen
Dashboard with spending summary

Interactive category pie chart

Search and filter functionality

List of recent expenses with edit/delete options

Add/Edit Expense Screen
Form for entering expense details

Category dropdown selection

Date picker for expense date

Form validation with error messages

## 🗄️ Database Schema
The application uses SQLite with the following schema:

```bash
sql
CREATE TABLE expenses(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  amount REAL NOT NULL,
  date TEXT NOT NULL,
  category TEXT NOT NULL,
  description TEXT
);

-- Indexes for performance
CREATE INDEX idx_date ON expenses(date);
CREATE INDEX idx_category ON expenses(category);
Database Location: C:\Users\[Username]\AppData\Roaming\smart_expense_tracker\expenses.db

🔧 Development
Building for Release
```bash
# Windows
flutter build windows --release

# Web
flutter build web --release

# Android
flutter build apk --release

### Code Structure Guidelines
Models: Define data structures and conversion methods

Services: Handle database operations and external APIs

Repositories: Mediate between services and providers

Providers: Manage application state and business logic

Screens: Main page layouts and navigation

Widgets: Reusable UI components

Adding New Features
New Database Fields: Update the Expense model and database schema

New Screens: Add to lib/screens/ with proper navigation

New UI Components: Add to lib/widgets/ for reusability

New State Logic: Extend ExpenseProvider or create new providers

🐛 Troubleshooting
Common Issues
Issue	Solution
Visual Studio toolchain error	Install Visual Studio with "Desktop development with C++" workload
Database not initialized	Ensure sqflite_common_ffi is properly configured in database_helper.dart
Build cache issues	Run flutter clean followed by flutter pub get
Margin parameter errors	Check BoxDecoration doesn't contain margin (move to parent Container)
Dependency conflicts	Use flutter pub outdated to check for compatible versions
Windows-Specific Setup
Enable Developer Mode:

Press Windows + R, type start ms-settings:developers

Turn on "Developer Mode"

Visual Studio Requirements:

Install Visual Studio Community 2022+

Select "Desktop development with C++" during installation

Run flutter doctor -v to verify setup

### 📈 Future Enhancements
Planned Features
Budget Planning: Set monthly budgets per category with alerts

Data Export: Export expenses to CSV, PDF, or Excel formats

Cloud Sync: Firebase integration for cross-device synchronization

Recurring Expenses: Support for monthly bills and subscriptions

Currency Support: Multi-currency expense tracking

Reports: Monthly/yearly financial reports with insights

Receipt Scanning: OCR integration for receipt digitization

Dark Mode: Complete dark theme implementation

### Technical Improvements
Unit Tests: Comprehensive testing for models and services

Integration Tests: End-to-end testing of main workflows

CI/CD Pipeline: Automated builds and testing

Internationalization: Multi-language support

Accessibility: Enhanced screen reader support

## 🤝 Contributing
Contributions are welcome! Please follow these steps:

Fork the repository

Create a feature branch (git checkout -b feature/AmazingFeature)

Commit your changes (git commit -m 'Add some AmazingFeature')

Push to the branch (git push origin feature/AmazingFeature)

Open a Pull Request

Development Guidelines
Follow Dart style guidelines and use flutter analyze

Write meaningful commit messages

Add tests for new functionality

Update documentation as needed

📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

🙏 Acknowledgments
Flutter Team for the amazing cross-platform framework

Pub.dev package maintainers for the essential dependencies

Material Design for the design system and components

📞 Support
For issues, questions, or suggestions:

Check the Troubleshooting section

Search existing GitHub Issues

Create a new issue with detailed information

Built with ❤️ using Flutter • Happy Tracking! 📊

Last Updated: December 2025


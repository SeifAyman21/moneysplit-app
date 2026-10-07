# MoneySplit

3-Way Money Allocation Manager - Offline-first Android app built with Flutter.

## Features
- Equal (customizable) 3-way split: Personal / Investment / Responsibilities
- Monthly detail with Summary, Income, Transactions, Weekly tabs
- Daily transactions with category/subcategory selection
- Weekly summary grouped by week (configurable Sunday/Monday)
- Dashboard with KPIs, yearly table, and charts (fl_chart)
- Settings: currency, year, percentages, week start, planned incomes, categories
- One-time seeding from the source workbook data (October sample data included)
- Offline-first using sqflite; Material 3 with light/dark mode

## Seeded data (from Money_Management_3Way_Allocation_Full.md)
- Settings: currency EGP, year 2026, percentages 33.33% each, week starts Sunday
- Categories: Personal (Food, Entertainment, Shopping, Transportation, Subscriptions, Personal Development, Other), Investment (Stocks, Funds, Gold, Business, Education, Other), Responsibilities (Rent, Bills, Family, Debt, Utilities, Insurance, Other)
- Planned incomes: October 19000; others 0 (2026)
- Actual income: October 19000
- Transactions (October): 2026-10-05 200 (Personal), 2026-10-06 2200 (Personal), 2026-10-07 100 (Personal)

Other months are empty initially; add data via the app UI.

## Build locally
`ash
flutter pub get
flutter build apk --release
`
APK output: uild/app/outputs/flutter-apk/app-release.apk

## GitHub Actions build (recommended)
1. Create a new empty GitHub repository
2. Push this project to it:
`ash
git init
git add .
git commit -m "Initial MoneySplit"
git branch -M main
git remote add origin https://github.com/<your-username>/<your-repo>.git
git push -u origin main
`
3. Go to the repo's "Actions" tab and wait for "Build APK" to finish (a few minutes)
4. Download the APK from the workflow run's "Artifacts" section (app-release.zip containing app-release.apk)
5. Transfer APK to Android phone and install (enable "Install from unknown sources" if prompted)

Package: com.moneysplit.app
Min SDK: 24 (Android 7.0+)

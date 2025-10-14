# App Purpose
Memento is a personal relationship management application designed to help users keep track of important information about the people in their lives. It serves as a private, intelligent database to strengthen personal and professional connections by remembering the details that matter.

## Core Features
- **Memento Management**: Full CRUD operations for contacts (mementos).
- **Rich Data Profiles**: Store name, photo, contact info, context, professional details, personal dates, and notes.
- **Search**: Real-time search across all memento data.
- **Reminders**: Schedule future messages (SMS, Email, WhatsApp) with local notifications.
- **Data Management**: Local-first storage, label management, and JSON import/export.
- **Gamification**: Achievements, quests, and seasons to encourage engagement.
- **Settings**: Theme customization and behavior toggles.

## Technical Highlights
- **Architecture**: Clean Architecture with three distinct layers (Data, Domain, Presentation).
- **State Management**: Riverpod for dependency injection and state management.
- **Database**: Drift (SQLite) for local, persistent, and searchable data storage.
- **Navigation**: GoRouter for type-safe and path-based navigation.
- **UI**: Material 3 for a modern and responsive user interface.

## Implemented Features
*Initial analysis on 2025-10-12*
1. **Project Foundation**
   - Clean Architecture project structure established.
   - Core dependencies (Riverpod, Drift, GoRouter) integrated.
   - Cross-platform support configured for mobile, web, and desktop.
2. **Memento Transformation**
   - Refactoring core data models from Todo to Memento.
   - Updating database schema to support rich Memento profiles.
3. **Code Quality & Cleanup**
   - Clean build completed successfully.
   - All TODO comments removed and functionality implemented.
   - Web platform build verified and working.
   - Android APK build verified and working.
   - Filter logic implemented for Memento list view.

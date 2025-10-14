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
4. **Real-time Search**
   - 2025-10-14 15:21 CEST: Implemented real-time search functionality in the main memento list.
   - Added search text field to AppBar for instant search results.
   - Created combined viewmodel (MementoListWithSearchViewModel) that handles both regular listing and search.
   - Added search query state management with SearchQueryNotifier provider.
   - Included clear search button for better UX.
   - Search uses existing FTS5 database functionality for fast, full-text search.
5. **UI Update Fix**
   - 2025-10-14 15:26 CEST: Fixed issue where new items didn't appear immediately after creation.
   - Added proper invalidation of search viewmodel after CRUD operations in form viewmodel.
   - Ensured real-time UI updates when adding, updating, or deleting mementos.
6. **Real-time Search Fix**
   - 2025-10-14 15:32 CEST: Fixed real-time search functionality to properly filter results as user types.
   - Updated viewmodel to correctly watch search query changes using Riverpod's reactive providers.
   - Simplified UI implementation to eliminate controller conflicts that interfered with search.
   - Search now updates instantly without requiring additional user interactions.
7. **Enhanced CRUD Operations**
   - 2025-10-14 15:39 CEST: Added direct edit and delete functionality to list items via popup menu.
   - Enhanced MementoCard widget with action buttons for better user experience.
   - Added confirmation dialogs for delete operations to prevent accidental deletions.
   - Improved visual feedback with snackbar notifications for all operations.
8. **Partial Match Search Enhancement**
   - 2025-10-14 15:39 CEST: Implemented intelligent partial match search with wildcard support.
   - Added search results count display in AppBar for better user feedback.
   - Enhanced search result sorting for better relevance (exact matches first, then by length).
   - Users can now see results as they type, making search more interactive and fun.

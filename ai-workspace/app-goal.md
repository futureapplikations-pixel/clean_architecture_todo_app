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
9. **Corporate Design Enhancement**
   - 2025-10-14 15:45 CEST: Redesigned app with corporate, slim, and professional aesthetics.
   - Enhanced search bar with rounded design, better focus handling, and integrated clear button.
   - Improved contact cards with gradient backgrounds, icons, and better information hierarchy.
   - Added sophisticated empty states with actionable buttons and contextual messaging.
   - Enhanced FAB with gradient design and shadow effects for premium feel.
   - Improved overall visual polish with Material 3 design principles and corporate color scheme.
10. **Code Cleanup - Obsolete Class Removal**
    - 2025-10-14 20:10 CEST: Removed all obsolete Todo-related classes and files after Memento refactoring.
    - Cleaned up use case files (create_todo, delete_todo, get_todo_list, search_todo_list, update_todo, delete_completed_todos).
    - Removed obsolete Todo-related viewmodel files and generated files.
    - Removed obsolete Todo-related test files and directories.
    - Updated app name from TodoApp to MementoApp in main.dart and app.dart.
    - Removed unused Label-related files (label.dart, label.dart mapper) not used in current Memento app.
    - Removed obsolete database test file that referenced non-existent Todo methods.
    - Project now has clean, Memento-focused codebase with no obsolete Todo references.
11. **Rich Data Profiles Implementation**
    - 2025-10-14 21:15 CEST: Implemented comprehensive rich data profiles for mementos.
    - Added Label domain model with color-coded tagging system for flexible organization.
    - Added Note domain model with timestamped notes and favorite/pin feature for detailed tracking.
    - Updated Memento model to include labels and notes collections for complete relationship profiles.
    - Enhanced database schema with labels, memento_labels, and notes tables for full data persistence.
    - Updated database interface and implementation with complete CRUD operations for labels and notes.
    - Enhanced MementoMapper to handle rich profile data transformation between database and domain models.
    - Extended repository with comprehensive label and note management operations.
    - All data is now fully persistable with rich relationship profiles supporting the complete feature set.
12. **Birthday Field Enhancement**
    - 2025-10-14 21:38 CEST: Improved birthday input to use text field with MM/DD/YYYY format.
    - Changed database storage from TEXT to INTEGER (timestamp) for better searchability and date operations.
    - Added proper date parsing and validation for user-friendly text input.
    - Maintained real date storage in database for advanced querying and date-based operations.
    - Users can now type birthdays as plain text while data is stored optimally for database searches.

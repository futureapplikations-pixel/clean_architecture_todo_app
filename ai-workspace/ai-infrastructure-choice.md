# AI Infrastructure Choices

## Architecture Choices
- **Project Type**: Flutter Clean Architecture Memento App
- **Architecture Pattern**: Clean Architecture with 3 layers:
  - Data Layer: Repositories, Data Sources, Entities
  - Domain Layer: Use Cases, Models, Repository Interfaces
  - Presentation Layer: Views, ViewModels, Widgets

## Technology Stack

### State Management & DI
- **State Management**: Riverpod 2.3.1
  - Using Generated Providers (`@riverpod`)
  - StreamNotifier/FutureNotifier for async state
  - Flutter Hooks integration (hooks_riverpod 2.3.2)
- **Dependency Injection**: Riverpod's built-in DI system
  - Providers for database, repositories, and view models
  - Scoped providers for feature isolation

### Database
- **ORM**: Drift 2.5.0 (SQLite)
  - Type-safe database operations
  - Full-text search using SQLite FTS5
  - Cross-platform support (native/web)
  - Auto-generated queries
- **Schema Features**:
  - Mementos table with automatic FTS indexing
  - Due date indexing for efficient queries
  - Triggers for FTS synchronization

### Navigation & Routing
- **Router**: GoRouter 6.2.0
  - Type-safe routing
  - Deep linking support
  - Path-based navigation

### UI Framework
- **Design System**: Material 3
- **Responsive**: Adaptive layouts for all platforms
- **Platform Support**: iOS, Android, Web, Linux, macOS, Windows
- **Animations**: flutter_animate, and other animation libraries to replicate anime.js effects.
- **Charts**: fl_chart or other charting library to replicate echarts.
- **Visual Effects**: Custom painters and other libraries to replicate p5.js effects.

### Code Generation & Tools
- **Build System**: build_runner 2.4.0
- **Generators**:
  - drift_dev 2.4.0: Database code
  - riverpod_generator 2.1.3: State management
  - json_serializable 6.2.0: JSON handling

### Developer Tools
- **Static Analysis**: flutter_lints 2.0.0
- **Testing**: flutter_test SDK

### Gamification
- **Achievements & Quests**: Custom implementation using Drift for persistence.
- **Leaderboards**: Custom implementation.

## Package Dependencies
### Core
- **State**: flutter_riverpod: ^2.3.1, riverpod: ^2.3.1, riverpod_annotation: ^2.0.1, hooks_riverpod: ^2.3.2, flutter_hooks: ^0.18.6
- **Database**: drift: ^2.5.0, sqlite3: ^1.9.3, sqlite3_flutter_libs: ^0.5.13
- **Utilities**: equatable: ^2.0.5, collection: ^1.17.0, intl: ^0.17.0, path: ^1.8.3
- **Storage**: path_provider: ^2.0.13
- **Routing**: go_router: ^6.2.0
- **HTTP**: http: ^1.5.0

### Notifications
- **Local Notifications**: flutter_local_notifications: ^16.3.2
- **Timezone Support**: timezone: ^0.9.2

### UI
- **Icons**: cupertino_icons: ^1.0.0
- **Fonts**: google_fonts: ^6.1.0

## Implementation Details
### Database Schema
- Mementos table with FTS5 integration
- Labels, Notes, and ScheduledMessages tables.
- Automatic indexing of due dates
- Full CRUD operations
- Search functionality using FTS5

### Domain Model
- Memento entity with:
  - ID, title, description
  - Completion status
  - Due date
  - List filtering extensions
- Label, Note, and ScheduledMessage entities.

## Architecture Choices
- **Design System**: Corporate Vision Design with Material 3
  - Color Palette: Sage Green (#87A96B), Warm Charcoal (#4A4A4A), Soft Gold (#D4AF37)
  - Typography: Playfair Display (headings), Inter (body text), JetBrains Mono (technical elements)
  - Visual Effects: Advanced animations, micro-interactions, and professional styling

## Changelog
- **2025-10-12**: Initial analysis of existing project structure and architecture
- **2025-10-12**: Documentation of current architecture and technical stack
- **2025-10-12 00:00**: Initial project setup with clean architecture structure (data, domain, presentation layers)
- **2025-10-14 21:47 CEST**: Added flutter_local_notifications 16.3.2 and timezone 0.9.2 for implementing scheduled message reminders and notifications
- **2025-10-14 23:08 CEST**: Updated http dependency from ^0.13.5 to ^1.5.0 for google_fonts compatibility
- **2025-10-14 23:08 CEST**: Added google_fonts ^6.1.0 for vision typography implementation (Playfair Display, Inter)
- **2025-10-14 23:08 CEST**: Implemented corporate design theme with vision color palette and typography
- **2025-10-14 23:30 CEST**: Updated dependencies to reflect pubspec.yaml and added notes about UI libraries.
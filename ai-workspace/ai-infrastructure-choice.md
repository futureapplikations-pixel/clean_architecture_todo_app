# AI Infrastructure Choices

## Architecture Choices
- **Project Type**: Flutter Clean Architecture Todo App
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
  - Todos table with automatic FTS indexing
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

### Code Generation & Tools
- **Build System**: build_runner 2.4.0
- **Generators**:
  - drift_dev 2.4.0: Database code
  - riverpod_generator 2.1.3: State management
  - json_serializable 6.2.0: JSON handling

### Developer Tools
- **Static Analysis**: flutter_lints 2.0.0
- **Testing**: flutter_test SDK

## Package Dependencies
### Core
- **State**: riverpod, flutter_riverpod, hooks_riverpod
- **Database**: drift, sqlite3, sqlite3_flutter_libs
- **Utilities**: equatable, collection, intl
- **Storage**: path_provider, path

## Implementation Details
### Database Schema
- Todos table with FTS5 integration
- Automatic indexing of due dates
- Full CRUD operations
- Search functionality using FTS5

### Domain Model
- Todo entity with:
  - ID, title, description
  - Completion status
  - Due date
  - List filtering extensions

## Changelog
- **2025-10-12**: Initial analysis of existing project structure and architecture
- **2025-10-12**: Documentation of current architecture and technical stack
- **2025-10-12 00:00**: Initial project setup with clean architecture structure (data, domain, presentation layers)
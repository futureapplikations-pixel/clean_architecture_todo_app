# Project Structure Overview

## File Overview

### Root Files
- `pubspec.yaml`: Project configuration and dependencies
- `analysis_options.yaml`: Dart analyzer configuration
- `build.yaml`: Build configuration

### Core Directories

#### lib/data/ (Data Layer)
- `entity/`: Database entities
  - `todo.dart`: Database Todo entity typedef
- `mapper/`: Data mappers
  - `todo.dart`: Maps between Todo entity and domain model
- `repository/`: Repository implementations
  - `todos_impl.dart`: Implements TodosRepository using Drift database
- `source/`: Data sources
  - `database/`: Drift SQLite implementation
    - `connection/`: Platform-specific database connections
    - `sql/schema.drift`: Database schema with FTS5 search
    - `database.dart`: Database interface
    - `database_impl.dart`: Drift database implementation

#### lib/domain/ (Business Logic Layer)
- `model/`: Domain models
  - `todo.dart`: Todo model with business logic
- `repository/`: Repository interfaces
  - `todos.dart`: Todo repository interface
- `usecase/`: Business use cases

#### lib/presentation/ (UI Layer)
- `app.dart`: Main app configuration
- `router.dart`: GoRouter configuration
- `theme.dart`: Material 3 theme configuration
- `view/`: UI screens
- `viewmodel/`: Screen view models
  - `todoform/`: Todo creation/editing
  - `todolist/`: Todo list management
- `widgets/`: Reusable UI components

### Platform Directories
- Platform-specific configurations for:
  - Android (Gradle)
  - iOS (Swift/Storyboards)
  - Web (index.html)
  - Linux (CMake)
  - macOS (Cocoa)
  - Windows (CMake)

## Key Connections

### Data Flow
1. Presentation Layer:
   - Views observe ViewModels (Riverpod)
   - ViewModels interact with UseCases

2. Domain Layer:
   - UseCases implement business logic
   - Repositories define data access contracts
   - Models contain business rules

3. Data Layer:
   - RepositoryImpl implements Repository interfaces
   - Database (Drift) provides persistence
   - Mappers transform between Entity ↔ Model

### Notable Features
- Full-text search using SQLite FTS5
- Drift for type-safe database access
- Riverpod for state management
- GoRouter for navigation
- Material 3 for UI
- Cross-platform database support (native/web)

### Code Generation
- Drift: Database code (`*.g.dart`)
- Riverpod: ViewModels/Providers (`*.g.dart`)
- JSON: Serialization (`*.g.dart`)
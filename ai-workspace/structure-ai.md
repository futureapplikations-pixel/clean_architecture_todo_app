# Project Structure Overview

## File Overview

### Root Files
- `pubspec.yaml`: Project configuration and dependencies
- `analysis_options.yaml`: Dart analyzer configuration
- `build.yaml`: Build configuration

### Core Directories

#### lib/data/ (Data Layer)
- `mapper/`: Data mappers
  - `memento.dart`: Maps between Memento entity and domain model
- `repository/`: Repository implementations
  - `mementos_impl.dart`: Implements MementosRepository using Drift database
- `source/`: Data sources
  - `database/`: Drift SQLite implementation
    - `connection/`: Platform-specific database connections
    - `sql/schema.drift`: Database schema with FTS5 search
    - `database.dart`: Database interface
    - `database_impl.dart`: Drift database implementation

#### lib/domain/ (Business Logic Layer)
- `model/`: Domain models
  - `memento.dart`: Memento model with business logic
  - `label.dart`: Label model for categorizing mementos
- `repository/`: Repository interfaces
  - `mementos.dart`: Memento repository interface
- `usecase/`: Business use cases

#### lib/presentation/ (UI Layer)
- `app.dart`: Main app configuration
- `router.dart`: GoRouter configuration
- `theme.dart`: Material 3 theme configuration
- `view/`: UI screens
  - `memento_list.dart`: The main screen that displays the list of mementos.
  - `memento_form.dart`: The screen for creating and editing mementos.
  - `memento_details.dart`: The screen that displays the details of a memento.
  - `search_memento_list.dart`: The screen for searching mementos.
- `viewmodel/`: Screen view models
  - `mementoform/`: Memento creation/editing
    - `memento_form.dart`: ViewModel for the memento form.
  - `mementolist/`: Memento list management
    - `memento_list.dart`: Original ViewModel for the memento list with implemented filter logic.
    - `memento_list_with_search.dart`: Combined ViewModel for memento list with real-time search functionality.
    - `search_memento_list.dart`: Original ViewModel for searching mementos (now replaced by inline search).
    - `search_query_notifier.dart`: Provider for managing search query state.
    - `memento_filter_kind.dart`: Enum for filtering mementos (all, favorites, recent).
- `widgets/`: Reusable UI components
  - `memento_card.dart`: Enhanced card widget with edit/delete actions and improved information display.

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
- Full-text search using SQLite FTS5 with partial match support
- Drift for type-safe database access
- Riverpod for state management
- GoRouter for navigation
- Material 3 for UI with corporate design aesthetics
- Cross-platform database support (native/web)
- Real-time search in main list view with instant filtering
- Reactive UI updates after CRUD operations
- Enhanced contact cards with gradient designs and rich information display
- Professional empty states with actionable guidance
- Sophisticated search bar with integrated controls
- Premium visual effects with shadows and gradients

### Code Generation
- Drift: Database code (`*.g.dart`)
- Riverpod: ViewModels/Providers (`*.g.dart`)
- JSON: Serialization (`*.g.dart`)

### Platform Directories
- Platform-specific configurations for:
  - Android (Gradle)
  - iOS (Swift/Storyboards)
  - Web (index.html)
  - Linux (CMake)
  - macOS (Cocoa)
  - Windows (CMake)

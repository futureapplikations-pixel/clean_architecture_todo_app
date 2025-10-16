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
  - `scheduled_message.dart`: Maps between ScheduledMessage entity and domain model
- `repository/`: Repository implementations
  - `mementos_impl.dart`: Implements MementosRepository using Drift database
  - `scheduled_messages_impl.dart`: Implements ScheduledMessagesRepository using Drift database
- `service/`: Services for external integrations
  - `notification_service.dart`: Handles local notifications for scheduled messages
- `source/`: Data sources
  - `database/`: Drift SQLite implementation
    - `connection/`: Platform-specific database connections
    - `sql/schema.drift`: Database schema with FTS5 search, labels, notes, and scheduled_messages tables
    - `database.dart`: Database interface with label, note, and scheduled message operations
    - `database_impl.dart`: Drift database implementation with rich profile support and scheduled messages

#### lib/domain/ (Business Logic Layer)
- `model/`: Domain models
  - `memento.dart`: Memento model with business logic and rich profile data
  - `label.dart`: Label model for color-coded tagging system
  - `note.dart`: Note model for timestamped notes with favorite feature
  - `scheduled_message.dart`: ScheduledMessage model with message types and scheduling logic
- `repository/`: Repository interfaces
  - `mementos.dart`: Memento repository interface
  - `scheduled_messages.dart`: ScheduledMessages repository interface
- `usecase/`: Business use cases
  - `schedule_message.dart`: Use case for scheduling new messages
  - `update_scheduled_message.dart`: Use case for updating existing scheduled messages
  - `cancel_scheduled_message.dart`: Use case for canceling/deleting scheduled messages

#### lib/presentation/ (UI Layer)
- `app.dart`: Main app configuration
- `router.dart`: GoRouter configuration with scheduled messages routes
- `theme.dart`: Material 3 theme configuration
- `view/`: UI screens
  - `memento_list.dart`: The main screen that displays the list of mementos with scheduled messages access.
  - `memento_form.dart`: The screen for creating and editing mementos.
  - `memento_details.dart`: The screen that displays the details of a memento and its scheduled messages.
  - `search_memento_list.dart`: The screen for searching mementos.
  - `scheduled_messages_list.dart`: Screen for displaying and managing scheduled messages with filtering, grouped by status.
  - `scheduled_message_form.dart`: Form for creating and editing scheduled messages with validation and a dedicated view model.
- `viewmodel/`: Screen view models
  - `mementoform/`: Memento creation/editing
    - `memento_form.dart`: ViewModel for the memento form.
  - `mementolist/`: Memento list management
    - `memento_list.dart`: Original ViewModel for the memento list with implemented filter logic.
    - `memento_list_with_search.dart`: Combined ViewModel for memento list with real-time search functionality.
    - `search_memento_list.dart`: Original ViewModel for searching mementos (now replaced by inline search).
    - `search_query_notifier.dart`: Provider for managing search query state.
    - `memento_filter_kind.dart`: Enum for filtering mementos (all, favorites, recent).
  - `scheduled_messages_list.dart`: ViewModel for managing scheduled messages list with reactive updates.
  - `scheduled_message_form.dart`: ViewModel for managing the scheduled message form state.
- `widgets/`: Reusable UI components
  - `memento_card.dart`: Enhanced card widget with edit/delete actions and improved information display.
  - `scheduled_message_card.dart`: Card widget for displaying scheduled messages with status indicators and actions.

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
- Rich data profiles with labels, notes, and comprehensive contact information
- Color-coded labeling system for flexible contact organization
- Timestamped notes with favorite/pin feature for detailed relationship tracking
- Scheduled messages system with SMS, Email, and WhatsApp support
- Local notifications for message reminders with timezone support
- Cross-platform notification support (iOS, Android, Web, Desktop)
- Complete CRUD operations for scheduled messages with validation
- Drift for type-safe database access with complete data persistence
- Riverpod for state management and reactive UI updates
- GoRouter for navigation with type-safe routing
- Material 3 for UI with corporate design aesthetics and premium visual effects
- Cross-platform database support (native/web) with local-first storage
- Real-time search in main list view with instant filtering and partial match support
- Reactive UI updates after CRUD operations with proper invalidation
- Enhanced contact cards with gradient designs and rich information display
- Professional empty states with actionable guidance and contextual messaging
- Sophisticated search bar with integrated controls and result count display

### Code Generation
- Drift: Database code (`*.g.dart`)
- Riverpod: ViewModels/Providers (`*.g.dart`)
- JSON: Serialization (`*.g.dart`)

### Platform Directories
- Platform-specific configurations for:
  - Android (Gradle)
  - iOS (Swift/Storyboards)
  - Web (index.html) - updated with modern initialization script and service worker versioning
  - Linux (CMake)
  - macOS (Cocoa)
  - Windows (CMake)
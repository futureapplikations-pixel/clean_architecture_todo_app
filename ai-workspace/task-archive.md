# Completed Features

## Feature: Scheduled Messages UI Enhancements
- **Completion Date**: 2025-10-16 22:00 CEST
- **Execution Plan**:
  - [x] Enhance Memento details view to display scheduled messages.
  - [x] Redesign scheduled messages list to be grouped by status.
  - [x] Implement create/update logic in the scheduled message form.
  - [x] Resolve TODOs in the router and view models.
  - [x] Add `collection` package.
  - [x] Format codebase.
- **Description**: This feature improves the user interface for managing scheduled messages. The Memento details view now displays a list of scheduled messages for each contact. The scheduled messages list is now grouped by status (Due, Scheduled, and Sent) for better organization. The form for creating and editing scheduled messages is now fully functional, allowing users to save and update messages. All related TODOs in the codebase have been resolved.
- **Files Involved**:
  - `lib/presentation/view/memento_details.dart`
  - `lib/presentation/view/scheduled_messages_list.dart`
  - `lib/presentation/view/scheduled_message_form.dart`
  - `lib/presentation/viewmodel/scheduled_message_form.dart`
  - `lib/presentation/router.dart`
  - `lib/presentation/viewmodel/scheduled_messages_list.dart`
  - `pubspec.yaml`
  - `ai-workspace/app-goal.md`
  - `ai-workspace/structure-ai.md`
  - `ai-workspace/ai-infrastructure-choice.md`
  - `ai-workspace/current-task-check-list.md`

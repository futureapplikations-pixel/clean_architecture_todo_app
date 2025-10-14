# Current Issues

## Real-time Search Not Working
- **Issue**: The search functionality is not filtering results in real-time as the user types
- **Description**: When typing in the search field, the list doesn't update to show filtered results immediately
- **Root Cause**: The viewmodel wasn't properly watching for search query changes due to incorrect Riverpod provider implementation and potential controller conflicts
- **Resolution Plan**:
  - [x] Analyze current viewmodel reactive logic
  - [x] Fix the provider to properly watch search query changes
  - [x] Ensure build() method watches all necessary providers
  - [x] Remove controller conflicts that might interfere with search
  - [x] Test real-time search functionality
- **Actions Taken**:
  - 2025-10-14 15:30 CEST: Identified issue with search not being reactive
  - 2025-10-14 15:31 CEST: Fixed viewmodel to properly watch searchQueryNotifierProvider and mementoFilterKindProvider in build() method
  - 2025-10-14 15:31 CEST: Updated _applyFilter method to accept filterKind parameter
  - 2025-10-14 15:32 CEST: Simplified UI implementation by removing TextEditingController conflicts
  - 2025-10-14 15:32 CEST: Generated updated Riverpod providers with build_runner
- **Status**: Resolved

## UI Update Issue After Adding Items
- **Issue**: When adding a new memento item, the UI doesn't show the updated data until clicking on other filter like favorites
- **Description**: The list view doesn't refresh immediately after creating a new memento, requiring user interaction with filters to see the new item
- **Root Cause**: The viewmodel wasn't properly invalidating the search viewmodel after CRUD operations
- **Resolution Plan**:
  - [x] Analyze current viewmodel invalidation logic
  - [x] Check if proper provider invalidation is happening after item creation
  - [x] Fix the invalidation chain to ensure immediate UI updates
  - [x] Test the fix to ensure new items appear immediately
- **Actions Taken**:
  - 2025-10-14 15:25 CEST: Identified issue with UI not updating after adding items
  - 2025-10-14 15:26 CEST: Added invalidation of MementoListWithSearchViewModel in form viewmodel after create/update/delete operations
  - 2025-10-14 15:26 CEST: Generated updated Riverpod providers with build_runner
- **Status**: Resolved
*No active issues*

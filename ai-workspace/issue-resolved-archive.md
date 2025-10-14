# Resolved Issues Archive

## Remove "No Mementos found" Message in Search
- **Issue**: Remove the "No Mementos found" message when search results are empty
- **Resolution Date**: 2025-10-14 20:49 CEST
- **Description**: When searching for mementos and no results are found, display an empty state instead of showing "No Mementos found" text
- **Resolution Plan**:
  - [x] Identify the "No Mementos found" message in search results
  - [x] Replace the message with an empty state (SizedBox.shrink())
  - [x] Test that empty search results show no message
- **Files Involved**:
  - Modified: lib/presentation/view/search_memento_list.dart
- **Actions Taken**:
  - 2025-10-14 20:48 CEST: Located "No Mementos found" message in search_memento_list.dart
  - 2025-10-14 20:48 CEST: Replaced Text widget with SizedBox.shrink() for empty state
  - 2025-10-14 20:49 CEST: Tested that empty search results now show no message

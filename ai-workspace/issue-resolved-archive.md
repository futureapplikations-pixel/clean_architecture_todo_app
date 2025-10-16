# Resolved Issues

## Issue: Uncaught ReferenceError: serviceWorkerVersion is not defined

- **Resolution Date**: 2025-10-16
- **Description**: On web startup, the console was printing `Uncaught ReferenceError: serviceWorkerVersion is not defined at (index):45:33`. This was because the `serviceWorkerVersion` variable was used in `web/index.html` without being defined.
- **Resolution Plan**:
  - [x] Modify `web/index.html` to load the `flutter_service_worker.js` script, which defines the `serviceWorkerVersion` variable.
  - [x] Remove the `serviceWorker` block from the `loadEntrypoint` function in `web/index.html`.
- **Files Involved**:
  - `web/index.html`

## Issue: Build failures due to syntax errors in memento_card.dart

- **Resolution Date**: 2025-10-16
- **Description**: The app was failing to build due to syntax errors in `lib/presentation/widgets/memento_card.dart`. The errors were introduced while replacing hardcoded colors.
- **Resolution Plan**:
  - [x] Fix the syntax errors in `lib/presentation/widgets/memento_card.dart`.
  - [x] Fix deprecation warnings in `web/index.html`.
- **Files Involved**:
  - `lib/presentation/widgets/memento_card.dart`
  - `web/index.html`

## Issue: Startup errors on web

- **Resolution Date**: 2025-10-16
- **Description**: On web startup, the console was printing two errors:
1. `Uncaught (in promise) FlutterLoader.load requires _flutter.buildConfig to be set`
2. `<meta name="apple-mobile-web-app-capable" content="yes"> is deprecated. Please include <meta name="mobile-web-app-capable" content="yes">`
- **Resolution Plan**:
  - [x] Modify `web/index.html` to use the new Flutter web app initialization method.
  - [x] Add the `<meta name="mobile-web-app-capable" content="yes">` tag to `web/index.html`.
- **Files Involved**:
  - `web/index.html`

## Issue: Startup errors on web (re-fix)

- **Resolution Date**: 2025-10-16
- **Description**: The previous fix for the web startup errors was not correct. The errors `Uncaught (in promise) FlutterLoader.load requires _flutter.buildConfig to be set` and `<meta name="apple-mobile-web-app-capable" content="yes"> is deprecated` persisted.
- **Resolution Plan**:
  - [x] Overwrote `web/index.html` with the correct initialization script and meta tags.
- **Files Involved**:
  - `web/index.html`

## Issue: Persistent startup errors on web

- **Resolution Date**: 2025-10-16
- **Description**: The web startup errors persisted even after multiple attempts to fix them. It was suspected that the build was not correctly applying the changes.
- **Resolution Plan**:
  - [x] Ran `flutter clean` to clean the project.
  - [x] Ran `flutter build web` to build the project again.
- **Files Involved**:
  - None

## Issue: Persistent startup errors on web (final attempt)

- **Resolution Date**: 2025-10-16
- **Description**: The web startup errors persisted even after cleaning and rebuilding the project. The final attempt to fix the issue involved replacing the `index.html` and adding `flutter_bootstrap.js` from a new Flutter project.
- **Resolution Plan**:
  - [x] Overwrote `web/index.html` with the content from a new Flutter project, which uses `flutter_bootstrap.js` for initialization.
  - [x] Copied `flutter_bootstrap.js` from a new Flutter project to the `web` directory.
- **Files Involved**:
  - `web/index.html`
  - `web/flutter_bootstrap.js`

## Issue: Uncaught SyntaxError: Unexpected token '...'

- **Resolution Date**: 2025-10-16
- **Description**: After the previous attempt to fix the startup errors, a new error appeared: `Uncaught SyntaxError: Unexpected token '...'`. This indicates that the `flutter_bootstrap.js` file was not copied correctly and is truncated. All attempts to fix this have failed.
- **Resolution Plan**:
  - [ ] I am unable to solve this issue. I have tried multiple approaches and I am only making things worse. I need help.
- **Files Involved**:
  - `web/index.html`
  - `web/flutter_bootstrap.js`

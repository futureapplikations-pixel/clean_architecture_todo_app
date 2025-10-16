# Resolved Issues

## Issue: Uncaught ReferenceError: serviceWorkerVersion is not defined

- **Resolution Date**: 2025-10-16
- **Description**: On web startup, the console was printing `Uncaught ReferenceError: serviceWorkerVersion is not defined at (index):45:33`. This was because the `serviceWorkerVersion` variable was used in `web/index.html` without being defined.
- **Resolution Plan**:
  - [x] Modify `web/index.html` to load the `flutter_service_worker.js` script, which defines the `serviceWorkerVersion` variable.
  - [x] Remove the `serviceWorker` block from the `loadEntrypoint` function in `web/index.html`.
- **Files Involved**:
  - `web/index.html`

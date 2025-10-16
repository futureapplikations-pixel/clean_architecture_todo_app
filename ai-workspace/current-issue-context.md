# Issue: `build_runner` fails with `drift_dev` error

## Description
The `build_runner` command is failing with a `drift_dev` error, which seems to be caused by a dependency issue. Previous attempts to fix this by cleaning the project and re-running `pub get` have not been successful.

## Resolution Plan
- [ ] Run `flutter pub upgrade` to upgrade the packages.
- [ ] Run `flutter pub run build_runner build --delete-conflicting-outputs` to build the project again.

## Actions Taken

## Status
In progress
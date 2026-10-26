# Regardless Data Module

`regardless_data_module` is the shared Flutter/Dart domain and data package
used by the Regardless Social App. It centralizes domain models, API
contracts, remote API implementations, repository interfaces and
implementations, Firebase setup, and shared app services.

For a cross-repository product overview and navigation guide, see
[`../PROJECT_SCOPE.md`](../PROJECT_SCOPE.md).

## Related modules

- [`../regardless_social_app/`](../regardless_social_app/) — primary Flutter
  client; currently references this package using a local path dependency.
- [`../regardless_social_api/`](../regardless_social_api/) — backend REST API,
  Firebase Functions, and Firebase configuration.

For behavior changes that cross boundaries, keep the API route/payload,
shared API service and repository contracts, models/mappers, and app
consumers consistent.

## Prerequisites and setup

Use a Flutter/Dart SDK compatible with `pubspec.yaml`. From this directory:

```sh
flutter pub get
```

This is a Flutter package rather than a pure Dart-only package because it
depends on Flutter and Firebase plugins.

## Project structure

- `lib/domain/model/` — shared domain objects, enums, and mapper definitions.
- `lib/domain/repositories/` — repository contracts consumed by app features.
- `lib/domain/api/api_service.dart` — remote API service contract.
- `lib/data/remote/api_service_impl.dart` — HTTP/API service implementation.
- `lib/data/remote/routes.dart` — API route construction.
- `lib/data/remote/repository/` — repository implementations and common
  request/error handling.
- `lib/app/` — shared dependency setup, app services, and configuration.
- `lib/data/` — shared local data and service implementations.

## Common checks

```sh
flutter analyze
flutter test
```

Run focused tests first when the package has coverage for the changed contract.
The app depends on this package locally, so validate the app as well when
changing public models, API service methods, repository interfaces, or
generated types.

## Code generation

Some model mapper files and other files are generated. Change the source
definition and use the package's configured generator rather than hand-editing
generated output. The package declares `build_runner` and
`dart_mappable_builder`; use the project-compatible generation command when a
model change requires regeneration, then inspect the generated diff.

## Contribution and compatibility notes

- Prefer extending existing model/repository/API patterns over introducing
  duplicate abstractions.
- Preserve response/error and pagination contracts; callers depend on them.
- Treat API payload changes as cross-module changes and update the app/API in
  the same feature plan when applicable.
- Avoid committing credentials or environment-specific Firebase config.
- Preserve unrelated user changes in the working tree.

See [`../PROJECT_SCOPE.md`](../PROJECT_SCOPE.md) for repository boundaries,
feature-plan locations, and implementation handoff conventions.

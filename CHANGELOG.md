# Changelog

All notable changes to this project will be documented in this file.

The format is based on Keep a Changelog, and this project adheres to Semantic Versioning.

## [Unreleased]

### Added

- Web BFF OpenAPI contract at `openapi/web-bff.yaml` defining the website-edge BFF surface (`/auth/*` + `/api/*`), including `GET /api/me`.

### Changed

- Web BFF `GET /api/session` response includes `hasSessionCookie` and `sessionDebugId` to support safe session correlation/debugging.
- Rename cross-repo references from `ebo-planner-*` to `trip-planner-*` / `website-edge`.
- Update spec bundle naming convention to `trip-planner-spec-bundle-vX.Y.Z.zip`.
- Update the `tools/openapi-validate` Go module path to the org repo.

### Deprecated

### Removed

### Fixed

### Security

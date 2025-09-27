# Tasks: ClimbRoute AI

**Input**: Design documents from `/specs/001-app-concept-climbroute/`
**Prerequisites**: plan.md (required), research.md, data-model.md, contracts/

## Format: `[ID] [P?] Description`
- **[P]**: Can run in parallel (different files, no dependencies)
- Include exact file paths in descriptions

## Path Conventions
- **API**: `api/`
- **Mobile**: `app/` (representing the Flutter project)

## Phase 3.1: Setup
- [X] T001 Create project structure: `api/` for the backend and `app/` for the Flutter app.
- [X] T002 Initialize the Flutter project in `app/` and add dependencies: `image`, `tflite_flutter`, `flutter_image_processing`, `mockito`, `patrol`.
- [X] T003 Initialize the Dart backend project in `api/` (e.g., using `dart_frog`) and add dependencies.
- [X] T004 Configure linting and formatting for both projects.

## Phase 3.2: Tests First (TDD) ⚠️ MUST COMPLETE BEFORE 3.3
**CRITICAL: These tests MUST be written and MUST FAIL before ANY implementation**
- [X] T005 [P] Contract test `POST /images` in `api/tests/contract/test_images_post.dart`.
- [X] T006 [P] Contract test `GET /images/{id}/routes` in `api/tests/contract/test_images_get_routes.dart`.
- [X] T007 [P] Contract test `GET /images/{id}/routes/{color}` in `api/tests/contract/test_images_get_route_color.dart`.
- [X] T008 [P] Widget test for the image capture screen in `app/test/widget/image_capture_screen_test.dart`.
- [X] T009 [P] Widget test for the route display screen in `app/test/widget/route_display_screen_test.dart`.

## Phase 3.3: Core Implementation (API)
- [X] T010 [P] Implement `ClimbingWallImage` model in `api/src/models/climbing_wall_image.dart`.
- [X] T011 [P] Implement `ClimbingHold` model in `api/src/models/climbing_hold.dart`.
- [X] T012 [P] Implement `Route` model in `api/src/models/route.dart`.
- [X] T013 Implement `POST /images` endpoint in `api/src/routes/images/index.dart`.
- [X] T014 Implement image processing service in `api/src/services/image_processing_service.dart`.
- [X] T015 Implement `GET /images/{id}/routes` endpoint in `api/src/routes/images/[id]/routes/index.dart`.
- [X] T016 Implement `GET /images/{id}/routes/{color}` endpoint in `api/src/routes/images/[id]/routes/[color].dart`.

## Phase 3.4: Core Implementation (Flutter)
- [ ] T017 Implement image capture screen UI in `app/lib/screens/image_capture_screen.dart`.
- [ ] T018 Implement route display screen UI in `app/lib/screens/route_display_screen.dart`.
- [ ] T019 Implement API client in `app/lib/services/api_client.dart`.
- [ ] T020 Integrate API client with the UI.

## Phase 3.5: Polish
- [ ] T021 [P] Unit tests for image processing service in `api/tests/unit/test_image_processing_service.dart`.
- [ ] T022 [P] Unit tests for API client in `app/test/unit/api_client_test.dart`.
- [ ] T023 Perform manual testing based on `quickstart.md`.
- [ ] T024 [P] Update documentation (`README.md`, etc.).

## Dependencies
- Tests (T005-T009) before implementation (T010-T020).
- API models (T010-T012) before API endpoints (T013, T015, T016).
- Image processing service (T014) before API endpoints that use it.
- API implementation before Flutter UI integration.

## Parallel Example
```
# Launch T005-T009 together:
Task: "Contract test POST /images in api/tests/contract/test_images_post.dart"
Task: "Contract test GET /images/{id}/routes in api/tests/contract/test_images_get_routes.dart"
Task: "Contract test GET /images/{id}/routes/{color} in api/tests/contract/test_images_get_route_color.dart"
Task: "Widget test for the image capture screen in app/test/widget/image_capture_screen_test.dart"
Task: "Widget test for the route display screen in app/test/widget/route_display_screen_test.dart"
```

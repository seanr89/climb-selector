# Research for ClimbRoute AI

## Technology Stack Decisions

### Language and Framework Versions

- **Decision**: Flutter 3.35.1 and Dart 3.9.3 will be used.
- **Rationale**: These are the latest stable versions, providing the most up-to-date features and bug fixes.
- **Alternatives considered**: Using older versions, which was rejected to ensure access to the latest features and support.

### Image Processing Library

- **Decision**: The `image` package will be used for basic image manipulation. For more advanced features like selective color, `flutter_image_processing` with OpenCV will be considered.
- **Rationale**: The `image` package is a robust and well-supported library for general-purpose image processing. For the specific requirement of "selective color", a more powerful tool like OpenCV might be necessary, and `flutter_image_processing` provides a bridge to that.
- **Alternatives considered**: `pro_image_editor` was considered, but it seems more focused on user-facing editing features rather than programmatic image analysis.

### AI/ML Library

- **Decision**: `tflite_flutter` will be used for on-device model inference.
- **Rationale**: The core functionality of the app requires on-device object detection and color recognition for a fast and responsive user experience. `tflite_flutter` is the official and most performant option for this.
- **Alternatives considered**: `google_ml_kit` was considered, but `tflite_flutter` offers more flexibility for custom models, which will likely be needed for accurate climbing hold detection.

### Testing Framework

- **Decision**: The built-in `flutter_test` and `test` packages will be used for unit and widget testing. `mockito` will be used for mocking. `patrol` will be used for UI testing.
- **Rationale**: This combination of frameworks provides a comprehensive testing solution, from individual units of code to the full application UI.
- **Alternatives considered**: `mocktail` was considered as an alternative to `mockito`, but `mockito` is more widely adopted. Other UI testing frameworks were considered, but `patrol` is specifically designed to address the limitations of Flutter's standard integration tests.

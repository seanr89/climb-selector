# Data Model for ClimbRoute AI

## Entities

### ClimbingWallImage

- **Description**: Represents the image of the climbing wall captured by the user.
- **Attributes**:
  - `id`: Unique identifier for the image.
  - `imageData`: The raw image data.
  - `createdAt`: Timestamp when the image was created.

### ClimbingHold

- **Description**: Represents a single climbing hold identified in the image.
- **Attributes**:
  - `id`: Unique identifier for the hold.
  - `imageId`: Foreign key referencing the `ClimbingWallImage` it belongs to.
  - `location`: The coordinates of the hold in the image (e.g., bounding box).
  - `color`: The dominant color of the hold.

### Route

- **Description**: Represents a climbing route, which is a collection of holds of the same color.
- **Attributes**:
  - `id`: Unique identifier for the route.
  - `imageId`: Foreign key referencing the `ClimbingWallImage` it belongs to.
  - `color`: The color of the holds in this route.
  - `holds`: A list of `ClimbingHold` objects that make up the route.

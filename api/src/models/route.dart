
import 'package:climb_selector/api/src/models/climbing_hold.dart';

class Route {
  Route({
    required this.id,
    required this.imageId,
    required this.color,
    required this.holds,
  });

  final String id;
  final String imageId;
  final String color;
  final List<ClimbingHold> holds;
}

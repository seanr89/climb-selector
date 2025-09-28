
import 'package:flutter/material.dart';

class RouteDisplayScreen extends StatefulWidget {
  const RouteDisplayScreen({super.key});

  @override
  State<RouteDisplayScreen> createState() => _RouteDisplayScreenState();
}

class _RouteDisplayScreenState extends State<RouteDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Display'),
      ),
      body: Column(
        children: [
          // Placeholder for the image
          Expanded(
            child: Container(
              color: Colors.grey[300],
              child: const Center(
                child: Text('Image will be displayed here'),
              ),
            ),
          ),
          // Placeholder for the color palette
          Container(
            height: 100,
            color: Colors.grey[200],
            child: const Center(
              child: Text('Color palette will be displayed here'),
            ),
          ),
        ],
      ),
    );
  }
}

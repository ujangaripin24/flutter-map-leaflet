import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LeafletView extends StatefulWidget {
  const LeafletView({super.key});

  @override
  State<LeafletView> createState() => _LeafletView();
}

class _LeafletView extends State<LeafletView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Peta'),
      ),
      body: Center(
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(-6.914744, 107.609810),
            zoom: 9.2,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
          ],
        ),
      ),
    );
  }
}

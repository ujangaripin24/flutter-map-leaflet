import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapboxView extends StatefulWidget {
  const MapboxView({super.key});

  @override
  State<MapboxView> createState() => _MapboxViewState();
}

class _MapboxViewState extends State<MapboxView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapbox Map Example'),
      ),
      body: MapboxMap(
        accessToken:
            'pk.eyJ1IjoidWphbmdhcmlwaW4yNCIsImEiOiJjbGZlNjJsZmMzcjV4M3ByMDduN3F6NjFzIn0.seiFMY04TLajncVWrsjZIg', // Ganti dengan API key Mapbox kamu
        styleString: 'mapbox://styles/mapbox/streets-v11',
        initialCameraPosition: CameraPosition(
          target: LatLng(51.509364, -0.128928),
          zoom: 9.0,
        ),
      ),
    );
  }
}

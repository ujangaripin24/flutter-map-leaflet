import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapboxView extends StatefulWidget {
  const MapboxView({Key? key}) : super(key: key);

  @override
  _MapboxViewState createState() => _MapboxViewState();
}

class _MapboxViewState extends State<MapboxView> {
  late MapboxMapController _controller;

  // Koordinat yang ingin ditampilkan pada peta
  final LatLng targetLatLng = LatLng(-6.914744, 107.609810);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapbox View'),
      ),
      body: MapboxMap(
        accessToken:
            'pk.eyJ1IjoidWphbmdhcmlwaW4yNCIsImEiOiJjbGZlNjJsZmMzcjV4M3ByMDduN3F6NjFzIn0.seiFMY04TLajncVWrsjZIg',
        styleString: 'mapbox://styles/mapbox/streets-v11',
        onMapCreated: (MapboxMapController controller) {
          setState(() {
            _controller = controller;
          });
          _setMapCamera();
        },
        initialCameraPosition: CameraPosition(target: targetLatLng, zoom: 14.0),
      ),
    );
  }

  void _setMapCamera() {
    _controller.animateCamera(
      CameraUpdate.newLatLng(targetLatLng),
    );
  }
}

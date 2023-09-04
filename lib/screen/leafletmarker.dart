import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LeafletMarker extends StatefulWidget {
  const LeafletMarker({super.key});

  @override
  State<LeafletMarker> createState() => _LeafletMarkerState();
}

class _LeafletMarkerState extends State<LeafletMarker> {
  final List<Map<String, dynamic>> markerLokasi = [
    {
      'nama': 'Tempat 1',
      'latitude': -6.933491973432126,
      'longitude': 107.63155674812538,
    },
    {
      'nama': 'Tempat 2',
      'latitude': -6.908852821195481,
      'longitude': 107.60795488967875,
    },
    {
      'nama': 'Tempat 3',
      'latitude': -6.926992199307122,
      'longitude': 107.58541892161332,
    },
    {
      'nama': 'Tempat 4',
      'latitude': -6.947353191849231,
      'longitude': 107.59505160796726,
    },
  ];

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
            MarkerLayer(
              markers: _buildMarkersFromJsonData(),
            ),
          ],
        ),
      ),
    );
  }

  List<Marker> _buildMarkersFromJsonData() {
    List<Marker> markers = [];

    markerLokasi.forEach((lokasi) {
      var nama = lokasi['nama'];
      var latitude = lokasi['latitude'];
      var longitude = lokasi['longitude'];

      markers.add(
        Marker(
          point: LatLng(latitude, longitude),
          width: 80,
          height: 80,
          builder: (context) => Column(
            children: [
              Icon(Icons.location_pin),
            ],
          ),
        ),
      );
    });

    return markers;
  }
}

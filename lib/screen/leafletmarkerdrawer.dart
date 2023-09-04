import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LeafletMarkerDrawer extends StatefulWidget {
  const LeafletMarkerDrawer({super.key});

  @override
  State<LeafletMarkerDrawer> createState() => _LeafletMarkerDrawerState();
}

class _LeafletMarkerDrawerState extends State<LeafletMarkerDrawer> {
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
      'latitude': -6.926992199307568,
      'longitude': 107.58541892161965,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Peta Click Drawer'),
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

    markerLokasi.asMap().forEach((index, lokasi) {
      var nama = lokasi['nama'];
      var latitude = lokasi['latitude'];
      var longitude = lokasi['longitude'];

      markers.add(
        Marker(
          point: LatLng(latitude, longitude),
          width: 80,
          height: 80,
          builder: (context) => GestureDetector(
            onTap: () {
              _showMarkerInfo(context, nama, latitude, longitude);
            },
            child: Column(
              children: [
                Icon(Icons.location_pin),
              ],
            ),
          ),
        ),
      );
    });

    return markers;
  }

  void _showMarkerInfo(
      BuildContext context, String nama, double latitude, double longitude) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informasi Marker',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Text('Nama Tempat: $nama'),
              Text('Latitude: $latitude'),
              Text('Longitude: $longitude'),
            ],
          ),
        );
      },
    );
  }
}

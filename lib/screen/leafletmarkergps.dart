import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class LeafletMarkerGPS extends StatefulWidget {
  const LeafletMarkerGPS({super.key});

  @override
  State<LeafletMarkerGPS> createState() => _LeafletMarkerGPSState();
}

class _LeafletMarkerGPSState extends State<LeafletMarkerGPS> {
  final MapController _mapController = MapController();
  LatLng _currentLocation = LatLng(-6.914744,
      107.609810); // Koordinat awal sebelum mendapatkan lokasi pengguna

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print('Gagal mendapatkan lokasi: $e');
      // Tampilkan modal jika gagal mendapatkan lokasi
      _showLocationPermissionDeniedModal();
    }
  }

  void _showLocationPermissionDeniedModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Akses GPS Ditolak',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Text(
                  'Anda perlu mengizinkan akses GPS untuk melihat lokasi Anda.'),
              ElevatedButton(
                onPressed: () {
                  // Buka pengaturan aplikasi untuk izin lokasi
                  Geolocator.openLocationSettings();
                },
                child: Text('Izinkan Akses GPS'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Peta'),
      ),
      body: Center(
        child: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            center: _currentLocation, // Gunakan lokasi saat ini
            zoom: 9.2,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: _currentLocation, // Gunakan lokasi saat ini
                  width: 80,
                  height: 80,
                  builder: (context) => Icon(Icons.location_pin),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

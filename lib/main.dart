import 'package:flutter/material.dart';
import 'screen/about.dart';
import 'screen/home.dart';
import 'layout/sidebar.dart';
import 'screen/leafletmarker.dart';
import 'screen/leafletview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/about': (context) => AboutScreen(),
        '/leafletview': (context) => LeafletView(),
        '/leafletmarker': (context) => LeafletMarker(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Flutter Saya'),
      ),
      drawer: SidebarLayout(), // Tampilkan Sidebar di sini
      body: Center(
        child: Text('Isi Halaman Utama Anda di sini'),
      ),
    );
  }
}

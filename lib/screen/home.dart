import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Home'),
      ),
      body: Center(
        child: Text('Isi Halaman Home Anda di sini'),
      ),
    );
  }
}

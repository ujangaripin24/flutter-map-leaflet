import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _nameState();
}

class _nameState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman About'),
      ),
      body: Center(
        child: Text('Isi halaman Anout Anda di sini'),
      ),
    );
  }
}

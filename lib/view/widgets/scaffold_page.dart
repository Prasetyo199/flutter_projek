import 'package:flutter/material.dart';

class ScaffoldPage extends StatelessWidget {
  const ScaffoldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Scaffold Page",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.0),
        ),
        // Mengubah warna menjadi Blue Grey yang lebih gelap
        backgroundColor: Colors.blueGrey[900],
        foregroundColor: Colors.white,
        elevation: 5,
      ),
      body: Center(
        child: Text(
          "Ini adalah struktur dasar Scaffold",
          style: TextStyle(
            fontSize: 16,
            color: Colors.blueGrey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        // Mengubah warna tombol menjadi Cyan
        backgroundColor: Colors.cyan[400],
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), // Sudut lebih kotak
        ),
        child: const Icon(Icons.add_rounded, size: 30),
      ),
    );
  }
}
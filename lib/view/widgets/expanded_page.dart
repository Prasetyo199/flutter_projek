import 'package:flutter/material.dart';

class ExpandedPage extends StatelessWidget {
  const ExpandedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Mengubah warna AppBar menjadi Deep Purple
        backgroundColor: Colors.deepPurple[700],
        foregroundColor: Colors.white,
        title: const Text("Expanded Layout"),
        elevation: 2,
      ),
      body: Column(
        children: [
          // Container atas dengan warna baru
          Container(
            height: 120, // Sedikit perubahan tinggi
            color: Colors.blueGrey[800],
          ),
          // Bagian Expanded dengan modifikasi visual
          Expanded(
            child: Container(
              color: Colors.deepPurple[50], 
              child: Center(
                child: Text(
                  "Bagian ini mengambil sisa ruang",
                  style: TextStyle(
                    color: Colors.deepPurple[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          // Container bawah dengan warna baru
          Container(
            height: 120, 
            color: Colors.blueGrey[400],
          ),
        ],
      ),
    );
  }
}
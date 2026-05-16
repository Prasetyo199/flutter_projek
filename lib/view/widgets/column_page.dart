import 'package:flutter/material.dart';

class ColumnPage extends StatelessWidget {
  const ColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Column Page"),
        // Mengubah warna AppBar menjadi Deep Orange
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // Menambahkan crossAxisAlignment agar teks melebar ke seluruh layar (opsional visual)
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Item 1 (Atas)",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
          SizedBox(height: 10), // Memberi sedikit jarak antar item
          Text(
            "Item 2 (Tengah)",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange),
          ),
          SizedBox(height: 10),
          Text(
            "Item 3 (Bawah)",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class SizedboxPage extends StatelessWidget {
  const SizedboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Mengubah warna AppBar menjadi Blue Grey
        backgroundColor: Colors.blueGrey[800],
        foregroundColor: Colors.white,
        title: const Text(
          "SizedBox Spacing",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              "Teks Atas",
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
          ),
          // Tetap menggunakan SizedBox untuk jarak, namun sedikit mengubah nilainya
          SizedBox(height: 60), 
          Text(
            "Teks Bawah (Ada jarak 60px)",
            style: TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 225, 128, 2),
            ),
          ),
        ],
      ),
    );
  }
}
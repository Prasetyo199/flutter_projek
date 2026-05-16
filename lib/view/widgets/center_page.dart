import 'package:flutter/material.dart';

class CenterPage extends StatelessWidget {
  const CenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Center Page"),
        // Mengubah warna AppBar menjadi Indigo
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          "Teks ini berada tepat di tengah layar",
          // Memberikan gaya pada teks agar berbeda dari aslinya
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.indigo,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
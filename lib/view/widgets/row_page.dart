import 'package:flutter/material.dart';

class RowPage extends StatelessWidget {
  const RowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Mengubah warna AppBar menjadi Blue Grey yang solid
        backgroundColor: Colors.blueGrey[900],
        foregroundColor: Colors.white,
        title: const Text(
          "Row Layout",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const Row(
        // Logika perataan tetap sama
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Memberikan warna dan ukuran berbeda pada tiap ikon untuk variasi
          Icon(
            Icons.home_rounded,
            color: Colors.blueGrey,
            size: 40,
          ),
          Icon(
            Icons.stars_rounded,
            color: Colors.amber,
            size: 40,
          ),
          Icon(
            Icons.person_pin_rounded,
            color: Colors.blueGrey,
            size: 40,
          ),
        ],
      ),
    );
  }
}
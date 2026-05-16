import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Typography Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // Mengubah warna menjadi Amber gelap
        backgroundColor: Colors.amber[800],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          "Hello World",
          style: TextStyle(
            fontSize: 28, // Memperbesar ukuran font
            fontWeight: FontWeight.w900, // Membuat teks sangat tebal
            color: Colors.amber[900], // Mengganti warna ke Amber
            letterSpacing: 2.0, // Menambah jarak antar huruf
            fontStyle: FontStyle.italic, // Memberikan gaya miring
            decoration: TextDecoration.underline, // Menambahkan garis bawah
            decorationColor: Colors.amber[400],
            decorationThickness: 2,
          ),
        ),
      ),
    );
  }
}
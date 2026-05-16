import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Mengubah warna AppBar menjadi Blue Grey
        backgroundColor: Colors.blueGrey[800],
        foregroundColor: Colors.white,
        centerTitle: true, // Judul diletakkan di tengah
        title: const Text(
          'Detail Page',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            // Memodifikasi gaya tombol tanpa merubah fungsinya
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey[700], // Mengganti warna merah
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Tombol berbentuk kapsul
              ),
              elevation: 5,
            ),
            child: const Text(
              'Back to Home',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
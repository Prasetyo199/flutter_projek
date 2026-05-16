import 'package:flutter/material.dart';

class ImageAssetPage extends StatefulWidget {
  const ImageAssetPage({super.key});

  @override
  State<ImageAssetPage> createState() => _ImageAssetPageState();
}

class _ImageAssetPageState extends State<ImageAssetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mengubah warna latar belakang untuk suasana hangat
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        // Mengubah warna AppBar menjadi cokelat kayu
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.white,
        title: const Text(
          'Local Assets',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            // Memberikan efek bayangan pada gambar
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              // Membuat sudut jauh lebih melengkung
              borderRadius: BorderRadius.circular(25.0),
              child: Image.asset(
                'assets/images/malioboro2.jpg',
                width: 320.0, // Sedikit perubahan ukuran
                height: 320.0,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high, // Meningkatkan kualitas filter
              ),
            ),
          ),
        ),
      ),
    );
  }
}
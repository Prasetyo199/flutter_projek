import 'package:flutter/material.dart';

class AlignPage extends StatelessWidget {
  const AlignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mengubah warna AppBar menjadi lebih gelap/modern
      appBar: AppBar(
        title: const Text(
          'Align Widget Demo',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 10,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 300.0,
          width: 300.0,
          // Memberikan dekorasi agar tidak kaku (bukan sekadar warna flat)
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(color: Colors.deepPurple[100]!, width: 2),
          ),
          child: const Align(
            // Logika alignment tetap sama (bottomRight)
            alignment: Alignment.bottomRight,
            child: Padding(
              // Menambahkan sedikit padding agar logo tidak menempel persis di pojok
              padding: EdgeInsets.all(15.0),
              child: FlutterLogo(
                size: 80, // Ukuran sedikit diperbesar untuk variasi
                style: FlutterLogoStyle.horizontal, // Gaya logo diubah
              ),
            ),
          ),
        ),
      ),
    );
  }
}
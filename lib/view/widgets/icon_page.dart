import 'package:flutter/material.dart';

class IconPage extends StatefulWidget {
  const IconPage({super.key});

  @override
  State<IconPage> createState() => _IconPageState();
}

class _IconPageState extends State<IconPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Mengubah warna AppBar menjadi Deep Purple
        backgroundColor: Colors.deepPurple[800],
        foregroundColor: Colors.white,
        title: const Text(
          'Icon Gallery',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Ikon standar dengan warna monokrom yang berbeda
                  Icon(Icons.thumb_up_alt_outlined, color: Colors.blueGrey),
                  SizedBox(width: 24.0),
                  Icon(Icons.thumb_down_alt_outlined, color: Colors.blueGrey),
                ],
              ),
              SizedBox(height: 32.0), // Jarak diperlebar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Ikon berwarna dengan ukuran yang lebih besar dan warna baru
                  Icon(
                    Icons.favorite_rounded, // Mengganti jempol menjadi hati
                    color: Colors.pinkAccent,
                    size: 48.0,
                  ),
                  SizedBox(width: 24.0),
                  Icon(
                    Icons.stars_rounded, // Mengganti jempol menjadi bintang
                    color: Color.fromARGB(255, 236, 151, 5),
                    size: 48.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
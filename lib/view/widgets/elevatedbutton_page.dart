import 'dart:developer';
import 'package:flutter/material.dart';

class ElevatedButtonPage extends StatefulWidget {
  const ElevatedButtonPage({super.key});

  @override
  State<ElevatedButtonPage> createState() => _ElevatedButtonPageState();
}

class _ElevatedButtonPageState extends State<ElevatedButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Mengubah warna AppBar menjadi Amber
        backgroundColor: Colors.amber[700],
        foregroundColor: Colors.white,
        title: const Text(
          'ElevatedButton Custom',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => log('Button clicked'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent, // Mengganti Indigo
                    foregroundColor: Colors.white,
                    elevation: 8, // Memberikan bayangan lebih tinggi
                    shape: const StadiumBorder(), // Tombol berbentuk pil
                  ),
                  child: const Text('Click Me'),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton.icon(
                  onPressed: () => log('Button clicked'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan[600], // Mengganti Green
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  icon: const Icon(Icons.send_rounded), // Mengganti Ikon
                  label: const Text('Kirim Sekarang'),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.maxFinite,
                  height: 55.0, // Sedikit lebih tinggi
                  child: ElevatedButton.icon(
                    onPressed: () => log('Button clicked'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[800], // Mengganti Blue
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0), // Lebih membulat
                      ),
                      elevation: 4,
                    ),
                    icon: const Icon(Icons.touch_app_rounded),
                    label: const Text(
                      'Mulai Sekarang',
                      style: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
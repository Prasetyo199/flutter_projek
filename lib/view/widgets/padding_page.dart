import 'package:flutter/material.dart';

class PaddingPage extends StatefulWidget {
  const PaddingPage({super.key});

  @override
  State<PaddingPage> createState() => _PaddingPageState();
}

class _PaddingPageState extends State<PaddingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Mengubah warna AppBar menjadi Emerald/Green
        backgroundColor: Colors.teal[800],
        foregroundColor: Colors.white,
        title: const Text(
          'Padding Layout',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                // Mengganti warna ke Slate
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(4),
                child: const Text(
                  'Widget Tanpa Padding',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              const SizedBox(height: 20.0),
              Material(
                // Mengganti warna ke Amber
                color: Colors.amber[100],
                elevation: 2,
                borderRadius: BorderRadius.circular(8),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Widget Dengan Padding (All)',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Material(
                // Mengganti warna ke Rose/Pink
                color: Colors.pink[100],
                elevation: 2,
                borderRadius: BorderRadius.circular(8),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 12.0, // Sedikit penyesuaian vertical
                  ),
                  child: Text(
                    'Widget Symmetric',
                    style: TextStyle(color: Color.fromARGB(255, 2, 128, 107)),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Material(
                // Mengganti warna ke Emerald/Green
                color: Colors.teal[100],
                elevation: 2,
                borderRadius: BorderRadius.circular(8),
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: 40.0, // Mengubah nilai padding
                    right: 20.0,
                    top: 20.0,
                    bottom: 10.0,
                  ),
                  child: Text(
                    'Widget Padding Only',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
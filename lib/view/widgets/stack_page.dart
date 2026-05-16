import 'package:flutter/material.dart';

class StackPositionedPage extends StatefulWidget {
  const StackPositionedPage({super.key});

  @override
  State<StackPositionedPage> createState() => _StackPositionedPageState();
}

class _StackPositionedPageState extends State<StackPositionedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Mengubah warna AppBar menjadi nuansa gelap yang elegan
        backgroundColor: Colors.blueGrey[900],
        foregroundColor: Colors.white,
        title: const Text(
          'Stack & Positioned',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.cyan[400], // Mengganti Blue
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              top: 0.0,
              bottom: 0.0,
              child: Center(
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent, // Mengganti Red
                    shape: BoxShape.circle, // Variasi bentuk lingkaran
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10.0, // Sedikit penyesuaian posisi agar tidak menempel
              top: 10.0,
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.limeAccent[700], // Mengganti Red
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Positioned(
              right: 0.0,
              bottom: 0.0,
              child: Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  color: Colors.deepOrange[300], // Mengganti Orange
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 15.0,
              bottom: 15.0,
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.indigo[400], // Warna tetap Indigo namun shade berbeda
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
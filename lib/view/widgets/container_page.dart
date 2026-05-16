import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  const ContainerPage({super.key});

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Mengubah warna background AppBar
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: const Text(
          'Container',
          style: TextStyle(
            fontSize: 18.0, // Sedikit penyesuaian ukuran
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 220.0, // Sedikit penyesuaian dimensi
            height: 220.0,
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              // Mengubah warna utama menjadi Teal
              color: Colors.teal[400],
              // Membuat sudut jauh lebih melengkung
              borderRadius: BorderRadius.circular(24.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.teal.withOpacity(0.3),
                  blurRadius: 20.0,
                  spreadRadius: 2.0,
                  offset: const Offset(0.0, 10.0),
                )
              ],
            ),
            child: const Center(
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400, // Mengubah ketebalan font
                  fontStyle: FontStyle.italic, // Memberikan gaya miring
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
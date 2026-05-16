import 'package:flutter/material.dart';

class GridviewBuilderPage extends StatefulWidget {
  const GridviewBuilderPage({super.key});

  @override
  State<GridviewBuilderPage> createState() => _GridviewBuilderPageState();
}

class _GridviewBuilderPageState extends State<GridviewBuilderPage> {
  List<String> listProduct = List<String>.generate(50, (index) => 'Product $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Background body yang lebih soft
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        foregroundColor: Colors.white,
        title: const Text(
          'Product Gallery', // Sedikit variasi judul
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SafeArea(
        child: GridView.builder(
          itemCount: listProduct.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0), // Padding sedikit diperlebar
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Mengubah jumlah kolom menjadi 2 agar lebih lega
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 15.0,
            childAspectRatio: 1.2, // Mengatur proporsi kotak
          ),
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              // Menggunakan warna Light Blue dengan gradasi bayangan tipis
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.blueGrey[100]!),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                listProduct[index],
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey[800],
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
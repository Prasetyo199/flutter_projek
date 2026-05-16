import 'package:flutter/material.dart';
import '../user_page.dart';

class ListviewBuilderPage extends StatefulWidget {
  const ListviewBuilderPage({super.key});

  @override
  State<ListviewBuilderPage> createState() => _ListviewBuilderPageState();
}

class _ListviewBuilderPageState extends State<ListviewBuilderPage> {
  List<String> listProduct = List<String>.generate(50, (index) => 'Product $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mengubah warna background body menjadi ungu muda sangat lembut
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        // Mengubah warna AppBar menjadi Indigo
        backgroundColor: Colors.indigo[800],
        foregroundColor: Colors.white,
        elevation: 4,
        title: const Text(
          'Product & API List',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: listProduct.length + 1, 
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ListTile(
                  // Modifikasi warna dan bentuk menu User Page
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.indigo[100]!, width: 1),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  leading: Icon(Icons.account_circle_rounded, color: Colors.indigo[700]),
                  title: const Text(
                    "User Page (API Reqres)", 
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.indigo)
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UserPage()),
                    );
                  },
                ),
              );
            }

            final productIndex = index - 1;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  // Mengubah warna biru menjadi Indigo
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.inventory_2_outlined, size: 20, color: Colors.indigo[300]),
                    const SizedBox(width: 12),
                    Text(
                      listProduct[productIndex],
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo[900],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
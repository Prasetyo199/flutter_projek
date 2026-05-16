import 'package:flutter/material.dart';
import 'view/widgets/home_menu.dart'; 
import 'view/widgets/detail_page.dart'; 
import 'view/user_page.dart'; 
import 'view/user_detail_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'package:supabase_flutter/supabase_flutter.dart';
import 'view/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // INISIALISASI SUPABASE
  await Supabase.initialize(
    url: 'https://wbklmlljqeqqomawmayp.supabase.co', 
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6India2xtbGxqcWVxcW9tYXdtYXlwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzg5MzQ4MDgsImV4cCI6MjA5NDUxMDgwOH0.rXXIYvEW1WjRwRuOD9CgxJQxBMB6FwshGM7wWALjD_Y',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'latihanf_flutter_tyok',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
      ),
      
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/': (context) => const HomeMenu(), 
        '/detail': (context) => const DetailPage(), 
        '/user-list': (context) => const UserPage(),
        '/user-detail': (context) => const UserDetailPage(id: 0), 
        '/mahasiswa': (context) => const HalamanMahasiswa(),
      },
    );
  }
}

// --- HALAMAN UTAMA UNTUK MENAMPILKAN, MENGHAPUS, & MENAMBAH DATA ---
class HalamanMahasiswa extends StatelessWidget {
  const HalamanMahasiswa({super.key});

  // FUNGSI UNTUK MENAMPILKAN DIALOG TAMBAH DATA
  void _showAddDialog(BuildContext context) {
    final TextEditingController namaController = TextEditingController();
    final TextEditingController jurusanController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Tambah Mahasiswa"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaController,
                decoration: const InputDecoration(labelText: "Nama Mahasiswa"),
              ),
              TextField(
                controller: jurusanController,
                decoration: const InputDecoration(labelText: "Jurusan"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                if (namaController.text.isNotEmpty && jurusanController.text.isNotEmpty) {
                  // PERINTAH TAMBAH DATA KE FIREBASE
                  FirebaseFirestore.instance.collection('mahasiswa').add({
                    'nama': namaController.text,
                    'jurusan': jurusanController.text,
                    'createdAt': Timestamp.now(), // Untuk urutan data
                  });
                  Navigator.pop(context); // Tutup Dialog
                }
              },
              child: const Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Mahasiswa")),
      
      // TOMBOL TAMBAH DATA (FLOATING ACTION BUTTON)
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context),
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),

      body: StreamBuilder<QuerySnapshot>(
        // Mengambil data dan diurutkan berdasarkan waktu input terbaru
        stream: FirebaseFirestore.instance
            .collection('mahasiswa')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return const Center(child: Text("Terjadi kesalahan!"));
          
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          final docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return const Center(child: Text("Belum ada data siswa."));
          }

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(docs[index]['nama'] ?? 'Tanpa Nama'),
                  subtitle: Text(docs[index]['jurusan'] ?? 'Tanpa Jurusan'),
                  
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('mahasiswa')
                          .doc(docs[index].id) 
                          .delete();
                          
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${docs[index]['nama']} dihapus"),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
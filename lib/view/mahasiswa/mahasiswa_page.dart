import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'tam_mahasiswa_page.dart';

class MahasiswaPage extends StatelessWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Membuka jalur pemantauan live stream dari tabel 'mahasiswa' Supabase
    final Stream<List<Map<String, dynamic>>> _mahasiswaStream = Supabase
        .instance.client
        .from('mahasiswa')
        .stream(primaryKey: ['id']) 
        .order('created_at', ascending: false); // Data terbaru muncul di paling atas

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Mahasiswa'),
        backgroundColor: Colors.teal[700],
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _mahasiswaStream,
        builder: (context, snapshot) {
          // 1. Jika loading awal
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          // 2. Jika ada error jaringan/sistem
          if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          }

          final dataMahasiswa = snapshot.data ?? [];

          // 3. Jika tabel di Supabase kosong
          if (dataMahasiswa.isEmpty) {
            return const Center(
              child: Text('Belum ada data mahasiswa. Silakan tambah!'),
            );
          }

          // 4. Jika data berhasil ditangkap, langsung buat daftarnya
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: dataMahasiswa.length,
            itemBuilder: (context, index) {
              final mhs = dataMahasiswa[index];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal[100],
                    child: Text(
                      mhs['nama'][0].toString().toUpperCase(), // Ambil huruf depan nama
                      style: TextStyle(color: Colors.teal[900], fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    mhs['nama'] ?? '-',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  subtitle: Text('NPM: ${mhs['npm']} | ${mhs['jurusan']}'),
                  trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                ),
              );
            },
          );
        },
      ),
      // Tombol melayang di pojok kanan bawah untuk membuka form tambah data
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TambahMahasiswaPage()),
          );
        },
        backgroundColor: Colors.teal[700],
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
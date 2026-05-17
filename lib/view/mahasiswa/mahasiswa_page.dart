import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'tam_mahasiswa_page.dart';

class MahasiswaPage extends StatelessWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Membuka jalur pemantauan live stream dari tabel 'mahasiswa' Supabase
    final Stream<List<Map<String, dynamic>>> mahasiswaStream = Supabase
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
        stream: mahasiswaStream,
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
                      mhs['nama'] != null && mhs['nama'].toString().isNotEmpty
                          ? mhs['nama'][0].toString().toUpperCase()
                          : 'M', // Ambil huruf depan nama, jika kosong tampilkan 'M'
                      style: TextStyle(color: Colors.teal[900], fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    mhs['nama'] ?? '-',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  subtitle: Text('NPM: ${mhs['npm']} | ${mhs['jurusan']}'),
                  
                  // FITUR CRUD: TOMBOL HAPUS DATA DATA MAHASISWA
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () {
                      // Menampilkan dialog konfirmasi sebelum menghapus
                      showDialog(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            title: const Text('Hapus Data'),
                            content: Text('Apakah kamu yakin ingin menghapus data ${mhs['nama']}?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(dialogContext), // Tutup dialog jika batal
                                child: const Text('Batal'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  Navigator.pop(dialogContext); // Tutup dialog konfirmasi
                                  
                                  try {
                                    // Perintah menghapus baris di Supabase berdasarkan ID internal
                                    await Supabase.instance.client
                                        .from('mahasiswa')
                                        .delete()
                                        .eq('id', mhs['id']);

                                    // Memunculkan notifikasi sukses di bawah layar
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Data mahasiswa berhasil dihapus!')),
                                      );
                                    }
                                  } catch (e) {
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Gagal menghapus data: $e')),
                                      );
                                    }
                                  }
                                },
                                child: const Text('Hapus', style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
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
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TambahMahasiswaPage extends StatefulWidget {
  const TambahMahasiswaPage({super.key});

  @override
  State<TambahMahasiswaPage> createState() => _TambahMahasiswaPageState();
}

class _TambahMahasiswaPageState extends State<TambahMahasiswaPage> {
  final _supabase = Supabase.instance.client;
  final _npmController = TextEditingController();
  final _namaController = TextEditingController();
  
  // Pilihan jurusan untuk Dropdown
  final List<String> _daftarJurusan = [
    'Informatika',
    'Sistem Informasi',
    'Teknik Komputer',
    'Sains Data',
  ];
  String? _jurusanTerpilih;

  Future<void> _simpanData() async {
    if (_npmController.text.isEmpty || _namaController.text.isEmpty || _jurusanTerpilih == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua kolom wajib diisi!')),
      );
      return;
    }

    try {
      // Menembak data ke tabel bernama 'mahasiswa' di Supabase
      await _supabase.from('mahasiswa').insert({
        'npm': _npmController.text,
        'nama': _namaController.text,
        'jurusan': _jurusanTerpilih,
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data Mahasiswa Berhasil Disimpan!')),
        );
        Navigator.pop(context); // Kembali ke halaman list
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menyimpan: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Mahasiswa'),
        backgroundColor: Colors.teal[700],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _npmController,
              decoration: const InputDecoration(
                labelText: 'NPM / Nomor Induk Mahasiswa',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.badge_outlined),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _jurusanTerpilih,
              decoration: const InputDecoration(
                labelText: 'Pilih Jurusan',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.school_outlined),
              ),
              items: _daftarJurusan.map((String jurusan) {
                return DropdownMenuItem<String>(
                  value: jurusan,
                  child: Text(jurusan),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _jurusanTerpilih = value;
                });
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _simpanData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[700],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('SIMPAN DATA', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
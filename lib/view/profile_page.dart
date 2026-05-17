import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'widgets/home_menu.dart'; 

class ProfilePage extends StatefulWidget {
  final String email;

  const ProfilePage({super.key, required this.email});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _namaUser = "Memuat nama..."; 
  String _sebagaiUser = "Memuat status..."; // Variabel baru untuk menampung status role
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _ambilDataUser(); 
  }

  Future<void> _ambilDataUser() async {
    try {
      // Menarik data kolom 'nama' dan 'sebagai' sekaligus dari Supabase
      final List<dynamic> response = await Supabase.instance.client
          .from('users')
          .select('nama, sebagai') // Sesuaikan 'sebagai' dengan nama kolom asli di Supabase-mu
          .eq('email', widget.email)
          .limit(1);

      if (response.isNotEmpty) {
        setState(() {
          _namaUser = response[0]['nama'] ?? "Tanpa Nama";
          
          // Mengambil status dan mengubah huruf pertamanya jadi Kapital (misal: Admin / Mahasiswa)
          String rawSebagai = response[0]['sebagai'] ?? "mahasiswa";
          _sebagaiUser = _capitalize(rawSebagai);
        });
      } else {
        setState(() {
          _namaUser = "User Tidak Ditemukan";
          _sebagaiUser = "-";
        });
      }
    } catch (e) {
      setState(() {
        _namaUser = "Gagal memuat data";
        _sebagaiUser = "Eror: $e";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Fungsi pembantu untuk membuat huruf pertama jadi kapital
  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        backgroundColor: Colors.teal[700],
        foregroundColor: Colors.white,
        elevation: 4,
      ),
body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Avatar User tetap di paling atas kartu
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    child: const Icon(Icons.person, size: 50, color: Color.fromARGB(255, 3, 235, 208)),
                  ),
                  const SizedBox(height: 20),
                  
                  // LOADING / TAMPILAN DATA UTAMA
                  _isLoading 
                      ? const CircularProgressIndicator(color: Colors.teal)
                      : Column(
                          children: [
                            // 1. SEKARANG BADGE STATUS (Admin / Mahasiswa) BERADA DI PALING ATAS
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                              decoration: BoxDecoration(
                                color: _sebagaiUser.toLowerCase() == 'admin' 
                                    ? Colors.red[50] 
                                    : Colors.orange[50],
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: _sebagaiUser.toLowerCase() == 'admin' 
                                      ? Colors.red.shade300 
                                      : Colors.orange.shade300,
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                _capitalize(_sebagaiUser),
                                style: TextStyle(
                                  fontSize: 12, 
                                  fontWeight: FontWeight.bold, 
                                  color: _sebagaiUser.toLowerCase() == 'admin' 
                                      ? Colors.red[800] 
                                      : Colors.orange[800],
                                ),
                              ),
                            ),
                            
                            const SizedBox(height: 12), // Jarak antara badge dan nama
                            
                            // 2. NAMA LENGKAP USER DILETAKKAN DI BAWAH BADGE STATUS
                            Text(
                              _namaUser,
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                  
                  const SizedBox(height: 8),
                  
                  // 3. Tampilan Email User tetap di bawah nama
                  Text(
                    'Email: ${widget.email}',
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 32),
                  
                  // Tombol Masuk ke Menu Utama
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeMenu()),
                        );
                      },
                      icon: const Icon(Icons.dashboard_customize_rounded),
                      label: const Text('MASUK KE MENU UTAMA'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Tombol Logout
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('LOGOUT', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
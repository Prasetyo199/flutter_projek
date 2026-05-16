import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Import Supabase

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk menangkap ketikan email dan password user
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  // Fungsi Logika Login Supabase
  void _login() async {
    // Validasi input kosong
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email dan password wajib diisi!"), 
          backgroundColor: Colors.orange
        ),
      );
      return;
    }

    setState(() { _isLoading = true; });

    try {
      // Menembak langsung ke tabel 'users' di Supabase untuk mencocokkan data
      final data = await Supabase.instance.client
          .from('users')
          .select()
          .eq('email', _emailController.text.trim())
          .eq('password', _passwordController.text.trim());

      if (data.isNotEmpty) {
        // JIKA COCOK: Pindah ke halaman utama ('/') alias HomeMenu
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/'); 
        }
      } else {
        // JIKA SALAH INPUT
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Email atau Password salah!"), 
              backgroundColor: Colors.red
            ),
          );
        }
      }
    } catch (e) {
      // JIKA TERJADI ERROR KONEKSI/SISTEM
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Terjadi kesalahan: $e"), 
            backgroundColor: Colors.red
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() { _isLoading = false; });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ikon Keren Tema Teal
              Icon(Icons.cloud_done_rounded, size: 90, color: Colors.teal[700]),
              const SizedBox(height: 16),
              Text(
                "Login Supabase", 
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal[900])
              ),
              const SizedBox(height: 32),
              
              // Input Email
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email", 
                  prefixIcon: const Icon(Icons.email), 
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                ),
              ),
              const SizedBox(height: 16),
              
              // Input Password
              TextField(
                controller: _passwordController,
                obscureText: true, // Biar password tersamar jadi bintang/titik
                decoration: InputDecoration(
                  labelText: "Password", 
                  prefixIcon: const Icon(Icons.lock), 
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                ),
              ),
              const SizedBox(height: 24),
              
              // Tombol Login
              SizedBox(
                width: double.infinity, 
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[700], 
                    foregroundColor: Colors.white, 
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                  ),
                  child: _isLoading 
                      ? const CircularProgressIndicator(color: Colors.white) 
                      : const Text("LOGIN", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
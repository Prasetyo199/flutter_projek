import 'dart:developer';
import 'package:flutter/material.dart';

class TextfieldPage extends StatefulWidget {
  const TextfieldPage({super.key});

  @override
  State<TextfieldPage> createState() => _TextfieldPageState();
}

class _TextfieldPageState extends State<TextfieldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Mengubah warna AppBar menjadi Deep Teal
        backgroundColor: Colors.teal[900],
        foregroundColor: Colors.white,
        title: const Text(
          'Input Form',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView( // Ditambahkan agar tidak overflow saat keyboard muncul
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Enter full name',
                    labelStyle: TextStyle(color: Colors.teal[700]),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal[900]!, width: 2),
                    ),
                  ),
                  maxLength: 50,
                ),
                const SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Enter phone number',
                    filled: true,
                    fillColor: Colors.indigo[50],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.phone_android_rounded, color: Colors.indigo),
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 13,
                ),
                const SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'Enter email address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Colors.teal, width: 2),
                    ),
                    prefixIcon: const Icon(Icons.alternate_email_rounded, color: Colors.teal),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 50,
                ),
                const SizedBox(height: 16.0),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Security Password',
                    hintText: 'Enter password',
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    prefixIcon: const Icon(Icons.lock_outline_rounded, color: Colors.blueGrey),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.remove_red_eye_rounded, color: Colors.blueGrey),
                      onPressed: () => log('Update password visibility'),
                    ),
                  ),
                  maxLength: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
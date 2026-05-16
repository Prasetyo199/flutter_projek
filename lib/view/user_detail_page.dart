import 'package:flutter/material.dart';
import '../services/user_service.dart';
import '../models/user_model.dart';

class UserDetailPage extends StatelessWidget {
  final int id;
  const UserDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final UserService userService = UserService();

    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        backgroundColor: Colors.indigo[800],
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<UserModel>(
        future: userService.fetchDetailUser(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final user = snapshot.data!;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.indigo[100],
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  user.fullName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text("Back to List"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
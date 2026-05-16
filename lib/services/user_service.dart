import 'package:dio/dio.dart';
import '../models/user_model.dart';

class UserService {
  // Inisialisasi Dio
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  /// Mengambil daftar user dari API
  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await _dio.get('/users?page=1');

      if (response.statusCode == 200) {
        // Dio otomatis mendecode JSON menjadi Map
        final List<dynamic> userList = response.data['data'];

        // Merubah list data menjadi List of UserModel
        return userList.map((user) => UserModel.fromJson(user)).toList();
      } else {
        throw Exception('Gagal memuat data: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      // Penanganan error khusus Dio
      String errorMessage = _handleDioError(e);
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Terjadi kesalahan sistem: $e');
    }
  }

  /// Mengambil detail user berdasarkan ID
  Future<UserModel> fetchDetailUser(int id) async {
    try {
      final response = await _dio.get('/users/$id');
      
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['data']);
      } else {
        throw Exception('User tidak ditemukan');
      }
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  /// Helper untuk merapikan pesan error dari Dio
  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Koneksi lambat, silakan coba lagi.";
      case DioExceptionType.receiveTimeout:
        return "Server tidak merespons.";
      case DioExceptionType.badResponse:
        return "Error Server: ${error.response?.statusCode}";
      case DioExceptionType.connectionError:
        return "Tidak ada koneksi internet.";
      default:
        return "Terjadi kesalahan yang tidak terduga.";
    }
  }
}
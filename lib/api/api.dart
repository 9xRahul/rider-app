import 'package:taxi_app/models/UserModel.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<String> loginUser({
    required String username,
    required String password,
  }) async {
    try {
      Map<String, dynamic> body = {"username": username, "password": password};

      final response = await http
          .post(Uri.parse("https://fakestoreapi.com/auth/login"), body: body)
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Login failed. Status Code: ${response.statusCode}");
      }
    } on http.ClientException catch (e) {
      throw Exception("Network error: ${e.message}");
    } on FormatException catch (e) {
      throw Exception("Invalid response format: ${e.message}");
    } on Exception catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }
}

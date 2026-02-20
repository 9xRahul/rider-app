import 'package:taxi_app/models/UserModel.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<String> loginUser({
    required String username,
    required String password,
  }) async {
    Map<String, dynamic> body = {"username": username, "password": password};
    var response = await http.post(
      Uri.parse("https://fakestoreapi.com/auth/login"),
      body: password,
    );
    var respo = response.body;

    return respo;
  }
}

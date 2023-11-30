import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:new_bloc/model/user_model.dart';

class UsersRepo {
  static Future<List<UserModel>> fetchUsers() async {
    List<UserModel> users = [];
    try {
      http.Response response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        UserModel user = UserModel.fromJson(result[i] as Map<String, dynamic>);
        users.add(user);
      }

      return users;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}

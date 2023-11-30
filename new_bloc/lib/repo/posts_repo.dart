import 'dart:convert';
import 'dart:developer';
import 'package:new_bloc/model/posts_model.dart';
import 'package:http/http.dart' as http;

class PostsRepo {
  static Future<List<PostsModel>> fetchPosts() async {
    List<PostsModel> posts = [];
    try {
      http.Response response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        PostsModel post = PostsModel.fromMap(result[i] as Map<String, dynamic>);
        posts.add(post);
      }

      return posts;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}

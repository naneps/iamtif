//TODO: Implement HomeController

import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:iamtif/app/models/post_model.dart';

class HomeController extends GetxController {
  RxList<PostModel> posts = <PostModel>[].obs;

  void getPosts() async {
    try {
      String jsonData = await rootBundle.loadString('assets/json/posts.json');
      Map<String, dynamic> data = json.decode(jsonData);

      // Assuming the key for the list of posts is 'posts'
      List<dynamic> postsData = data['posts'];

      posts.assignAll(
          postsData.map((post) => PostModel.fromJson(post)).toList());
    } catch (e) {
      print('Error loading posts: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPosts();
  }
}

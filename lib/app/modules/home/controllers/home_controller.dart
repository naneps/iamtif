//TODO: Implement HomeController

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:iamtif/app/models/post_model.dart';
import 'package:iamtif/app/modules/core/controllers/core_controller.dart';

class HomeController extends GetxController {
  RxList<PostModel> posts = <PostModel>[].obs;
  ScrollController scrollController = ScrollController();
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
    scrollController.addListener(() {
      //   listen when scrolling  hide bottom sheet
      //when not scrollingshow bottomsheet
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        Get.find<CoreController>().isShowBottomSheet.value = true;
        Get.find<CoreController>().positionBottomSheet.value = -50;
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        Get.find<CoreController>().positionBottomSheet.value = 0;
        Get.find<CoreController>().isShowBottomSheet.value = false;
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamtif/app/modules/home/widgets/post_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () {
              return Expanded(
                  child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  final post = controller.posts[index];
                  return PostWidget(
                    post: post,
                  );
                },
                itemCount: controller.posts.length,
              ));
            },
          )
        ],
      ),
    );
  }
}

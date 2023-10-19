import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IntroductionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'IntroductionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

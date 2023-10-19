import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/core_controller.dart';

class CoreView extends GetView<CoreController> {
  const CoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CoreView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CoreView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

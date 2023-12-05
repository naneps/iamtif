import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/membership_controller.dart';

class MembershipView extends GetView<MembershipController> {
  const MembershipView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MembershipView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MembershipView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

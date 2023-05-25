import 'package:flutter/material.dart';
import 'package:bakery/core.dart';
import '../controller/users_controller.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);

  Widget build(context, UsersController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        actions: [
          IconButton(
            onPressed: () => controller.doLogout(),
            icon: const Icon(
              Icons.logout,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }

  @override
  State<UsersView> createState() => UsersController();
}

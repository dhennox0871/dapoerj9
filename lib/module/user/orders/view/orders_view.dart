import 'package:flutter/material.dart';
import 'package:bakery/core.dart';
import '../controller/orders_controller.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({Key? key}) : super(key: key);

  Widget build(context, OrdersController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
        actions: const [],
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
  State<OrdersView> createState() => OrdersController();
}

import 'package:flutter/material.dart';
import 'package:bakery/state_util.dart';
import '../view/orders_view.dart';

class OrdersController extends State<OrdersView> implements MvcController {
  static late OrdersController instance;
  late OrdersView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
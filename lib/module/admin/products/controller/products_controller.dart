import 'package:flutter/material.dart';
import 'package:bakery/state_util.dart';
import '../view/products_view.dart';

class ProductsController extends State<ProductsView> implements MvcController {
  static late ProductsController instance;
  late ProductsView view;

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

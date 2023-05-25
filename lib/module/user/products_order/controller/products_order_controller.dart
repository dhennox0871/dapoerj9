import 'package:flutter/material.dart';
import 'package:bakery/state_util.dart';
import '../view/products_order_view.dart';

class ProductsOrderController extends State<ProductsOrderView>
    implements MvcController {
  static late ProductsOrderController instance;
  late ProductsOrderView view;

  @override
  void initState() {
    instance = this;
    id = widget.item!['id'];
    photo = widget.item!['photo'];
    itemcode = widget.item!['itemcode'];
    itemtitle = widget.item!['itemtitle'];
    salesprice = widget.item!['salesprice'];
    description = widget.item!['description'];
    itemcategory = widget.item!['itemcategory'];
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  String? id;
  String? photo;
  String? itemcode;
  String? itemtitle;
  String? description;
  String? itemcategory;
  double salesprice = 0;

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}

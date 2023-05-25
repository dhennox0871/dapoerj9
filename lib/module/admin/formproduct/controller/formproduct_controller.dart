import 'package:flutter/material.dart';
import 'package:bakery/core.dart';

class FormproductController extends State<FormproductView>
    implements MvcController {
  static late FormproductController instance;
  late FormproductView view;

  @override
  void initState() {
    instance = this;
    if (isEditMode) {
      id = widget.item!['id'];
      photo = widget.item!['photo'];
      itemcode = widget.item!['itemcode'];
      itemtitle = widget.item!['itemtitle'];
      salesprice = widget.item!['salesprice'];
      description = widget.item!['description'];
      itemcategory = widget.item!['itemcategory'];
    }
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool get isEditMode => widget.item != null;

  String? id;
  String? photo;
  String? itemcode;
  String? itemtitle;
  String? description;
  String? itemcategory;
  double salesprice = 0;

  doSave() async {
    showLoading();
    if (isEditMode) {
      await ProductServie().update(
          id: id!,
          photo: photo!,
          itemcode: itemcode!,
          itemtitle: itemtitle!,
          description: description!,
          itemcategory: itemcategory!,
          salesprice: salesprice);
    } else {
      await ProductServie().create(
          photo: photo!,
          itemcode: itemcode!,
          itemtitle: itemtitle!,
          description: description!,
          itemcategory: itemcategory!,
          salesprice: salesprice);
    }
    hideLoading();
    Get.back();
  }
}

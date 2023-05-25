import 'package:cloud_firestore/cloud_firestore.dart';

class ProductServie {
  create(
      {required String photo,
      required String itemcode,
      required String itemtitle,
      required String description,
      required String itemcategory,
      required double salesprice}) async {
    await FirebaseFirestore.instance.collection("products").add({
      "photo": photo,
      "itemcode": itemcode,
      "itemtitle": itemtitle,
      "description": description,
      "itemcategory": itemcategory,
      "salesprice": salesprice,
    });
  }

  update(
      {required String id,
      required String photo,
      required String itemcode,
      required String itemtitle,
      required String description,
      required String itemcategory,
      required double salesprice}) async {
    await FirebaseFirestore.instance.collection("products").doc(id).update({
      "photo": photo,
      "itemcode": itemcode,
      "itemtitle": itemtitle,
      "description": description,
      "itemcategory": itemcategory,
      "salesprice": salesprice,
    });
  }
}

import 'package:bakery/service/main_storage_service/main_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileService {
  static Map<String, dynamic>? data;
  static init() async {
    var snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (snapshot.exists) {
      data = snapshot.data();
      return;
    } else {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "email": FirebaseAuth.instance.currentUser!.email ?? 'email',
        "name": FirebaseAuth.instance.currentUser!.displayName ?? 'NoName',
        "photo": FirebaseAuth.instance.currentUser!.photoURL ??
            "https://i.ibb.co/S32HNjD/no-image.jpg",
        "rules": "user",
        "point": 0
      });
      var snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      if (snapshot.exists) {
        data = snapshot.data();
        return;
      }
    }
    await mainStorage.put("dataLogin", data);
  }
}

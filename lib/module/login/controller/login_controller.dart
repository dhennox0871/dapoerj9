import 'package:flutter/material.dart';
import 'package:bakery/core.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String email = '';
  String password = '';
  bool isLoginNow = mainStorage.get("isloginnow") ?? false;

  doLogin() async {
    try {
      showLoading();
      await AuthService().Login(email: email, password: password);
      await UserProfileService.init();
      var cekRules = UserProfileService.data!["rules"];
      //print(cekRules);
      if (cekRules == "admin") {
        Get.offAll(const DashboardView());
      } else {
        Get.offAll(const UserdashboardView());
      }
      hideLoading();
    } on Exception {
      const snackBar = SnackBar(
        content: Text('Email dan Password Salah!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      hideLoading();
    }
  }

  doLoginGoogle() async {
    try {
      showLoading();
      if (await AuthService().LoginGoogle()) {
        await UserProfileService.init();
        var cekRules = UserProfileService.data!["rules"];
        //print(cekRules);
        if (cekRules == "admin") {
          Get.offAll(const DashboardView());
        } else {
          Get.offAll(const UserdashboardView());
        }
      } else {
        Get.offAll(const LoginView());
      }
      hideLoading();
    } on Exception {
      const snackBar = SnackBar(
        content: Text('Email dan Password Google Salah !'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      hideLoading();
    }
  }
}

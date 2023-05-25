import 'package:bakery/core.dart';
import 'package:flutter/material.dart';

class UserdashboardController extends State<UserdashboardView>
    implements MvcController {
  static late UserdashboardController instance;
  late UserdashboardView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  int selectedIndex = 0;
  updateIndex(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}

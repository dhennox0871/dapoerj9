import 'package:flutter/material.dart';
import 'package:bakery/state_util.dart';
import '../view/homepage_view.dart';

class HomepageController extends State<HomepageView> implements MvcController {
  static late HomepageController instance;
  late HomepageView view;

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
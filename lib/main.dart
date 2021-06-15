import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dependency_config.dart';
import 'presentation/pages/home_page/home_page_view.dart';

void main() {
  initializerDependencys();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Automakers Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

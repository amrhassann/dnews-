
import 'package:dnews/others/binding.dart';
import 'package:dnews/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
main() => runApp(App());

class App extends StatelessWidget {

  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}



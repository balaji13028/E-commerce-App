import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/pages/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      enableLog: false,
      debugShowCheckedModeBanner: false,
      title: "Shopping App",
      home: LandingPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/routes.dart';
import 'package:flutter_application_1/views/login.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(FarmMarketApp());
}

class FarmMarketApp extends StatefulWidget {
  const FarmMarketApp({super.key});

  @override
  State<FarmMarketApp> createState() => _FarmMarketAppState();
}

class _FarmMarketAppState extends State<FarmMarketApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FarmMarket',
      debugShowCheckedModeBanner: false,
      home: Login(),
      initialRoute: "/",
      getPages: routes,
    );
  }
}

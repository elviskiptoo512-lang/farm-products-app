import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/routes.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/views/login.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(CartController());
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

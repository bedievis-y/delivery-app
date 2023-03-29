import 'package:delivery_app/presentation/pages/home_page.dart';
import 'package:delivery_app/presentation/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ZoomDrawer(
        mainScreen: HomePage(),
        menuScreen: const MenuPage(),
      ),
    );
  }
}

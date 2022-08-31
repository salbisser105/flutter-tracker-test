import 'package:flutter/material.dart';
import 'package:flutter_crypto_test/price_tracker/ui/pages/preloader_page.dart';

import 'price_tracker/ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {'/home': (context) => const HomePage()},
      home: const PreloaderPage(),
    );
  }
}

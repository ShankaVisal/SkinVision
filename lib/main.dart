import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/Pages/skin_scan_page.dart';
import 'package:untitled5/Screens/splashScreen.dart';
import 'package:untitled5/controllers/firebase_options.dart';
import 'package:untitled5/Pages/home_screen_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 239, 168, 133)),
        useMaterial3: true,
      ),
      home: const  SkinScanPage()/*HomeScreenPage()*/ /*splashScreen()*/,
    );
  }
}

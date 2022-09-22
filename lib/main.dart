// ignore_for_file: prefer_const_constructors, duplicate_ignore, use_key_in_widget_constructors, unused_import, unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpbshb/book.dart';
import 'onBoardingScreen.dart';
import 'HomePage.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Color purple = Color(0xff2F2754);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final pref = await SharedPreferences.getInstance();
  final keyTrue = pref.getBool("KeyTrue") ?? false;

  runApp(ProviderScope(child: MyApp(keyTrue: keyTrue)));
}

class MyApp extends StatelessWidget {
  bool keyTrue;
  MyApp({Key? key, required this.keyTrue}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: keyTrue == true ? MyHomePage() : OnBoardingScreen(),
    );
  }
}

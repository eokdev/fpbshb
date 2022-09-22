// ignore_for_file: file_names, prefer_const_constructors, unused_import, no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers, use_full_hex_values_for_flutter_colors, prefer_const_literals_to_create_immutables, unnecessary_import, use_build_context_synchronously, unused_local_variable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpbshb/main.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'HomePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "animation.dart";

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F4FE),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.star,
                      color: Color(0xff2F2754),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.book, color: Color(0xff2F2754)),
                  )
                ],
              ),
            ),
            Column(
              children: [
                FadeAnimation(
                  1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "FPB",
                        style: GoogleFonts.inter(
                          fontSize: 30,
                          color: purple,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      FaIcon(FontAwesomeIcons.graduationCap,
                          size: 30, color: purple),
                    ],
                  ),
                ),
                Text(
                  "Student Handbook",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 30,
                    color: purple,
                  ),
                ),
              ],
            ),
            Expanded(
              child: FadeAnimation(
                1,
                SizedBox(
                    height: 300,
                    child: SvgPicture.asset(
                      "assets/draw.svg",
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FadeAnimation(
                1,
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: purple, borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: FadeAnimation(
                      2,
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                "Get started",
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                final pref =
                                    await SharedPreferences.getInstance();
                                pref.setBool("KeyTrue", true);
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => MyHomePage()));
                              },
                              child: FadeAnimation(
                                2,
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: FaIcon(
                                    FontAwesomeIcons.arrowRightLong,
                                    color: purple,
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, unused_import, unnecessary_import, sized_box_for_whitespace, avoid_unnecessary_containers, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps, unrelated_type_equality_checks, prefer_typing_uninitialized_variables, library_private_types_in_public_api, deprecated_member_use

import 'dart:convert';

import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpbshb/anotherListClass.dart';
import 'package:fpbshb/restApi.dart';
import "animation.dart";
import 'package:fpbshb/main.dart';
import 'package:fpbshb/sectionPage.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'HomePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'apiController.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  Key keyy = UniqueKey();
  void restartApp() {
    setState(() {
      keyy = UniqueKey();
    });
  }

  List<RestApi> taskk = [];
  List<RestApi> suggestion = [];
  @override
  void initState() {
    suggestion;
    //   suggestion = taskk;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(userDataProvider);
    ScrollController scrollController =
        ScrollController(initialScrollOffset: 0);
// getter.addAll(task);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: keyy,
        backgroundColor: Color(0xffF8F4FE),
        body: Scrollbar(
           showTrackOnHover: true,
                  controller: scrollController,
                  isAlwaysShown: true,
          child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: SafeArea(
                child: Theme(
                  data: Theme.of(context).copyWith(
                      scrollbarTheme: ScrollbarThemeData(crossAxisMargin: 4)),
                  child: ListView(
                    controller: scrollController,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: purple,
                                  child: Icon(
                                    FontAwesomeIcons.shapes,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  child: Text(
                                    "TABLE OF CONTENT",
                                    style: GoogleFonts.inter(
                                        color: purple,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            FadeAnimation(
                              1,
                              Container(
                                height: 140,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: purple.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Container(
                                                height: 120,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: purple,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Image(
                                                    image: AssetImage(
                                                        "images/hand.png"))),
                                            SizedBox(width: 20),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "FPBSIH",
                                                    style: GoogleFonts.inter(
                                                        color: purple,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  Text("TABLE OF CONTENT",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.inter(
                                                          color: purple,
                                                          fontSize: 15)),
                                                  ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                        purple.withOpacity(0.4),
                                                      )),
                                                      onPressed: () {},
                                                      child: Text(
                                                        "HANDBOOK",
                                                        style:
                                                            GoogleFonts.inter(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 10),
                                                      ))
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 70,
                                        height: 100,
                                        child: Image(
                                            image: AssetImage(
                                                "images/undraw.png")),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            tasks.when(
                                data: (data) {
                                  List<RestApi> task =
                                      data.map((e) => e).toList();
        
                                  for (int i = 0; i < task.length; i++) {
                                    suggestion.add(task[i]);
                                  }
                                  // runFilter(String enteredValue) {
                                  //   suggestion = taskk.where((element) {
                                  //     final textes = enteredValue.toLowerCase();
                                  //     final result = taskk.toString().toLowerCase();
                                  //     print(suggestion.length);
                                  //     return result.contains(textes);
                                  //   }).toList();
                                  // }
        
                                  return Flexible(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                              width: double.infinity,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  border:
                                                      Border.all(color: purple),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: TextFormField(
                                                onChanged: (text) {
                                                  suggestion =
                                                      task.where((element) {
                                                    final textes =
                                                        text.toLowerCase();
        
                                                    return element.chapter!
                                                        .toLowerCase()
                                                        .contains(textes);
                                                  }).toList();
                                                  setState(() {});
                                                },
                                                autofocus: false,
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            15, 8, 15, 8),
                                                    hintStyle:
                                                        GoogleFonts.inter(
                                                            fontSize: 18,
                                                            color: Colors.grey,
                                                            letterSpacing: 2),
                                                    hintText: "Search...",
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                            borderSide:
                                                                BorderSide(
                                                                    color:
                                                                        purple,
                                                                    width: 2))),
                                              )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: suggestion.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        index) {
                                                  var test = suggestion[index];
        
                                                  //  print(taskk.length);
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            CupertinoPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        SectionPage(
                                                                          subCategory:
                                                                              test.subCategory,
                                                                          // subCart: test.subCategory,
                                                                          restApi:
                                                                              test.chapter,
                                                                        )));
                                                      },
                                                      child: FadeAnimation(
                                                        2,
                                                        Material(
                                                          elevation: 4,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          child: Container(
                                                            height: 80,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: ListTile(
                                                                horizontalTitleGap:
                                                                    10,
                                                                contentPadding:
                                                                    EdgeInsets.only(
                                                                        left:
                                                                            15),
                                                                dense: true,
                                                                leading: Icon(
                                                                    FontAwesomeIcons
                                                                        .shapes,
                                                                    color:
                                                                        purple,
                                                                    size: 25),
                                                                title: Text(
                                                                    test.chapter
                                                                        .toString(),
                                                                    style: GoogleFonts.inter(
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            purple)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                error: (err, s) => Expanded(
                                      child: Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "$err, Connect to the Internet "),
                                          FlatButton(
                                              color: purple,
                                              onPressed: () {
                                                setState(() {
                                                  restartApp();
                                                });
                                              },
                                              child: Text("Refresh",
                                                  style: GoogleFonts.inter(
                                                      fontSize: 16,
                                                      color: Colors.white))),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              "After refresh, and error persists... Pls, restart Application."),
                                        ],
                                      )),
                                    ),
                                loading: () => Expanded(
                                      child: Center(
                                        child: SpinKitFadingCube(color: purple),
                                      ),
                                    ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
// void  search(String query){
// final suggestions= tasks.tasksList.where((test) {
// final books= test.chapter;
// final input=query.toLowerCase();
// return 
// }).toList();
// }
// }
                  
// ignore_for_file: file_names, duplicate_ignore, avoid_function_literals_in_foreach_calls
// ignore_for_file: file_names, unnecessary_overrides, unused_import, unused_local_variable, avoid_print, avoid_renaming_method_parameters, annotate_overrides
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fpbshb/anotherListClass.dart';

import 'package:http/http.dart' as https;
import 'restApi.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskController {

  Future<List<RestApi>> getPostApi() async {
    var client = https.Client();

    var uri = Uri.parse(
        "https://mtube-rest-api.herokuapp.com/handbook/api/handbook-list-handbook");
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      List json = jsonDecode(response.body);
      fetcher = List.from(json).map((e) => RestApi.fromJson(e)).toList();
     // print(fetcher);
      return fetcher;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
    List<RestApi> fetcher = <RestApi>[];
  List<RestApi> launch=<RestApi>[];
}

final userProvider = Provider<TaskController>((ref) => TaskController());
   // json.forEach((element) {
      //   Map obj = element;
      //   var name = subJson1[3];
      //   print(name);
      // });

            //     var restApi = restApiFromJson(json.toString());
      //     // SubCategoryElement element = SubCategoryElement.fromJson(json);
      //  for (var e in json) {
      //    tasksList.add(RestApi.fromJson(e));

      //  }
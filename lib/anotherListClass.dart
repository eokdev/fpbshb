// ignore_for_file: file_names, unused_import, prefer_const_declarations

import 'package:fpbshb/apiController.dart';
import 'package:fpbshb/restApi.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataProvider = FutureProvider<List<RestApi>>((ref) async {
  return ref.watch(userProvider).getPostApi();
});

final launcherData= FutureProvider<List<RestApi>>((ref) async{
  return ref.watch(userProvider).launch;
});

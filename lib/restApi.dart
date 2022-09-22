// ignore_for_file: unused_import, unnecessary_this, prefer_collection_literals, unnecessary_new, file_names, unnecessary_null_comparison, prefer_if_null_operators, constant_identifier_names, duplicate_ignore, prefer_void_to_null

import 'dart:convert';

import 'package:flutter/material.dart';
// To parse this JSON data, do
//
//     final restApi = restApiFromJson(jsonString);

List<RestApi> restApiFromJson(String str) =>
    List<RestApi>.from(json.decode(str).map((x) => RestApi.fromJson(x)));

String restApiToJson(List<RestApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategoryElement {
  SubCategoryElement({
    required this.id,
    required this.category,
    required this.name,
    required this.isBold,
    required this.isCapitalLetter,
    required this.isItalic,
   required this.content,
  });

  int? id;
  RestApi? category;
  String? name;
  bool? isBold;
  bool? isCapitalLetter;
  bool? isItalic;
  List<Content>? content;

  factory SubCategoryElement.fromJson(Map<String, dynamic> json) =>
      SubCategoryElement(
        id: json["id"],
        category: RestApi.fromJson(json["category"]),
        name: json["name"],
        isBold: json["is_bold"],
        isCapitalLetter: json["is_capital_letter"],
        isItalic: json["is_italic"],
        content:List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category!.toJson(),
        "name": name,
        "is_bold": isBold,
        "is_capital_letter": isCapitalLetter,
        "is_italic": isItalic,
        "content": List<dynamic>.from(content!.map((x) => x.toJson())),
      };
}

class RestApi {
  int? id;
  String? chapter;
  bool? isBold;
  bool? isCapitalLetter;
  bool isItalic;
  List<SubCategoryElement>? subCategory;
  RestApi({
    required this.id,
    required this.chapter,
    required this.isBold,
    required this.isCapitalLetter,
    required this.isItalic,
    required this.subCategory,
  });

  factory RestApi.fromJson(Map<String, dynamic> json) => RestApi(
        id: json["id"],
        chapter: json["chapter"],
        isBold: json["is_bold"],
        isCapitalLetter: json["is_capital_letter"],
        isItalic: json["is_italic"],
        subCategory: json["sub_category"] == null
            ? []
            : List<SubCategoryElement>.from(json["sub_category"]
                .map((x) => SubCategoryElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chapter": chapterValues.reverse[chapter],
        "is_bold": isBold,
        "is_capital_letter": isCapitalLetter,
        "is_italic": isItalic,
        "sub_category": subCategory == null
            ? null
            : List<dynamic>.from(subCategory!.map((x) => x.toJson())),
      };
}

class Content {
  Content({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.number,
    required this.body,
    required this.isBold,
    required this.isCenter,
    required this.isList,
    required this.isParagraph,
    required this.isNumber,
    required this.isItalic,
    required this.isTable,
    required this.isCapitalLetter,
    required this.isAnotherContent,
    required this.subCategory,
    required this.listContents,
    required this.listTableHeader,
    required this.listSubContent,
  });

  int? id;
  String? title;
  String? subTitle;
  dynamic number;
  String? body;
  bool? isBold;
  bool? isCenter;
  bool? isList;
  bool? isParagraph;
  bool? isNumber;
  bool? isItalic;
  bool? isTable;
  bool? isCapitalLetter;
  bool? isAnotherContent;
  ContentSubCategory? subCategory;
  List<ListContent>? listContents;
  List<ListContent>? listTableHeader;
  List<ListContent>? listSubContent;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        title: json["title"] == null ? null : json["title"],
        subTitle: json["sub_title"] == null ? null : json["sub_title"],
        number: json["number"],
        body: json["body"],
        isBold: json["is_bold"],
        isCenter: json["is_center"],
        isList: json["is_list"],
        isParagraph: json["is_paragraph"],
        isNumber: json["is_number"],
        isItalic: json["is_italic"],
        isTable: json["is_table"],
        isCapitalLetter: json["is_capital_letter"],
        isAnotherContent: json["is_another_content"],
        subCategory: ContentSubCategory.fromJson(json["sub_category"]),
        listContents: List<ListContent>.from(
            json["list_contents"].map((x) => ListContent.fromJson(x))),
        listTableHeader: List<ListContent>.from(
            json["list_table_header"].map((x) => ListContent.fromJson(x))),
        listSubContent: List<ListContent>.from(
            json["list_sub_content"].map((x) => ListContent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title == null ? null : title,
        "sub_title": subTitle == null ? null : subTitle,
        "number": number,
        "body": body,
        "is_bold": isBold,
        "is_center": isCenter,
        "is_list": isList,
        "is_paragraph": isParagraph,
        "is_number": isNumber,
        "is_italic": isItalic,
        "is_table": isTable,
        "is_capital_letter": isCapitalLetter,
        "is_another_content": isAnotherContent,
        "sub_category": subCategory!.toJson(),
        "list_contents":
            List<dynamic>.from(listContents!.map((x) => x.toJson())),
        "list_table_header":
            List<dynamic>.from(listTableHeader!.map((x) => x.toJson())),
        "list_sub_content":
            List<dynamic>.from(listSubContent!.map((x) => x.toJson())),
      };
}

class ListContent {
  ListContent({
    required this.id,
    required this.name,
    required this.number,
    required this.isBold,
    required this.isItalic,
    required this.isCapitalLetter,
    required this.isBorder,
    required this.isCenter,
    required this.content,
    required this.body,
    required this.isNumber,
    required this.tableBody,
    required this.header,
  });

  int? id;
  String? name;
  String? number;
  bool? isBold;
  bool? isItalic;
  bool? isCapitalLetter;
  bool? isBorder;
  bool? isCenter;
  int ?content;
  String? body;
  bool? isNumber;
  List<ListContent>? tableBody;
  int? header;

  factory ListContent.fromJson(Map<String, dynamic> json) => ListContent(
        id: json["id"],
        name: json["name"] == null ? null : json["name"],
        number: json["number"] == null ? null : json["number"],
        isBold: json["is_bold"],
        isItalic: json["is_italic"],
        isCapitalLetter: json["is_capital_letter"],
        isBorder: json["is_border"] == null ? null : json["is_border"],
        isCenter: json["is_center"] == null ? null : json["is_center"],
        content: json["content"] == null ? null : json["content"],
        body: json["body"] == null ? null : json["body"],
        isNumber: json["is_number"] == null ? null : json["is_number"],
        tableBody: json["table_body"] == null
            ? []
            : List<ListContent>.from(
                json["table_body"].map((x) => ListContent.fromJson(x))),
        header: json["header"] == null ? null : json["header"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name == null ? null : name,
        "number": number == null ? null : number,
        "is_bold": isBold,
        "is_italic": isItalic,
        "is_capital_letter": isCapitalLetter,
        "is_border": isBorder == null ? null : isBorder,
        "is_center": isCenter == null ? null : isCenter,
        "content": content == null ? null : content,
        "body": body == null ? null : body,
        "is_number": isNumber == null ? null : isNumber,
        "table_body": tableBody == null
            ? null
            : List<dynamic>.from(tableBody!.map((x) => x.toJson())),
        "header": header == null ? null : header,
      };
}

class ContentSubCategory {
  ContentSubCategory({
    required this.id,
    required this.name,
    required this.isBold,
    required this.isCapitalLetter,
    required this.isItalic,
    required this.category,
  });

  int? id;
  String? name;
  bool? isBold;
  bool? isCapitalLetter;
  bool? isItalic;
  int? category;

  factory ContentSubCategory.fromJson(Map<String, dynamic> json) =>
      ContentSubCategory(
        id: json["id"],
        name: json["name"],
        isBold: json["is_bold"],
        isCapitalLetter: json["is_capital_letter"],
        isItalic: json["is_italic"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_bold": isBold,
        "is_capital_letter": isCapitalLetter,
        "is_italic": isItalic,
        "category": category,
      };
}

// ignore: constant_identifier_names
enum Chapter {
  TABLE_OF_CONTENT,
  SECTION_A_POLYTECHNIC_ADMINISTRATION,
  SECTION_B_RECTOR_S_ADVISORY_COMMITTEE,
  SECTION_C_QUALIFICATION_INTO_BASIC_STUDIES_PROGRAMMES,
  SECTION_D_ACADEMIC_PROGRAMME_EVALUATION
}

final chapterValues = EnumValues({
  "Section A: Polytechnic Administration":
      Chapter.SECTION_A_POLYTECHNIC_ADMINISTRATION,
  "Section B: Rector's Advisory Committee":
      Chapter.SECTION_B_RECTOR_S_ADVISORY_COMMITTEE,
  "Section C: QUALIFICATION INTO BASIC STUDIES PROGRAMMES":
      Chapter.SECTION_C_QUALIFICATION_INTO_BASIC_STUDIES_PROGRAMMES,
  "Section D: ACADEMIC PROGRAMME EVALUATION":
      Chapter.SECTION_D_ACADEMIC_PROGRAMME_EVALUATION,
  "TABLE OF CONTENT": Chapter.TABLE_OF_CONTENT
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => new MapEntry(v, k));
    return reverseMap!;
  }
}

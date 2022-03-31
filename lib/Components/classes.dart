import 'package:flutter/material.dart';

class OfficeBearer {
  int id;
  String name;
  String role;
  String contact;
  String imgurl;
  HSLColor light, dark;
  OfficeBearer(
      {required this.id,
      required this.name,
      required this.role,
      required this.contact,
      required this.imgurl,
      required this.light,
      required this.dark});
}

class Magazine {
  int edition;
  String month, id;
  int year;
  String cover_url;
  String file_url;
  Magazine(
      {required this.id,
      required this.edition,
      required this.month,
      required this.year,
      required this.cover_url,
      required this.file_url});
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BaseModel {
  IconData icon;
  Widget page;
  final GlobalKey key;
  BaseModel({
    required this.icon,
    required this.page,
    required this.key,
  });
}

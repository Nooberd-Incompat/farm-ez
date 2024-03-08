import 'package:uuid/uuid.dart';
import 'dart:io';

const uuid = Uuid();

class Farmer {
  Farmer(
      {required this.title,
      required this.image,
      required this.phone,
      String? id})
      : id = id ?? uuid.v4();
  final String id;
  final String title;
  final String phone;
  final File image;
}

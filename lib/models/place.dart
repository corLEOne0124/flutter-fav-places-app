import 'package:uuid/uuid.dart';
import 'dart:io';

const uuid = Uuid();

class Place {
  Place({required this.title, required this.image, String? id}) : id = id ?? uuid.v4();

  final String id;
  final String title;
  final File image;
}

import 'package:flutter/material.dart';
import 'package:favplaces/models/place.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({Key? key, required this.place}) : super(key: key);

  final Place place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            width: double.infinity,
            height: double.infinity,
          ),
        ],
      ),
    );
  }
}

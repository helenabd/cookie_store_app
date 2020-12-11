import 'package:flutter/material.dart';

class Meal {
  final String id;
  final String category;
  final String name;
  final String price;
  final String imgPath;
  final bool added;
  final bool isFavorite;

  const Meal({
    @required this.id,
    @required this.category,
    @required this.name,
    @required this.price,
    @required this.imgPath,
    @required this.added,
    @required this.isFavorite,
  });
}

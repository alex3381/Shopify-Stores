import 'package:flutter/material.dart';
import 'dart:ui';


class Products  {
   final int id;
   final String title;
   final List<String> images;
   final List<Color> colors;
   final double rating;
   final int price;
   final int old_price;
   final bool isFavorite, isPopular;


  Products({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavorite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.old_price

  });
}


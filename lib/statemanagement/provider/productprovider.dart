import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  final List<Products> _products = <Products>[
    Products(
      id: 1,
      images: [
        "assets/images/lady_shoe.png",
        "assets/images/lady_shoe_one.png",
        "assets/images/lady_shoe_two.png",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Holiz™ ",
      price: 65,
      old_price: 234,
      rating: 4.8,
      isFavorite: false,
      isPopular: true,
    ),
    Products(
      id: 2,
      images: [
        "assets/images/pants.png",
        "assets/images/pants-one.png",
        "assets/images/pants_two.png",

      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Versace™",
      price: 90,
      old_price: 634,
      rating: 2.3,
      isFavorite: true,
      isPopular: true,
    ),
    Products(
      id: 3,
      images: [
        "assets/images/feragamo_one.png",
        "assets/images/feragamo_three.png",
        "assets/images/feragamo_four.png",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Feragamo™",
      price: 123,
      old_price: 654,
      rating: 5.3,
      isFavorite: true,
      isPopular: true,
    ),


    Products(
      id: 4,
      images: [
        "assets/images/watch_one.png",
        "assets/images/watch_three.png",
        "assets/images/watch_two.png",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Swatch™",
      price: 323,
      old_price: 44,
      rating: 3.3,
      isFavorite: true,
      isPopular: true,
    ),
    Products(
      id: 5,
      images: [
        "assets/images/shirt_three.png",
        "assets/images/shirt_two.png",
        "assets/images/shirt_one.png",

      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Dufel™",
      price: 323,
      old_price: 44,
      rating: 3.3,
      isFavorite: true,
      isPopular: true,
    ),


  Products(
    id: 6,
    images: [
      "assets/images/trainer_two.png",
      "assets/images/trainer_one.png",
      "assets/images/trainer_three.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: " Nike™ ",
    price: 65,
    old_price: 234,
    rating: 4.8,
    isFavorite: false,
    isPopular: true,
  ),

    Products(
      id: 7,
      images: [
        "assets/images/perfume_two.png",
        "assets/images/pefume_one.png",
        "assets/images/perfume_three.png",

      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Medussa™",
      price: 90,
      old_price: 634,
      rating: 2.3,
      isFavorite: true,
      isPopular: true,
    ),
  ];

  List<Products> get products {
    return _products;
  }

  int get productsCounts {
    return _products.length;
  }

  void add(Products products) {
    _products.add(products);
    notifyListeners();
  }

  void removeAll() {
    _products.clear();
    notifyListeners();
  }
}
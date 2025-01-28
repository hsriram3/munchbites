import 'package:flutter/material.dart';
import 'package:flutter_app_food/models/food.dart';

class CartItems {
  Food food;
  List<Addons> selectedAddons;
  int count = 1;

  CartItems({
    required this.food,
    required this.count,
    required this.selectedAddons,
  });

  double get totalprice {
    double addonPrice =
        selectedAddons.fold(0, (sum, addons) => sum + addons.priceFood);
    return (food.priceFood + addonPrice) * count;
  }
}

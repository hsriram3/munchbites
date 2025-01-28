class Food {
  final String name;
  final String description;
  final String imagePath;
  final double priceFood;
  final FoodCategory category;
  List<Addons> availableAddons;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.priceFood,
    required this.availableAddons,
    required this.category,
  });
}

enum FoodCategory {
  burgers,
  desserts,
  drinks,
}

class Addons {
  final String name;
  final double priceFood;

  Addons({
    required this.name,
    required this.priceFood,
  });
}

// import 'food.dart';

// class Restaurant {
//   final List<Food> _menu = [
//     //burger
//     Food(
//       name: "Cheese Burger",
//       description:
//           "A cheese burger with American Cheese, tomatoes, lettuce with onions.",
//       imagePath: "images/burgers/cheese_burger.jpeg",
//       priceFood: 5.90,
//       category: FoodCategory.burgers,
//       availableAddons: [
//         Addons(name: "Extra Cheese", priceFood: 1.20),
//         Addons(name: "Onion Slice", priceFood: 0.85),
//         Addons(name: "Extra Lettuce", priceFood: 1.20)
//       ],
//     ),
//     Food(
//       name: "Black Bean Vegan Burger",
//       description:
//           "A Vegan burger with Black Bean Topping, tomatoes, lettuce and onions.",
//       imagePath: "images/burgers/black_bean.webp",
//       priceFood: 7.00,
//       category: FoodCategory.burgers,
//       availableAddons: [
//         Addons(name: "Olvies", priceFood: 1.20),
//         Addons(name: "Onion Slice", priceFood: 0.85),
//         Addons(name: "Extra Lettuce", priceFood: 1.20)
//       ],
//     ),
//     Food(
//       name: "Cripsy Chicken Burger",
//       description:
//           "Crispy Chicken burger with Olives Topping, tomatoes, lettuce and onions.",
//       imagePath: "images/burgers/cripsy_chicken.jpg",
//       priceFood: 4.99,
//       category: FoodCategory.burgers,
//       availableAddons: [
//         Addons(name: "Olvies", priceFood: 1.20),
//         Addons(name: "Onion Slice", priceFood: 0.85),
//         Addons(name: "Extra Lettuce", priceFood: 1.20)
//       ],
//     ),
//     Food(
//       name: "Veg Burger",
//       description: "Veg burger with potato patty, tomatoes and lettuce.",
//       imagePath: "images/burgers/veg_burger.jpg",
//       priceFood: 5.99,
//       category: FoodCategory.burgers,
//       availableAddons: [
//         Addons(name: "Olvies", priceFood: 1.20),
//         Addons(name: "Onion Slice", priceFood: 0.85),
//         Addons(name: "Extra Tomatoes", priceFood: 1.5)
//       ],
//     ),
//     Food(
//       name: "Plain Cheese Burger",
//       description: "Plain Cheese burger with steak and cheese.",
//       imagePath: "images/burgers/plain_cheese.jpeg",
//       priceFood: 5.00,
//       category: FoodCategory.burgers,
//       availableAddons: [
//         Addons(name: "Beacon", priceFood: 1.20),
//         Addons(name: "Tomato", priceFood: 0.85),
//         Addons(name: "Extra Cheese", priceFood: 1.5)
//       ],
//     ),
//   ];
// }

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_food/models/cart.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // Burgers
    Food(
      name: "Cheese Burger",
      description:
          "A cheese burger with American Cheese, tomatoes, lettuce with onions.",
      imagePath: "images/burgers/cheese_burger.jpeg",
      priceFood: 5.90,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Extra Cheese", priceFood: 1.20),
        Addons(name: "Onion Slice", priceFood: 0.85),
        Addons(name: "Extra Lettuce", priceFood: 1.20)
      ],
    ),
    Food(
      name: "Black Bean Vegan Burger",
      description:
          "A Vegan burger with Black Bean Topping, tomatoes, lettuce and onions.",
      imagePath: "images/burgers/black_bean.webp",
      priceFood: 7.00,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Olives", priceFood: 1.20),
        Addons(name: "Onion Slice", priceFood: 0.85),
        Addons(name: "Extra Lettuce", priceFood: 1.20)
      ],
    ),
    Food(
      name: "Crispy Chicken Burger",
      description:
          "Crispy Chicken burger with Olives Topping, tomatoes, lettuce and onions.",
      imagePath: "images/burgers/crispy_chicken.jpg",
      priceFood: 4.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Olives", priceFood: 1.20),
        Addons(name: "Onion Slice", priceFood: 0.85),
        Addons(name: "Extra Lettuce", priceFood: 1.20)
      ],
    ),
    Food(
      name: "Veg Burger",
      description: "Veg burger with potato patty, tomatoes and lettuce.",
      imagePath: "images/burgers/veg_burger.webp",
      priceFood: 5.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Olives", priceFood: 1.20),
        Addons(name: "Onion Slice", priceFood: 0.85),
        Addons(name: "Extra Tomatoes", priceFood: 1.5)
      ],
    ),
    Food(
      name: "Plain Cheese Burger",
      description: "Plain Cheese burger with steak and cheese.",
      imagePath: "images/burgers/plain_cheese.jpeg",
      priceFood: 5.00,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Bacon", priceFood: 1.20),
        Addons(name: "Tomato", priceFood: 0.85),
        Addons(name: "Extra Cheese", priceFood: 1.5)
      ],
    ),
    // Desserts
    Food(
      name: "Cherry Cheesecake",
      description: "A creamy cheesecake topped with cherries.",
      imagePath: "images/desserts/cherry_cheesecake.jpg",
      priceFood: 4.50,
      category: FoodCategory.desserts,
      availableAddons: [
        Addons(name: "Whipped Cream", priceFood: 0.50),
        Addons(name: "Extra Cherries", priceFood: 0.75),
        Addons(name: "Chocolate Drizzle", priceFood: 0.90)
      ],
    ),
    Food(
      name: "Choco Strawberry Cake",
      description: "A moist chocolate cake layered with fresh strawberries.",
      imagePath: "images/desserts/choco_strawbery_cake.webp",
      priceFood: 5.00,
      category: FoodCategory.desserts,
      availableAddons: [
        Addons(name: "Extra Strawberries", priceFood: 0.85),
        Addons(name: "Chocolate Chips", priceFood: 0.70),
        Addons(name: "Vanilla Sauce", priceFood: 0.90)
      ],
    ),
    Food(
      name: "Cookies",
      description: "Assorted cookies with chocolate chips and nuts.",
      imagePath: "images/desserts/cookies.jpg",
      priceFood: 2.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addons(name: "Extra Chocolate Chips", priceFood: 0.50),
        Addons(name: "Nuts", priceFood: 0.60),
        Addons(name: "Caramel Dip", priceFood: 0.70)
      ],
    ),
    Food(
      name: "Mango Tiramisu",
      description:
          "A tropical twist on the classic tiramisu with mango flavor.",
      imagePath: "images/desserts/mango_tiramisu.jpg",
      priceFood: 6.50,
      category: FoodCategory.desserts,
      availableAddons: [
        Addons(name: "Extra Mango Puree", priceFood: 0.75),
        Addons(name: "Whipped Cream", priceFood: 0.50),
        Addons(name: "Chocolate Shavings", priceFood: 0.80)
      ],
    ),
    Food(
      name: "Tarts",
      description: "Assorted tarts with fruit and cream filling.",
      imagePath: "images/desserts/tarts.jpeg",
      priceFood: 3.50,
      category: FoodCategory.desserts,
      availableAddons: [
        Addons(name: "Extra Fruit", priceFood: 0.70),
        Addons(name: "Whipped Cream", priceFood: 0.50),
        Addons(name: "Caramel Drizzle", priceFood: 0.80)
      ],
    ),
    // Drinks
    Food(
      name: "Blueberry Mojito",
      description: "A refreshing blueberry mojito with mint leaves.",
      imagePath: "images/drinks/blueberry_moj.jpg",
      priceFood: 3.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: "Extra Mint", priceFood: 0.50),
        Addons(name: "Lime Wedge", priceFood: 0.30),
        Addons(name: "Soda Splash", priceFood: 0.40)
      ],
    ),
    Food(
      name: "Lime Mojito",
      description: "A classic lime mojito with a citrusy kick.",
      imagePath: "images/drinks/lime_moj.jpeg",
      priceFood: 3.50,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: "Extra Lime", priceFood: 0.40),
        Addons(name: "Mint Leaves", priceFood: 0.50),
        Addons(name: "Sugar Rim", priceFood: 0.30)
      ],
    ),
    Food(
      name: "Mango Mojito",
      description: "A tropical mango mojito with mint and lime.",
      imagePath: "images/drinks/mango_moj.jpg",
      priceFood: 4.50,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: "Extra Mango Puree", priceFood: 0.60),
        Addons(name: "Mint Leaves", priceFood: 0.50),
        Addons(name: "Lime Wedge", priceFood: 0.30)
      ],
    ),
    Food(
      name: "Pomegranate Chilli Mojito",
      description:
          "A spicy and fruity mojito with pomegranate and chili flakes.",
      imagePath: "images/drinks/pom_chilli_moj.jpg",
      priceFood: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: "Extra Pomegranate Seeds", priceFood: 0.70),
        Addons(name: "Chili Flakes", priceFood: 0.50),
        Addons(name: "Mint Leaves", priceFood: 0.50)
      ],
    ),
    Food(
      name: "Strawberry Mojito",
      description: "A sweet strawberry mojito with mint and lime.",
      imagePath: "images/drinks/strawberry_moj.jpg",
      priceFood: 4.00,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: "Extra Strawberries", priceFood: 0.70),
        Addons(name: "Mint Leaves", priceFood: 0.50),
        Addons(name: "Lime Wedge", priceFood: 0.30)
      ],
    ),
  ];
  final List<CartItems> _cart = [];
  //update address manually by user
  String _deliveryAddress = '63 Tyler St';
  //getters

  List<Food> get menu => _menu;
  List<CartItems> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;
  //operations

  //add to cart
  void addtoCart(Food food, List<Addons> selectedAddons) {
    CartItems? cartItems = _cart.firstWhereOrNull(
      (item) {
        //check if food items are there
        bool isSameFood = item.food == food;
        //check if selected addons are the same or not
        bool isSameAddon =
            const ListEquality().equals(item.selectedAddons, selectedAddons);
        return isSameAddon && isSameFood;
      },
    );
    //if item is already there, increase its count
    if (cartItems != null) {
      cartItems.count++;
    } else {
      _cart.add(
        CartItems(
          food: food,
          selectedAddons: selectedAddons,
          count: 1,
        ),
      );
      notifyListeners();
    }
  }

  //remove cart
  void removeCart(CartItems cartItems) {
    int cartIndex = _cart.indexOf(cartItems);

    if (cartIndex != -1) {
      if (_cart[cartIndex].count > 1) {
        _cart[cartIndex].count--;
      } else {
        _cart.removeAt(cartIndex);
      }
      notifyListeners();
    }
  }

  //get total price
  double getTotalPrice() {
    double tot = 0.0;
    for (CartItems cartItems in _cart) {
      double itemTotal = cartItems.food.priceFood;

      for (Addons addons in cartItems.selectedAddons) {
        itemTotal += addons.priceFood;
      }
      tot += itemTotal * cartItems.count;
    }
    return tot;
  }
  //total items in cart

  int getTotalCount() {
    int totalItemCount = 0;
    for (CartItems cartItems in _cart) {
      totalItemCount += cartItems.count;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //helpers
  //update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }
  // //generate the reciept
  // String displayCartRec() {
  //   final receipt = StringBuffer();
  //   receipt.writeln("Here is your receipt");
  //   receipt.writeln();

  //   //date
  //   String formattedDate =
  //       DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  //   receipt.writeln(formattedDate);
  //   receipt.writeln();
  //   receipt.writeln("------------");

  //   for (final CartItems in _cart) {
  //     receipt.writeln(
  //         "${CartItems.count} x ${CartItems.food.name} - ${_formatPrice(CartItems.food.priceFood)}");
  //     if (CartItems.selectedAddons.isNotEmpty) {
  //       receipt.writeln(
  //           "     Add-ons: ${_formatAddons(CartItems.selectedAddons)}");
  //     }
  //     receipt.writeln();
  //   }
  //   receipt.writeln("------------");
  //   receipt.writeln();
  //   receipt.writeln("Total Items: ${getTotalCount()} ");
  //   receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

  //   return receipt.toString();
  // }

  // //chnage double vcalue into money
  // String _formatPrice(double price) {
  //   return "\$${price.toStringAsFixed(2)}";
  // }

  // //make list addons into a string summary
  // String _formatAddons(List<Addons> addons) {
  //   return addons
  //       .map((addons) => "${addons.name} (${_formatPrice(addons.priceFood)})")
  //       .join(", ");
  // }
  String displayCartRec() {
    final receipt = StringBuffer();
    receipt.writeln("🚨  Your Receipt  🚨");
    receipt.writeln();

    // Date and time
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln("Date: $formattedDate");
    receipt.writeln();

    receipt.writeln("------------");
    receipt.writeln("Items Purchased:");
    receipt.writeln("------------");

    for (final CartItems in _cart) {
      receipt.writeln(
          "${CartItems.count} x ${CartItems.food.name} - ${_formatPrice(CartItems.food.priceFood)}");

      if (CartItems.selectedAddons.isNotEmpty) {
        receipt
            .writeln("   Add-ons: ${_formatAddons(CartItems.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("------------");

    // Summary and Total
    receipt.writeln("Total Items: ${getTotalCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();
  }

// Format price to display in currency
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

// Convert list of add-ons into a readable string
  String _formatAddons(List<Addons> addons) {
    return addons
        .map((addons) => "${addons.name} (${_formatPrice(addons.priceFood)})")
        .join(", ");
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_app_food/models/food.dart';
// import 'package:flutter_app_food/models/restaurant.dart';
// import 'package:flutter_app_food/widgets/buttons.dart';
// import 'package:provider/provider.dart';

// class FoodPage extends StatefulWidget {
//   final Food food;
//   final Map<Addons, bool> selectedAddons = {};

//   FoodPage({
//     super.key,
//     required this.food,
//   }) {
//     // Initialize selectedAddons to be false for all available addons
//     for (Addons addons in food.availableAddons) {
//       selectedAddons[addons] = false;
//     }
//   }

//   @override
//   State<FoodPage> createState() => _FoodPageState();
// }

// class _FoodPageState extends State<FoodPage> {
//   // Fixed addtoCart function declaration
//   void addtoCart(Food food, Map<Addons, bool> selectedAddons) {
//     // Logic for adding to cart
//     Navigator.pop(context); // Closes the FoodPage
//     List<Addons> curAddons = [];
//     for (Addons addons in food.availableAddons) {
//       if (selectedAddons[addons] == true) {
//         curAddons.add(addons);
//       }
//     }
//     // Access the Restaurant model and add the food with the selected add-ons
//     context.read<Restaurant>().addtoCart(food, curAddons);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // Scaffold
//         Scaffold(
//           appBar: AppBar(),
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 // Food image on top
//                 Image.asset(widget.food.imagePath),

//                 Padding(
//                   padding: const EdgeInsets.all(23.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Name of food
//                       Text(
//                         widget.food.name,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       // Food price
//                       Text('\$${widget.food.priceFood}',
//                           style: TextStyle(
//                             fontWeight: FontWeight.normal,
//                             fontSize: 14,
//                             color: Theme.of(context).colorScheme.primary,
//                           )),
//                       const SizedBox(
//                         height: 10,
//                       ),

//                       Divider(
//                         color: Theme.of(context).colorScheme.secondary,
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "Add-Ons",
//                         style: TextStyle(
//                           color: Theme.of(context).colorScheme.inversePrimary,
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       // Food description
//                       Text(
//                         widget.food.description,
//                       ),
//                       // Add-ons
//                       Container(
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 color: Theme.of(context).colorScheme.secondary),
//                             borderRadius: BorderRadius.circular(7)),
//                         child: ListView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           padding: EdgeInsets.zero,
//                           itemCount: widget.food.availableAddons.length,
//                           itemBuilder: (context, index) {
//                             // Get individual addons
//                             Addons addons = widget.food.availableAddons[index];
//                             // Return the add-on UI
//                             return CheckboxListTile(
//                               title: Text(addons.name),
//                               subtitle: Text(
//                                 '\$${addons.priceFood}',
//                                 style: TextStyle(
//                                     color:
//                                         Theme.of(context).colorScheme.primary),
//                               ),
//                               value: widget.selectedAddons[addons],
//                               onChanged: (bool? value) {
//                                 setState(() {
//                                   widget.selectedAddons[addons] =
//                                       value ?? false;
//                                 });
//                               },
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Add to cart button
//                 MyButton(
//                   text: "Add to Cart",
//                   onTap: () => addtoCart(widget.food, widget.selectedAddons),
//                 ),
//                 const SizedBox(
//                   height: 23,
//                 ),
//               ],
//             ),
//           ),
//         ),

//         // Back button
//         SafeArea(
//           child: Opacity(
//             opacity: 0.5,
//             child: Container(
//               margin: const EdgeInsets.only(left: 24),
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.secondary,
//                 shape: BoxShape.circle,
//               ),
//               child: IconButton(
//                 onPressed: () => Navigator.pop(context),
//                 icon: const Icon(Icons.arrow_back_ios_new_rounded),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_app_food/models/food.dart';
import 'package:flutter_app_food/models/restaurant.dart';
import 'package:flutter_app_food/widgets/buttons.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addons, bool> selectedAddons = {};

  FoodPage({
    super.key,
    required this.food,
  }) {
    // Initialize selectedAddons to be false for all available addons
    for (Addons addons in food.availableAddons) {
      selectedAddons[addons] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  // Fixed addtoCart function declaration
  void addtoCart(Food food, Map<Addons, bool> selectedAddons) {
    Navigator.pop(context); // Closes the FoodPage
    List<Addons> curAddons = [];
    for (Addons addons in food.availableAddons) {
      if (selectedAddons[addons] == true) {
        curAddons.add(addons);
      }
    }
    context.read<Restaurant>().addtoCart(food, curAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Food image with rounded corners
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                  child: Image.asset(
                    widget.food.imagePath,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Food price
                      Text(
                        '\$${widget.food.priceFood}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                        thickness: 1.5,
                      ),
                      const SizedBox(height: 10),

                      // Section title
                      Text(
                        "Add-Ons",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Food description
                      Text(
                        widget.food.description,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Add-ons with rounded container
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            Addons addons = widget.food.availableAddons[index];
                            return CheckboxListTile(
                              title: Text(
                                addons.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                '\$${addons.priceFood}',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              value: widget.selectedAddons[addons],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addons] =
                                      value ?? false;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // Add to cart button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: MyButton(
                    text: "Add to Cart",
                    onTap: () => addtoCart(widget.food, widget.selectedAddons),
                  ),
                ),
                const SizedBox(height: 23),
              ],
            ),
          ),
        ),

        // Back button with floating appearance
        SafeArea(
          child: Opacity(
            opacity: 0.9,
            child: Container(
              margin: const EdgeInsets.only(left: 16, top: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app_food/models/cart.dart';
import 'package:flutter_app_food/models/food.dart';
import 'package:flutter_app_food/models/restaurant.dart';
import 'package:flutter_app_food/widgets/count_selector.dart';
import 'package:provider/provider.dart';

// class MyCartTile extends StatelessWidget {
//   final CartItems cartItems;
//   const MyCartTile({super.key, required this.cartItems});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<Restaurant>(
//       builder: (context, restaurant, child) => Container(
//         decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.secondary,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 9),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // food image
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.asset(
//                       cartItems.food.imagePath,
//                       height: 125,
//                       width: 125,
//                     ),
//                   ),

//                   // name and price
//                   Column(
//                     children: [
//                       // food name
//                       Text(cartItems.food.name),

//                       // food price
//                       Text(
//                         '\$' + cartItems.food.priceFood.toString(),
//                         style: TextStyle(
//                             color: Theme.of(context).colorScheme.primary),
//                       ),
//                     ],
//                   ),

//                   const Spacer(),

//                   // inc or dec item count
//                   CountSelector(
//                     count: cartItems.count,
//                     food: cartItems.food,
//                     onIncrement: () {
//                       restaurant.removeCart(cartItems);
//                     },
//                     onDecrement: () {
//                       restaurant.addtoCart(
//                           cartItems.food, cartItems.selectedAddons);
//                     },
//                   ),
//                 ],
//               ),
//             ),

//             // addons
//             SizedBox(
//               height: cartItems.selectedAddons.isEmpty ? 0 : 60,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.only(
//                   left: 10,
//                   bottom: 10,
//                   right: 10,
//                 ),
//                 children: cartItems.selectedAddons
//                     .map(
//                       (addons) => Padding(
//                         padding: const EdgeInsets.only(right: 8.0),
//                         child: FilterChip(
//                           label: Row(
//                             children: [
//                               Text(addons.name),
//                               Text(
//                                 '\$${addons.priceFood}',
//                               ),
//                             ],
//                           ),
//                           shape: StadiumBorder(
//                               side: BorderSide(
//                                   color:
//                                       Theme.of(context).colorScheme.primary)),
//                           onSelected: (value) {},
//                           backgroundColor:
//                               Theme.of(context).colorScheme.secondary,
//                           labelStyle: TextStyle(
//                             color: Theme.of(context).colorScheme.inversePrimary,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ),
//                     )
//                     .toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_app_food/models/cart.dart';
import 'package:flutter_app_food/models/food.dart';
import 'package:flutter_app_food/models/restaurant.dart';
import 'package:flutter_app_food/widgets/count_selector.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItems cartItems;
  const MyCartTile({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12), // Slightly rounded corners
        ),
        margin: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 12), // Adjusted margin
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Row for food image and info
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food image with better border radius
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      cartItems.food.imagePath,
                      height: 125,
                      width: 125,
                      fit: BoxFit.cover, // Ensure image fits nicely
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Food info: name and price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Food name with better style
                        Text(
                          cartItems.food.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // Food price
                        Text(
                          '\$${cartItems.food.priceFood.toStringAsFixed(2)}', // Better price formatting
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Count selector (increment/decrement)
                  CountSelector(
                    count: cartItems.count,
                    food: cartItems.food,
                    onIncrement: () {
                      restaurant.addtoCart(
                          cartItems.food, cartItems.selectedAddons);
                    },
                    onDecrement: () {
                      restaurant.removeCart(cartItems);
                    },
                  ),
                ],
              ),
            ),

            // Addons display
            SizedBox(
              height: cartItems.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                children: cartItems.selectedAddons
                    .map(
                      (addons) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: FilterChip(
                          label: Row(
                            children: [
                              Text(addons.name),
                              Text(
                                '\$${addons.priceFood.toStringAsFixed(2)}', // Format the addon price
                              ),
                            ],
                          ),
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          onSelected: (value) {},
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

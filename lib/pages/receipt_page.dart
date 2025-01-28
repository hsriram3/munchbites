// import 'package:flutter/material.dart';
// import 'package:flutter_app_food/models/restaurant.dart';
// import 'package:provider/provider.dart';

// class MyReceipt extends StatelessWidget {
//   const MyReceipt({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text("Thank You for your Order"),
//             Container(
//               decoration: BoxDecoration(
//                 border:
//                     Border.all(color: Theme.of(context).colorScheme.secondary),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               padding: const EdgeInsets.all(25),
//               child: Consumer<Restaurant>(
//                 builder: (context, restaurant, child) =>
//                     Text(restaurant.displayCartRec()),
//               ),
//             ),
//             const SizedBox(
//               height: 25,
//             ),
//             const Text("Estimated Delivery Time is : 4:10 PM"),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_app_food/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Thank You Text with enhanced style
            Text(
              "Thank You for Your Order",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),

            // Receipt container with shadow effect and better spacing
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Consumer<Restaurant>(
                builder: (context, restaurant, child) => Text(
                  restaurant.displayCartRec(),
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5, // Increase line height for better readability
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Estimated delivery time text with better style
            Text(
              "Estimated Delivery Time: 4:10 PM",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

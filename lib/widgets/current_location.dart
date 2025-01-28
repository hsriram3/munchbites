// import 'package:flutter/material.dart';
// import 'package:flutter_app_food/models/restaurant.dart';
// import 'package:provider/provider.dart';

// class SCurrentLocation extends StatelessWidget {
//   const SCurrentLocation({super.key});

//   void openLocationSearch(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Your Current Location"),
//         content: const TextField(
//           decoration: InputDecoration(hintText: "Enter Address.."),
//         ),
//         actions: [
//           //cancel
//           MaterialButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),

//           //save button
//           MaterialButton(
//   onPressed: () {
//     String newAddress = textController.text;
//     Navigator.pop(context);
//     textController.clear();
//   },
//   child: const Text("Save"),
// ),

//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(25.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Deliver Now",
//               style: TextStyle(
//                 color: Theme.of(context).colorScheme.primary,
//               )),
//           GestureDetector(
//             onTap: () => openLocationSearch(context),
//             child: Row(
//               children: [
//                 //address
//                 Consumer<Restaurant>(builder: (context,restaurant,child)=>Text(
//                   restaurant.deliveryAddress,
//                   style: TextStyle(
//                     color: Theme.of(context).colorScheme.inversePrimary,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),)

//                 //dropdown menu
//                 Icon(Icons.keyboard_arrow_down_rounded),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_app_food/models/restaurant.dart';
import 'package:provider/provider.dart';

class SCurrentLocation extends StatelessWidget {
  const SCurrentLocation({Key? key}) : super(key: key);

  void openLocationSearch(BuildContext context) {
    final TextEditingController textController =
        TextEditingController(); // Declare locally

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your Current Location"),
        content: TextField(
          controller: textController, // Assign the controller to the text field
          decoration: const InputDecoration(hintText: "Enter Address.."),
        ),
        actions: [
          // Cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),

          // Save button
          MaterialButton(
            onPressed: () {
              String newAddress = textController.text;
              context.read<Restaurant>().updateDeliveryAddress(newAddress);
              // Save the address (e.g., update your model or perform any other action)
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver Now",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              )),
          GestureDetector(
            onTap: () => openLocationSearch(context),
            child: Row(
              children: [
                // Address
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                    restaurant.deliveryAddress,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Dropdown menu icon
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

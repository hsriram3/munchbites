// import 'package:flutter/material.dart';
// import 'package:flutter_app_food/main.dart';
// import 'package:flutter_app_food/models/restaurant.dart';
// import 'package:flutter_app_food/pages/receipt_page.dart';
// import 'package:flutter_app_food/services/database/firestore.dart';

// class DeliveryProgPage extends StatefulWidget {
//   const DeliveryProgPage({super.key});

//   @override
//   State<DeliveryProgPage> createState() => _DeliveryProgPageState();
// }

// class _DeliveryProgPageState extends State<DeliveryProgPage> {
//   //get access to firebase
//   FirestoreService db = FirestoreService();

//   @override
//   void initState() {
//     super.initState();

//     //if we get to this page, then data is stored in firestore db
//     String receipt = context.read<Restaurant>().displayCartRec();
//     db.saveOrderToDatabase(receipt);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//       ),
//       bottomNavigationBar: _buildBottomNavBar(context),
//       body: const Column(
//         children: [
//           MyReceipt(),
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomNavBar(BuildContext context) {
//     return Container(
//       height: 100,
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.secondary,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(38),
//           topRight: Radius.circular(38),
//         ),
//       ),
//       padding: const EdgeInsets.all(25),
//       child: Row(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Theme.of(context).colorScheme.background,
//               shape: BoxShape.circle,
//             ),
//             child: IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.person),
//             ),
//           ),
//           const SizedBox(
//             width: 11,
//           ),

//           //driver details
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Andy Altig",
//                 style: TextStyle(
//                   color: Theme.of(context).colorScheme.inversePrimary,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 "Driver",
//                 style: TextStyle(
//                   color: Theme.of(context).colorScheme.primary,
//                 ),
//               ),
//             ],
//           ),

//           const Spacer(),

//           Row(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).colorScheme.background,
//                   shape: BoxShape.circle,
//                 ),
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: const Icon(Icons.message),
//                   color: Theme.of(context).colorScheme.primary,
//                 ),
//               ),

//               const SizedBox(
//                 width: 10,
//               ),
//               //call button
//               Container(
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).colorScheme.background,
//                   shape: BoxShape.circle,
//                 ),
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.call),
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_app_food/models/restaurant.dart';
import 'package:flutter_app_food/services/database/firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_food/pages/receipt_page.dart';

class DeliveryProgPage extends StatefulWidget {
  const DeliveryProgPage({super.key});

  @override
  State<DeliveryProgPage> createState() => _DeliveryProgPageState();
}

class _DeliveryProgPageState extends State<DeliveryProgPage> {
  // Access Firestore service
  FirestoreService db = FirestoreService();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Now it's safe to access the Restaurant provider
    final restaurant = context.read<Restaurant>(); // Accessing the provider
    String receipt = restaurant.displayCartRec();

    // Save the order to Firestore database
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(38),
          topRight: Radius.circular(38),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
          ),
          const SizedBox(
            width: 11,
          ),

          // Driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Andy Altig",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Driver",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),

          const Spacer(),

          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(
                width: 10,
              ),
              // Call button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.call),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

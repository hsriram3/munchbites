// import "package:flutter/cupertino.dart";
// import "package:flutter/material.dart";
// import "package:flutter_app_food/themes/theme_provider.dart";
// import "package:provider/provider.dart";

// class SettingsPage extends StatefulWidget {
//   const SettingsPage({super.key});

//   @override
//   State<SettingsPage> createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Settings",
//           style: TextStyle(
//             color: Theme.of(context).colorScheme.primary, // Dynamically adapt
//           ),
//         ),
//         backgroundColor: Theme.of(context).colorScheme.background,
//       ),
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Theme.of(context).colorScheme.secondary,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
//             padding: const EdgeInsets.all(25),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Dark Mode Label
//                 Text(
//                   "Dark Mode",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Theme.of(context).colorScheme.inversePrimary,
//                   ),
//                 ),

//                 // Switch Button with Consumer
//                 Consumer<ThemeProvider>(
//                   builder: (context, themeProvider, child) {
//                     return CupertinoSwitch(
//                       value: themeProvider.isDarkMode,
//                       onChanged: (value) {
//                         themeProvider.Themetoggle();
//                       },
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:io'; // To use File for image handling
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_food/themes/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? profileImageUrl;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  // Load the profile image URL from Firestore
  Future<void> _loadProfileImage() async {
    var userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    if (userDoc.exists) {
      setState(() {
        profileImageUrl = userDoc.data()?['profileImage'];
      });
    }
  }

  // Function to allow the user to pick an image from the gallery
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);

      // Upload the image to Firebase Storage
      String fileName = DateTime.now().toString();
      Reference storageRef =
          FirebaseStorage.instance.ref().child("profile_images/$fileName");

      try {
        // Upload the file to Firebase Storage
        await storageRef.putFile(imageFile);

        // Get the download URL of the uploaded image
        String imageUrl = await storageRef.getDownloadURL();

        // Save the image URL in Firebase Firestore for the current user
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .update({'profileImage': imageUrl});

        setState(() {
          profileImageUrl = imageUrl;
        });
      } catch (e) {
        print("Error uploading image: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary, // Dynamically adapt
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // Profile Image Section
          Center(
            child: GestureDetector(
              onTap: pickImage, // Allow users to tap and change the image
              child: CircleAvatar(
                radius: 50,
                backgroundImage: profileImageUrl != null
                    ? NetworkImage(
                        profileImageUrl!) // Display the profile image
                    : const AssetImage('assets/default_profile.png')
                        as ImageProvider, // Default image if no profile image
              ),
            ),
          ),
          SizedBox(height: 20),

          // Dark Mode Section
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Dark Mode Label
                Text(
                  "Dark Mode",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),

                // Switch Button with Consumer
                Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return CupertinoSwitch(
                      value: themeProvider.isDarkMode,
                      onChanged: (value) {
                        themeProvider.Themetoggle();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

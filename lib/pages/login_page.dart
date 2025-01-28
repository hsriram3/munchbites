// import 'package:flutter/material.dart';
// import 'package:flutter_app_food/pages/home_page.dart';
// import 'package:flutter_app_food/services/auth_services.dart';
// import 'package:flutter_app_food/widgets/buttons.dart';
// import 'package:flutter_app_food/widgets/textfields.dart';

// class LoginPage extends StatefulWidget {
//   final void Function()? onTap;
//   const LoginPage({super.key, required this.onTap});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   //textfield controllers
//   final TextEditingController emailcontroller = TextEditingController();
//   final TextEditingController passwordcontroller = TextEditingController();

//   //login method backend
//   void login() async {
//     //fill authentication
//     final _authServices = AuthServices();

//     //try sign in
//     try {
//       await _authServices.signInWithEmailPassword(
//         emailcontroller.text,
//         passwordcontroller.text,
//       );
//     } catch (e) {
//       showDialog(
//         // ignore: use_build_context_synchronously
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text(e.toString()),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // login_page components
//     return Scaffold(
//         backgroundColor: Theme.of(context).colorScheme.background,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             //logo of the app
//             Icon(
//               Icons.lock_open_rounded,
//               size: 100,
//               color: Theme.of(context).colorScheme.inversePrimary,
//             ),

//             const SizedBox(height: 25),

//             //message and slogan
//             Text("Welcome to MunchMap",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Theme.of(context).colorScheme.inversePrimary,
//                 )),

//             const SizedBox(height: 25),
//             //email textfield
//             MytextField(
//               controller: emailcontroller,
//               hintText: "Email",
//               obscureText: false,
//             ),

//             const SizedBox(height: 25),

//             //password textfield
//             MytextField(
//               controller: passwordcontroller,
//               hintText: "Password",
//               obscureText: true,
//             ),

//             const SizedBox(height: 25),
//             //signin button
//             MyButton(text: "Sing In", onTap: login),
//             const SizedBox(height: 25),
//             //register new members
//             Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//               Text("Not a Member?",
//                   style: TextStyle(
//                     color: Theme.of(context).colorScheme.inversePrimary,
//                   )),
//               const SizedBox(width: 4),
//               GestureDetector(
//                 onTap: widget.onTap,
//                 child: Text("Register Now!",
//                     style: TextStyle(
//                       color: Theme.of(context).colorScheme.inversePrimary,
//                       fontWeight: FontWeight.bold,
//                     )),
//               ),
//             ]),
//           ],
//         ));
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_app_food/pages/home_page.dart';
// import 'package:flutter_app_food/services/auth_services.dart';
// import 'package:flutter_app_food/widgets/buttons.dart';
// import 'package:flutter_app_food/widgets/textfields.dart';
// import 'package:lottie/lottie.dart'; // Import Lottie package

// class LoginPage extends StatefulWidget {
//   final void Function()? onTap;
//   const LoginPage({super.key, required this.onTap});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage>
//     with SingleTickerProviderStateMixin {
//   // Textfield controllers
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   // Animation-related fields
//   bool isButtonPressed = false;
//   double logoOpacity = 0.0;

//   // Login method backend
//   void login() async {
//     final _authServices = AuthServices();

//     // Try sign-in
//     try {
//       await _authServices.signInWithEmailPassword(
//         emailController.text,
//         passwordController.text,
//       );
//     } catch (e) {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text("Error"),
//           content: Text(e.toString()),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("OK"),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   @override
//   void initState() {
//     super.initState();

//     // Trigger logo opacity animation after page loads
//     Future.delayed(const Duration(milliseconds: 300), () {
//       setState(() {
//         logoOpacity = 1.0;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: SingleChildScrollView(
//         child: Center(
//           // Ensure everything is centered
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                     height:
//                         100), // Increase the initial space to bring everything down

//                 // Replace Image with Lottie animation
//                 AnimatedOpacity(
//                   duration: const Duration(seconds: 1),
//                   opacity: logoOpacity,
//                   child: Lottie.asset(
//                     'images/login_animation.json', // Replace with your Lottie file path
//                     height: 250, // Increased logo size
//                     width: 250,
//                     repeat: true, // Optional: makes it loop indefinitely
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 // Welcome message
//                 Text(
//                   "Welcome to MunchMap",
//                   style: TextStyle(
//                     fontSize: 26, // Slightly larger font size
//                     fontWeight: FontWeight.bold,
//                     color: Theme.of(context).colorScheme.primary,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   "Explore, order, and enjoy!",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Theme.of(context).colorScheme.inversePrimary,
//                   ),
//                 ),

//                 const SizedBox(height: 40),

//                 // Email textfield
//                 MytextField(
//                   controller: emailController,
//                   hintText: "Email",
//                   obscureText: false,
//                 ),

//                 const SizedBox(height: 20),

//                 // Password textfield
//                 MytextField(
//                   controller: passwordController,
//                   hintText: "Password",
//                   obscureText: true,
//                 ),

//                 const SizedBox(height: 30),

//                 // Sign-in button with animation
//                 GestureDetector(
//                   onTapDown: (_) {
//                     setState(() => isButtonPressed = true);
//                   },
//                   onTapUp: (_) {
//                     setState(() => isButtonPressed = false);
//                     login();
//                   },
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 200),
//                     height: 50,
//                     width: isButtonPressed ? 160 : 180,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).colorScheme.primary,
//                       borderRadius: BorderRadius.circular(25),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           blurRadius: 10,
//                           offset: const Offset(0, 5),
//                         ),
//                       ],
//                     ),
//                     alignment: Alignment.center,
//                     child: Text(
//                       "Sign In",
//                       style: TextStyle(
//                         color: Theme.of(context).colorScheme.onPrimary,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 25),

//                 // Register new members
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Not a member?",
//                       style: TextStyle(
//                         color: Theme.of(context).colorScheme.inversePrimary,
//                       ),
//                     ),
//                     const SizedBox(width: 4),
//                     GestureDetector(
//                       onTap: widget.onTap,
//                       child: Text(
//                         "Register Now!",
//                         style: TextStyle(
//                           color: Theme.of(context).colorScheme.primary,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 // Spacer widget to avoid layout issues
//                 const SizedBox(height: 50),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//----//
import 'package:flutter/material.dart';
import 'package:flutter_app_food/pages/home_page.dart';
import 'package:flutter_app_food/services/auth_services.dart';
import 'package:flutter_app_food/widgets/buttons.dart';
import 'package:flutter_app_food/widgets/textfields.dart';
import 'package:lottie/lottie.dart'; // Import Lottie package

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  // Textfield controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Animation-related fields
  bool isButtonPressed = false;
  bool isLoggingIn = false; // Flag for controlling loading state
  double logoOpacity = 0.0;

  // Login method backend
  void login() async {
    setState(() {
      isLoggingIn = true; // Show the waiting animation
    });

    final _authServices = AuthServices();

    // Try sign-in
    try {
      await _authServices.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
      setState(() {
        isLoggingIn = false; // Hide the waiting animation
      });

      // Navigate to Home Page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      setState(() {
        isLoggingIn = false; // Hide the waiting animation if error occurs
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    // Trigger logo opacity animation after page loads
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        logoOpacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Center(
          // Ensure everything is centered
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    height:
                        100), // Increase the initial space to bring everything down

                // Display the appropriate animation based on login state
                if (isLoggingIn)
                  Lottie.asset(
                    'images/wait_animation.json', // Waiting animation
                    height: 150,
                    repeat: true,
                  )
                else
                  AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    opacity: logoOpacity,
                    child: Lottie.asset(
                      'images/login_animation.json', // Logo animation
                      height: 250, // Increased logo size
                      repeat: true,
                    ),
                  ),

                const SizedBox(height: 20),

                // Welcome message
                Text(
                  "Welcome to MunchMap",
                  style: TextStyle(
                    fontSize: 26, // Slightly larger font size
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Explore, order, and enjoy!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),

                const SizedBox(height: 40),

                // Email textfield
                MytextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),

                const SizedBox(height: 20),

                // Password textfield
                MytextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),

                const SizedBox(height: 30),

                // Sign-in button with animation
                GestureDetector(
                  onTapDown: (_) {
                    setState(() => isButtonPressed = true);
                  },
                  onTapUp: (_) {
                    setState(() => isButtonPressed = false);
                    login();
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 50,
                    width: isButtonPressed ? 160 : 180,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // Register new members
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Register Now!",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                // Spacer widget to avoid layout issues
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

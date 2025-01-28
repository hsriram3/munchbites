// import 'package:flutter/material.dart';
// import 'package:flutter_app_food/services/auth_services.dart';
// import 'package:flutter_app_food/widgets/buttons.dart';
// import 'package:flutter_app_food/widgets/textfields.dart';

// class RegisterPage extends StatefulWidget {
//   final void Function()? onTap;
//   const RegisterPage({super.key, required this.onTap});

//   @override
//   State<RegisterPage> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<RegisterPage> {
//   //textfield controllers
//   final TextEditingController emailcontroller = TextEditingController();
//   final TextEditingController passwordcontroller = TextEditingController();
//   final TextEditingController confpasswordcontroller = TextEditingController();

//   void register() async {
//     final _authService = AuthServices();
//     // check if passwords match ->create new user
//     if (passwordcontroller.text == confpasswordcontroller.text) {
//       //try creating user
//       try {
//         await _authService.signInWithEmailPassword(
//             emailcontroller.text, passwordcontroller.text);
//       } catch (e) {
//         showDialog(
//           // ignore: use_build_context_synchronously
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text(e.toString()),
//           ),
//         );
//       }
//     }
//     //if passwords dont match ->error message
//     else {
//       showDialog(
//         // ignore: use_build_context_synchronously
//         context: context,
//         builder: (context) => const AlertDialog(
//           title: Text("Passwords don't match!"),
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
//             Text("Create a New Account",
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

//             //confirm password textfield
//             MytextField(
//               controller: confpasswordcontroller,
//               hintText: "Confirm Password",
//               obscureText: true,
//             ),

//             const SizedBox(height: 25),
//             //signin button
//             MyButton(text: "Sign Up", onTap: login),
//             const SizedBox(height: 25),

//             //already a member? Login here
//             Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//               Text("Already a Member?",
//                   style: TextStyle(
//                     color: Theme.of(context).colorScheme.inversePrimary,
//                   )),
//               const SizedBox(width: 4),
//               GestureDetector(
//                 onTap: widget.onTap,
//                 child: Text("Login",
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

//-----------Update 1 code-----------//
// import 'package:flutter/material.dart';
// import 'package:flutter_app_food/services/auth_services.dart';
// import 'package:flutter_app_food/widgets/buttons.dart';
// import 'package:flutter_app_food/widgets/textfields.dart';
// import 'package:flutter_app_food/pages/home_page.dart'; // Import your home page here

// class RegisterPage extends StatefulWidget {
//   final void Function()? onTap;
//   const RegisterPage({super.key, required this.onTap});

//   @override
//   State<RegisterPage> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<RegisterPage> {
//   //textfield controllers
//   final TextEditingController emailcontroller = TextEditingController();
//   final TextEditingController passwordcontroller = TextEditingController();
//   final TextEditingController confpasswordcontroller = TextEditingController();

//   /* not part of orig code
//   // void register() async {
//   //   final _authService = AuthServices();
//   //   // check if passwords match ->create new user
//   //   if (passwordcontroller.text == confpasswordcontroller.text) {
//   //     try {
//   //       // Create the user with email and password
//   //       await _authService.signUpWithEmailPassword(
//   //           emailcontroller.text, passwordcontroller.text);

//   //       // Navigate to home page after successful registration
//   //       Navigator.pushReplacement(
//   //         context,
//   //         MaterialPageRoute(builder: (context) => const HomePage()),
//   //       );
//   //     } catch (e) {
//   //       showDialog(
//   //         // ignore: use_build_context_synchronously
//   //         context: context,
//   //         builder: (context) => AlertDialog(
//   //           title: Text(e.toString()),
//   //         ),
//   //       );
//   //     }
//   //   } else {
//   //     // If passwords don't match -> error message
//   //     showDialog(
//   //       // ignore: use_build_context_synchronously
//   //       context: context,
//   //       builder: (context) => const AlertDialog(
//   //         title: Text("Passwords don't match!"),
//   //       ),
//   //     );
//   //   }
//   // } ending here*/
//   void register() async {
//     final _authService = AuthServices();
//     // Check if passwords match -> create new user
//     if (passwordcontroller.text == confpasswordcontroller.text) {
//       try {
//         // Create the user with email and password
//         await _authService.signUpWithEmailPassword(
//             emailcontroller.text, passwordcontroller.text);

//         // Check if the widget is still mounted before using context
//         if (mounted) {
//           // Navigate to the home page after successful registration
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => const HomePage()),
//           );
//         }
//       } catch (e) {
//         if (mounted) {
//           showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//               title: Text(e.toString()),
//             ),
//           );
//         }
//       }
//     } else {
//       if (mounted) {
//         // If passwords don't match -> error message
//         showDialog(
//           context: context,
//           builder: (context) => const AlertDialog(
//             title: Text("Passwords don't match!"),
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // register_page components
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           //app logo
//           Icon(
//             Icons.lock_open_rounded,
//             size: 100,
//             color: Theme.of(context).colorScheme.inversePrimary,
//           ),

//           const SizedBox(height: 25),

//           //message and slogan
//           Text("Create a New Account",
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Theme.of(context).colorScheme.inversePrimary,
//               )),

//           const SizedBox(height: 25),
//           //email textfield
//           MytextField(
//             controller: emailcontroller,
//             hintText: "Email",
//             obscureText: false,
//           ),

//           const SizedBox(height: 25),

//           //password textfield
//           MytextField(
//             controller: passwordcontroller,
//             hintText: "Password",
//             obscureText: true,
//           ),

//           const SizedBox(height: 25),

//           //confirm password textfield
//           MytextField(
//             controller: confpasswordcontroller,
//             hintText: "Confirm Password",
//             obscureText: true,
//           ),

//           const SizedBox(height: 25),
//           //signup button
//           MyButton(text: "Sign Up", onTap: register),
//           const SizedBox(height: 25),

//           //already a member? Login here
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Already a Member?",
//                 style: TextStyle(
//                   color: Theme.of(context).colorScheme.inversePrimary,
//                 ),
//               ),
//               const SizedBox(width: 4),
//               GestureDetector(
//                 onTap: widget.onTap,
//                 child: Text(
//                   "Login",
//                   style: TextStyle(
//                     color: Theme.of(context).colorScheme.inversePrimary,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

//------Update 1 code ends-------//

import 'package:flutter/material.dart';
import 'package:flutter_app_food/services/auth_services.dart';
import 'package:flutter_app_food/widgets/buttons.dart';
import 'package:flutter_app_food/widgets/textfields.dart';
import 'package:flutter_app_food/pages/home_page.dart';
import 'package:lottie/lottie.dart'; // Import Lottie package

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Textfield controllers
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confpasswordcontroller = TextEditingController();

  void register() async {
    final _authService = AuthServices();
    if (passwordcontroller.text == confpasswordcontroller.text) {
      try {
        await _authService.signUpWithEmailPassword(
            emailcontroller.text, passwordcontroller.text);
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
      } catch (e) {
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            ),
          );
        }
      }
    } else {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Passwords don't match!"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),

            // Lottie animation
            SizedBox(
              height: 300,
              width: 300,
              child: Lottie.asset('images/login_animation.json'),
            ),

            const SizedBox(height: 25),

            // Page title
            Text(
              "Create a New Account",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            // Email textfield
            MytextField(
              controller: emailcontroller,
              hintText: "Email",
              obscureText: false,
            ),

            const SizedBox(height: 25),

            // Password textfield
            MytextField(
              controller: passwordcontroller,
              hintText: "Password",
              obscureText: true,
            ),

            const SizedBox(height: 25),

            // Confirm password textfield
            MytextField(
              controller: confpasswordcontroller,
              hintText: "Confirm Password",
              obscureText: true,
            ),

            const SizedBox(height: 25),

            // Sign-up button
            MyButton(text: "Sign Up", onTap: register),

            const SizedBox(height: 25),

            // Already a member? Login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already a Member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app_food/pages/settings_page.dart';
import 'package:flutter_app_food/services/auth_services.dart';
import 'package:flutter_app_food/widgets/drawerpage_title.dart';

class Drawerpage extends StatelessWidget {
  const Drawerpage({super.key});

  void logout() {
    final authServices = AuthServices();
    authServices.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            //app logo
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Icon(
                Icons.lock_open_rounded,
                size: 60,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            //home list title
            DrawerpageTitle(
              text: "H O M E",
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
            ),
            //settings list title
            DrawerpageTitle(
              text: "S E T T I N G S",
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),

            const Spacer(),
            //logout list title
            DrawerpageTitle(
              text: "L O G O U T",
              icon: Icons.logout,
              onTap: () {
                logout();
                Navigator.pop(context);
              },
            ),

            const SizedBox(height: 25),
          ],
        ));
  }
}

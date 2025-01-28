import 'package:flutter/material.dart';
import 'package:flutter_app_food/pages/cart_page.dart';

class MySliverAppbar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySliverAppbar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 340,
        collapsedHeight: 120,
        floating: false,
        pinned: true,
        actions: [
          IconButton(
            onPressed: () {
              //go to the cart page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ));
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Urban Fork"),
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: child,
          ),
          title: title,
          centerTitle: true,
          titlePadding: const EdgeInsets.only(
            left: 0,
            right: 0,
            top: 0,
          ),
          expandedTitleScale: 1,
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app_food/models/cart.dart';
import 'package:flutter_app_food/models/restaurant.dart';
import 'package:flutter_app_food/pages/payment_page.dart';
import 'package:flutter_app_food/widgets/buttons.dart';
import 'package:flutter_app_food/widgets/cartitem_tile.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        //access the cart
        final userCart = restaurant.cart;

        //Cart UI
        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Do you want to clear the cart?"),
                      actions: [
                        //cancel button
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),

                        //yes button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: Column(
            children: [
              // list of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text("Cart is Empty.."),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                            itemCount: userCart.length,
                            itemBuilder: (context, index) {
                              //get indv cart item
                              final cartItems = userCart[index];

                              //return cart UI
                              return MyCartTile(cartItems: cartItems);
                            },
                          ))
                  ],
                ),
              ),
              //pay button
              MyButton(
                text: "Check Out Cart",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentPage(),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app_food/models/food.dart';

class myFoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const myFoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                // Food details text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text(
                        '\$${food.priceFood.toString()}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 11),
                      Text(
                        food.description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),

                // Image of food
                ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: SizedBox(
                    width: 100, // Set a fixed width
                    height: 100, // Set a fixed height
                    child: Image.asset(
                      food.imagePath,
                      fit: BoxFit.cover, // Crop the image to fit the square
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Divider line between food items
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 10,
          indent: 10,
        ),
      ],
    );
  }
}

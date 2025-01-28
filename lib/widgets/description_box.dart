import 'package:flutter/material.dart';

class DDescriptionBox extends StatelessWidget {
  const DDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    var primTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
    );

    var seconTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
    );

    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //delivery fees
          Column(
            children: [
              Text(
                '\0.90',
                style: primTextStyle,
              ),
              Text('Delivery Fees', style: seconTextStyle),
            ],
          ),
          //delivery time
          Column(
            children: [
              Text(
                '10-15 minutes',
                style: primTextStyle,
              ),
              Text(
                'Delivery Time',
                style: seconTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

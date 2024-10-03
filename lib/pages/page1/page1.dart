import 'package:flutter/material.dart';
import 'package:mbah_mo/pages/page1/food_data.dart';
import 'package:mbah_mo/pages/page1/food_item.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final items = getFoodItems();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) => FoodItem(item: items[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

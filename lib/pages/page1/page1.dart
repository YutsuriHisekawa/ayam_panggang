import 'package:flutter/material.dart';
import 'package:mbah_mo/pages/page1/food_data.dart';
import 'package:mbah_mo/pages/page1/food_item.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final items = getFoodItems();
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust the crossAxisCount based on screen width
    int crossAxisCount;
    double childAspectRatio;

    if (screenWidth > 1200) {
      crossAxisCount = 4;
      childAspectRatio = 1;
    } else if (screenWidth > 800) {
      crossAxisCount = 3;
      childAspectRatio = 1;
    } else {
      crossAxisCount = 2;
      childAspectRatio = 0.69;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: childAspectRatio,
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

// food_detail_page.dart
import 'package:flutter/material.dart';
import 'package:mbah_mo/pages/page1/food_data.dart';

class FoodDetailPage extends StatelessWidget {
  final MenuData item;

  const FoodDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF6b1c1f),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(item.image,
                width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(
              item.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDetailRow(Icons.monetization_on, 'Rp ${item.price}'),
                _buildDetailRow(Icons.timer, item.estimasi),
                _buildDetailRow(Icons.star, item.rating.toString()),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              item.description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}

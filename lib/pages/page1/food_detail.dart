import 'package:flutter/material.dart';
import 'package:mbah_mo/pages/page1/food_data.dart';

class FoodDetailPage extends StatelessWidget {
  final MenuData item;

  const FoodDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double padding = screenSize.width * 0.05;
    final double titleFontSize = screenSize.width < 600 ? 24 : 30;
    final double descriptionFontSize = screenSize.width < 600 ? 16 : 18;

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
        padding: EdgeInsets.all(padding),
        child: screenSize.width < 600
            ? _buildMobileLayout(titleFontSize, descriptionFontSize)
            : _buildDesktopLayout(titleFontSize, descriptionFontSize),
      ),
    );
  }

  Widget _buildMobileLayout(double titleFontSize, double descriptionFontSize) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildImage(),
          const SizedBox(height: 16),
          _buildTitle(titleFontSize),
          const SizedBox(height: 12),
          _buildDetailRow(),
          const SizedBox(height: 12),
          _buildDescription(descriptionFontSize),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(double titleFontSize, double descriptionFontSize) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: _buildImage(),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center the text in desktop layout
            children: [
              _buildTitle(titleFontSize),
              const SizedBox(height: 12),
              _buildDetailRow(),
              const SizedBox(height: 12),
              _buildDescription(descriptionFontSize),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          item.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTitle(double titleFontSize) {
    return Text(
      item.title,
      style: TextStyle(
        fontSize: titleFontSize,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center, // Center the title text
    );
  }

  Widget _buildDetailRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center the detail icons
      children: [
        _buildDetailIcon(Icons.monetization_on, 'Rp ${item.price}'),
        const SizedBox(width: 16),
        _buildDetailIcon(Icons.timer, item.estimasi),
        const SizedBox(width: 16),
        _buildDetailIcon(Icons.star, item.rating.toString()),
      ],
    );
  }

  Widget _buildDetailIcon(IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon),
        const SizedBox(height: 4),
        Text(
          text,
          textAlign: TextAlign.center, // Center the detail icon text
        ),
      ],
    );
  }

  Widget _buildDescription(double descriptionFontSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        item.description,
        style: TextStyle(fontSize: descriptionFontSize),
        textAlign: TextAlign.center, // Center the description text
      ),
    );
  }
}

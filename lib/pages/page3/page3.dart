import 'package:flutter/material.dart';
import 'package:mbah_mo/pages/page3/pesanan.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final List<OrderItem> _orders = orderData;
  final Set<int> _selectedItems = {};

  @override
  Widget build(BuildContext context) {
    int subtotal = _orders.fold(0, (sum, item) => sum + item.price);
    double ppn = subtotal * 0.11;
    double total = subtotal + ppn;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Pesanan'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _orders.length,
              itemBuilder: (context, index) {
                final order = _orders[index];
                final isSelected = _selectedItems.contains(order.id);
                return GestureDetector(
                  onLongPress: () {
                    _toggleSelection(order.id, isSelected);
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${index + 1}.',
                              style: const TextStyle(fontSize: 18)),
                        ),
                        Image.network(
                          order.imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  _rupiah(order.price),
                                  style: const TextStyle(
                                      color: Colors.green, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (isSelected) ...[
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _deleteOrder(index);
                            },
                          )
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSummaryRow('Subtotal', _rupiah(subtotal)),
                _buildSummaryRow('PPN (11%)', _rupiah(ppn.toInt())),
                _buildSummaryRow('Total', _rupiah(total.toInt())),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      _showOrderProcessedDialog(context);
                    },
                    child: const Text('Beli Sekarang'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toggleSelection(int id, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.remove(id);
      } else {
        _selectedItems.add(id);
      }
    });
  }

  void _deleteOrder(int index) {
    setState(() {
      _orders.removeAt(index);
    });
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  String _rupiah(int amount) {
    String result = '';
    String amountStr = amount.toString();
    int length = amountStr.length;

    for (int i = 0; i < length; i++) {
      result += amountStr[i];
      if ((length - i - 1) % 3 == 0 && i != length - 1) {
        result += '.';
      }
    }
    return 'Rp $result';
  }

  void _showOrderProcessedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 120,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 48),
                SizedBox(height: 16),
                Text(
                  'Pesanan segera diproses',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

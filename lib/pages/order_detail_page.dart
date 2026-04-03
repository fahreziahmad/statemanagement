import 'package:flutter/material.dart';

class OrderDetailArgs {
  final String id;
  final String title;
  final String subtitle;
  final int quantity;
  final double total;
  final String status;

  const OrderDetailArgs({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.quantity,
    required this.total,
    required this.status,
  });
}

class OrderDetailPage extends StatelessWidget {
  final OrderDetailArgs order;

  const OrderDetailPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Detail'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  'assets/images/app_banner.png',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              Text(order.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(order.subtitle, style: const TextStyle(fontSize: 16, color: Colors.black54)),
              const SizedBox(height: 24),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Rincian Pesanan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      _buildDetailRow('Nomor Order', order.id),
                      const SizedBox(height: 12),
                      _buildDetailRow('Jumlah', order.quantity.toString()),
                      const SizedBox(height: 12),
                      _buildDetailRow('Status', order.status),
                      const SizedBox(height: 12),
                      _buildDetailRow('Total Harga', 'Rp ${order.total.toStringAsFixed(0)}'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali ke Order Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        Text(value),
      ],
    );
  }
}

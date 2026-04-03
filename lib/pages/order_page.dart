import 'package:flutter/material.dart';
import 'order_detail_page.dart';

class OrderItem {
  final String id;
  final String title;
  final String subtitle;
  final int quantity;
  final double total;
  final String status;

  const OrderItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.quantity,
    required this.total,
    required this.status,
  });
}

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  final List<OrderItem> _orders = const [
    OrderItem(
      id: 'ORD-001',
      title: 'Paket Sarapan',
      subtitle: 'Nasi goreng + telur + teh tarik',
      quantity: 1,
      total: 28000,
      status: 'Dikirim',
    ),
    OrderItem(
      id: 'ORD-002',
      title: 'Snack Box',
      subtitle: 'Roti isi cokelat + jus jeruk',
      quantity: 1,
      total: 18000,
      status: 'Selesai',
    ),
    OrderItem(
      id: 'ORD-003',
      title: 'Makan Siang',
      subtitle: 'Ayam goreng + sayur asem + nasi putih',
      quantity: 1,
      total: 45000,
      status: 'Diproses',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Page'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  'assets/images/app_banner.png',
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Daftar Pesanan',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                itemCount: _orders.length,
                itemBuilder: (context, index) {
                  final order = _orders[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(order.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(order.subtitle),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Rp ${order.total.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          Text(order.status, style: const TextStyle(color: Colors.green)),
                        ],
                      ),
                      onTap: () {
                        final orderArgs = OrderDetailArgs(
                          id: order.id,
                          title: order.title,
                          subtitle: order.subtitle,
                          quantity: order.quantity,
                          total: order.total,
                          status: order.status,
                        );

                        Navigator.pushNamed(
                          context,
                          '/order_detail',
                          arguments: orderArgs,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

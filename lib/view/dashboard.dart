import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final String code;
  const DashboardPage({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Center(
        child: Text(
          'Your barcode/QR code is $code',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

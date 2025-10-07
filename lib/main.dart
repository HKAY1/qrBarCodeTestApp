import 'package:barcode_test_app/view/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const QRBarcodeApp());
}

class QRBarcodeApp extends StatelessWidget {
  const QRBarcodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR & Barcode Scanner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

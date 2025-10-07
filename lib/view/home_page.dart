import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'scanner_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ScannerPage()),
            );

            if (result == 'invalid') {
              Fluttertoast.showToast(
                msg: 'Invalid code scanned!',
                backgroundColor: Colors.red,
              );
            }
          },
          child: const Text('Scan Code'),
        ),
      ),
    );
  }
}

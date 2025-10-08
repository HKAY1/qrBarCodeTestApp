import 'package:barcode_test_app/view/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // Change these values to adjust scanning window size
    final double windowWidth = size.width * 0.7;
    final double windowHeight = size.width * 0.9;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          MobileScanner(
            fit: BoxFit.cover,
            onDetect: (capture) async {
              if (_isProcessing) return;
              final List<Barcode> barcodes = capture.barcodes;
              final String? code = barcodes.isNotEmpty
                  ? barcodes.first.rawValue
                  : null;

              if (code == null) return;

              setState(() => _isProcessing = true);

              await Future.delayed(const Duration(milliseconds: 500));
              if (code == 'login123' && mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => DashboardPage(code: code)),
                );
              } else if (mounted) {
                Navigator.pop(context, 'inalid');
              }

              setState(() => _isProcessing = false);
            },
          ),

          // Overlay with adjustable scanning area
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.5),
              BlendMode.srcOut,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    backgroundBlendMode: BlendMode.dstOut,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: windowWidth,
                    height: windowHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Optional border for better visibility
          IgnorePointer(
            child: Container(
              width: windowWidth,
              height: windowHeight,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'scannerError.dart';
import 'scannerLabel.dart';
import 'scannerButtons.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final MobileScannerController controller = MobileScannerController(
    torchEnabled: true,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MobileScanner(
          controller: controller,
          fit: BoxFit.contain,
          errorBuilder: (context, error, child) {
            return ScannerError(error: error);
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: 100,
            color: Colors.black.withOpacity(0.4),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ToggleFlashlightButton(controller: controller),
                    StartStopMobileScannerButton(controller: controller),
                    Expanded(
                      child: Center(
                        child: ScannedLabel(
                          barcodes: controller.barcodes,
                        ),
                      ),
                    ),
                    SwitchCameraButton(controller: controller),
                    AnalyzeImageFromGalleryButton(controller: controller),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await controller.dispose();
  }
}

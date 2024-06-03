import 'package:equisplit/constants/colorConstants.dart';
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
    torchEnabled: false,
  );

  @override
  Widget build(BuildContext context) {
    final Size _totalSize = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        MobileScanner(
          controller: controller,
          fit: BoxFit.contain,
          errorBuilder: (context, error, child) {
            return ScannerError(error: error);
          },
        ),
        Center(
          child: Container(
            height: _totalSize.width * 0.6,
            width: _totalSize.width * 0.6,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: ColorConstants.scannerFocusBox,
                  width: 5.0,
                )),
          ),
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
                  children: <Widget>[
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

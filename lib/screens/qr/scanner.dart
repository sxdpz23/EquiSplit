import 'package:equisplit/constants/colorConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'scannerError.dart';
import 'scannerButtons.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  // String? scannedValue = null;
  bool helper = true;

  final MobileScannerController controller = MobileScannerController(
    torchEnabled: false,
    // autoStart: true,
  );

  @override
  void initState() {
    // should start scanning
    if (helper) {
      helper = false;
      controller.start();
    }

    // listening to the stream for scanned data
    _processWhenScanned();

    super.initState();
  }

  _processWhenScanned() async {
    String scannedValue = "";
    await controller.barcodes.first.then((value) =>
        scannedValue = value.barcodes.single.displayValue.toString());
    if (scannedValue.isNotEmpty)
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text("Success"),
            content: Text(scannedValue),
          );
        },
      );
  }

  Widget _darkblock(
      {double? top,
      double? bottom,
      double? left,
      double? right,
      double? height,
      double? width}) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: ColorConstants.pageBG.withAlpha(189),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size _totalSize = MediaQuery.of(context).size;
    final double focusSide = _totalSize.width * 0.7;

    return Stack(
      children: <Widget>[
        MobileScanner(
          // controller: controller,
          fit: BoxFit.cover,
          errorBuilder: (context, error, child) {
            return ScannerError(error: error);
          },
        ),
        _darkblock(
          top: 0,
          left: 0,
          right: 0,
          height: (_totalSize.height - focusSide) / 3,
        ),
        _darkblock(
          top: 0,
          left: 0,
          bottom: 0,
          width: (_totalSize.width - focusSide) / 2,
        ),
        _darkblock(
          top: 0,
          right: 0,
          bottom: 0,
          width: (_totalSize.width - focusSide) / 2,
        ),
        _darkblock(
          left: 0,
          right: 0,
          bottom: 0,
          height: (_totalSize.height - focusSide) * 2 / 3,
        ),
        Positioned(
          top: (_totalSize.height - focusSide) / 3 - 15,
          left: (_totalSize.width - focusSide) / 2 - 15,
          child: Container(
            height: focusSide + 30,
            width: focusSide + 30,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: ColorConstants.scannerFocusBox,
                  width: 5.0,
                )),
          ),
        ),
        Positioned(
          top: ((_totalSize.height - focusSide) / 3) + focusSide + 40.0,
          left: (_totalSize.width - focusSide) / 2 + 15,
          right: (_totalSize.width - focusSide) / 2 + 15,
          bottom: (_totalSize.height - focusSide) / 4,
          child: ScannerButtons(controller: controller),
        ),
        Positioned(
          bottom: 40.0,
          left: 20.0,
          right: 20.0,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorConstants.pageFG,
                  borderRadius: BorderRadius.circular(20.0)),
              height: 50.0,
              padding: const EdgeInsets.all(10.0),
              child: const Center(
                child: Text(
                  'BACK',
                  style: TextStyle(
                    color: ColorConstants.pageTXT,
                    fontSize: 24,
                    letterSpacing: 2.5,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
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

import 'package:equisplit/constants/colorConstants.dart';
import 'package:equisplit/constants/helperFunctions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerButtons extends StatefulWidget {
  const ScannerButtons({super.key, required this.controller});

  final MobileScannerController controller;

  @override
  State<ScannerButtons> createState() => _ScannerButtonsState();
}

class _ScannerButtonsState extends State<ScannerButtons> {
  String? scannedValue;

  void _imagePickAction(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    final BarcodeCapture? barcodes =
        await widget.controller.analyzeImage(image.path);

    if (!context.mounted)
      return;
    else
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text("Success"),
            content: Text(barcodes != null
                ? barcodes.barcodes.single.displayValue!
                : "Unreadable QR!!"),
          );
        },
      );
  }

  @override
  void initState() {
    super.initState();
    if (scannedValue != null)
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("SCANNED :: $scannedValue"),
          backgroundColor: Colors.red,
        ));
      });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ValueListenableBuilder(
          valueListenable: widget.controller,
          builder: (context, state, child) {
            final int availableCameras = state.availableCameras ?? 0;
            return Column(
              children: <Widget>[
                HelperFunctions.createFAB(
                  text: 'Torch',
                  icon: Icons.flashlight_on_rounded,
                  action: () async {
                    await widget.controller.toggleTorch();
                  },
                  bgFAB: ColorConstants.scannerFG,
                  textFAB: ColorConstants.scannerTXT,
                ),
                HelperFunctions.createFAB(
                  text: 'Pick from Camera Roll',
                  icon: CupertinoIcons.photo_on_rectangle,
                  action: () => _imagePickAction(context),
                  bgFAB: ColorConstants.scannerFG,
                  textFAB: ColorConstants.scannerTXT,
                ),
                availableCameras > 2
                    ? HelperFunctions.createFAB(
                        text: 'Switch Camera',
                        icon: Icons.cameraswitch_rounded,
                        action: () async {
                          await widget.controller.switchCamera();
                        },
                        bgFAB: ColorConstants.scannerFG,
                        textFAB: ColorConstants.scannerTXT,
                      )
                    : const SizedBox.shrink(),
                // state.isInitialized || state.isRunning
                //     ? StreamBuilder(
                //         stream: widget.controller.barcodes,
                //         builder: (context, snapshot) {
                //           final scannedBarcodes = snapshot.data?.barcodes ?? [];
                //           String value = (scannedBarcodes.isNotEmpty
                //                   ? scannedBarcodes.first.displayValue
                //                   : null) ??
                //               "";

                //           if (value.isNotEmpty)
                //             SchedulerBinding.instance.addPostFrameCallback(
                //                 (_) => setState(() => scannedValue = value));
                //           return const SizedBox.shrink();
                //         },
                //       )
                //     : const SizedBox.shrink(),
              ],
            );
          }),
    );
  }
}

class StartStopMobileScannerButton extends StatelessWidget {
  const StartStopMobileScannerButton({required this.controller, super.key});

  final MobileScannerController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, state, child) {
        if (!state.isInitialized || !state.isRunning) {
          return IconButton(
            color: Colors.white,
            icon: const Icon(Icons.play_arrow),
            iconSize: 32.0,
            onPressed: () async {
              await controller.start();
            },
          );
        }

        return IconButton(
          color: Colors.white,
          icon: const Icon(Icons.stop),
          iconSize: 32.0,
          onPressed: () async {
            await controller.stop();
          },
        );
      },
    );
  }
}

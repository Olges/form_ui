import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_ui/constants/colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRpage extends StatefulWidget {
  const QRpage({Key? key}) : super(key: key);

  @override
  State<QRpage> createState() => _QRpageState();
}

class _QRpageState extends State<QRpage> {
  Barcode? result;
  String qrcode = '';
  QRViewController? controller;
  bool _flashOn = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.transparent.withOpacity(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (result != null)
                    Text(
                      qrcode,
                      style: TextStyle(color: Colors.deepPurple),)
                  else
                    const Text('Scan a code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Container(
                          child: IconButton(
                              onPressed: () async {
                                await controller!.toggleFlash();
                                setState(() {
                                  _flashOn = !_flashOn;
                                });
                              },
                              icon: Icon(
                                _flashOn
                                    ? Icons.flash_on_outlined
                                    : Icons.flash_off_outlined,
                                color: Colors.deepPurpleAccent,
                              )),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 200.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: AppColors.primary,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';

class QrWidget extends StatefulWidget {
  const QrWidget({Key? key}) : super(key: key);
  @override
  _QrWidgetState createState() => _QrWidgetState();
}

class _QrWidgetState extends State<QrWidget> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
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
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
        ],
      ),
    );
}

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
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
      if(result != null){

        String? alias = result!.code as String;
        if(alias != null && alias != ""){
          var redirectedDATA = alias.split("/");
          if(redirectedDATA != null){
            switch (redirectedDATA[0]){
              case "hall":{
                controller != null ? controller.pauseCamera() : null;
                Navigator.pushNamed(context, "/hall",arguments:redirectedDATA[1]).then((value){
                  if(controller != null){
                    controller.resumeCamera();
                  }
                });
                print("bye");
              }
              break;
              case "tour":{
                controller != null ? controller.pauseCamera() : null;
                Navigator.pushNamed(context, "/tour",arguments:redirectedDATA[1]).then((value){
                  if(controller != null){
                    controller.resumeCamera();
                  }
                });

              }
              break;
              case "thirdModel":{
                controller != null ? controller.pauseCamera() : null;
                Navigator.pushNamed(context, "/model",arguments:redirectedDATA[1]).then((value){
                  if(controller != null){
                    controller.resumeCamera();
                  }
                });
              }
              break;
            }
          }
        }
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission',style: TextStyle(color:Colors.white,fontSize: 16),), backgroundColor: Colors.red,),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
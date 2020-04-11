import 'package:flutter/material.dart';
import 'package:my_app/menu.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';

class QrReader extends StatefulWidget {
  @override
  _QrReaderState createState() => _QrReaderState();
}

class _QrReaderState extends State<QrReader> {
  final List<String> qrs = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  GlobalKey qrKey = GlobalKey();
  var qrText = "";
  QRViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
                key: qrKey,
                overlay: QrScannerOverlayShape(
                    borderRadius: 10.0,
                    borderColor: Colors.orange,
                    borderLength: 30.0,
                    borderWidth: 10.0,
                    cutOutSize: 300.0),
                onQRViewCreated: _onQRViewCreated),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this._controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
      for(int i = 0;i<qrs.length;i++){
        if(qrText == qrs[i]){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return MyHomePage(qrText);
          }));
          dispose();
        }
      }
    });
  }
}

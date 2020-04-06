import 'package:flutter/material.dart' ;
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';
import 'menu.dart';

class QrReader extends StatefulWidget {
  @override
  _QrReaderState createState() => _QrReaderState();
}

class _QrReaderState extends State<QrReader> {
  GlobalKey qrKey = GlobalKey();
  var qrText = "";
  QRViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        elevation: 0,
        backgroundColor:  Colors.orange,
        title: Text("Scan QR Code"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          /* Expanded(
           // flex: 1,
            child: Center(
              child: Text("To Use App .. Scan The QR Code" ,),
            ),
          ),
*/
          Expanded(
            flex: 7,
            child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated,overlay: QrScannerOverlayShape(
              borderRadius: 10,
              borderColor: Colors.orange,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: 300,
            ),),
          ),
          Expanded(
            flex: 1,
            /*child: Center(
              child: Text("Scan result: $qrText"),
            ),*/
            child: FlatButton(
              child: Text('Done'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){

                      return MyHomePage();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller){
    this.controller = controller;
    controller.scannedDataStream.listen((scanData){
      setState(() {
        qrText = scanData;
      });
    });
  }
}
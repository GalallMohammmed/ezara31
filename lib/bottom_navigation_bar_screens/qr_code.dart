import 'package:ezara3_1/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class qr_code_screen extends StatefulWidget {
  @override
  _qr_code_screenState createState() => _qr_code_screenState();
}

class _qr_code_screenState extends State<qr_code_screen> {
  @override
  Widget build(BuildContext context) {



    var qrString="Scan QR code";
    var height,width;
    Future<void> scanQR()async{

      try{
        FlutterBarcodeScanner.scanBarcode('#c0c0c0','cancel',true,ScanMode.QR).then((value){
          qrString=value;
        });
      }
      catch(e){
        setState(() {
          qrString="unable to read QR code";
        });
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(qrString,style: TextStyle(
              color: color,
              fontSize: 30.0,
            ),),
            ElevatedButton(onPressed: ()=>scanQR(), child: Text("Scan")),


          ],
        ),

      ),
    );


  }

}

import 'package:codigoqr/Utils/utils.dart';
import 'package:codigoqr/providers/scans_list-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      child: FloatingActionButton(
          elevation: 0,
          child: Icon(
            Icons.filter_center_focus,
            size: 18,
          ),
          onPressed: () async {
            //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            //  '#3D8BEF', 'Cancelar', false, ScanMode.QR);
            final barcodeScanRes = 'geo:4.719112,-74.043791';

            if (barcodeScanRes == '-1') {
              return;
            }

            final scanListProvider =
                Provider.of<ScanListProvider>(context, listen: false);
            final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

            launchURL(context, nuevoScan);
          }),
    );
  }
}

class CANCEL_BUTTON_TEXT {}

class COLOR_CODE {}

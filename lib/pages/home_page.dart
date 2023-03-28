import 'package:codigoqr/pages/directions_page.dart';
import 'package:codigoqr/pages/mapas_page.dart';
import 'package:codigoqr/providers/db_provider.dart';
import 'package:codigoqr/providers/scans_list-provider.dart';
import 'package:codigoqr/providers/ui_providers.dart';
import 'package:codigoqr/widgets/custon_navigatorbar.dart';
import 'package:codigoqr/widgets/scan_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                final scansListProvaider =
                    Provider.of<ScanListProvider>(context, listen: false);
                scansListProvaider.borrarTodos();
              },
              icon: Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustonNavigatinBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    //obtener el selected menu options

    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    //final tempScan = ScanModel(valor: 'http://telasplus.tk');

    //final intTemp = DBProvider.db.UpdateScan(tempScan);
    final scansListProvaider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scansListProvaider.cargarScanPorTipo('geo');
        return MapasPage();
      case 1:
        scansListProvaider.cargarScanPorTipo('http');
        return DirectionPage();

      default:
        return MapasPage();
    }
  }
}

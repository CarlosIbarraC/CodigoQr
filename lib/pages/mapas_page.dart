import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scans_list-provider.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, i) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.amber,
              ),
              onDismissed: (DismissDirection  direction) {
                 Provider.of<ScanListProvider>(context,listen: false).borrarScanPorId(scans[i].id!);
              },
              child: ListTile(
                  leading:
                      Icon(Icons.map, color: Theme.of(context).primaryColor),
                  title: Text(scans[i].valor),
                  subtitle: Text(scans[i].id.toString()),
                  trailing:
                      const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                  onTap: () => print(scans[i].id)),
            ));
  }
}

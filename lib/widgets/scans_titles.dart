import 'package:codigoqr/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/scans_list-provider.dart';

class ScanTitles extends StatelessWidget {
 
    
  final String tipo;
   ScanTitles({super.key, required this.tipo});
   

  @override
  Widget build(BuildContext context) {
    
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    
    return  ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, i) => Dismissible(
          key:  UniqueKey(),
           background: Container(
                color: Color.fromARGB(255, 178, 120, 218),
              ),
              onDismissed: (DismissDirection  direction) {
                 Provider.of<ScanListProvider>(context,listen: false).borrarScanPorId(scans[i].id!);
              },
          child: ListTile(            
              leading: Icon(
                tipo=='http'?Icons.home_outlined
                :Icons.map_outlined
                , color: Theme.of(context).primaryColor),
              title: Text(scans[i].valor),
              subtitle: Text(scans[i].id.toString()),
              trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
              onTap: ()=>(launchURL( context, scans[i]))),
        ));
  }
}


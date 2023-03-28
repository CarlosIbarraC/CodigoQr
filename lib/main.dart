import 'package:codigoqr/pages/home_page.dart';
import 'package:codigoqr/pages/mapa_page.dart';
import 'package:codigoqr/providers/scans_list-provider.dart';
import 'package:codigoqr/providers/ui_providers.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> UiProvider()),
        ChangeNotifierProvider(create: (_)=>ScanListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qr Reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'mapa': (_) => MapaPage(),
        },
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: Color.fromARGB(255, 175, 153, 236),
              ),
              titleTextStyle: TextStyle(
                  color: Color.fromARGB(255, 175, 153, 236), fontSize: 24),
              backgroundColor: Colors.deepPurple,
            ),
            primaryColor: Colors.deepPurple,
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              
                backgroundColor: Colors.deepPurple),
            // Here
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              unselectedItemColor: Color.fromARGB(255, 175, 153, 236),
              selectedItemColor: Colors.deepPurple,
            )),
      ),
    );
  }
}

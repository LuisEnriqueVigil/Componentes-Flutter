// import 'package:components_rep/pages/home_temp.dart';
// import 'package:components_rep/pages/rep_name/homepage_rep.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:components_rep/pages/alert_page.dart';
import 'package:components_rep/pages/homepage.dart';
import 'package:components_rep/routes/routes_pages.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ComponentesRep',
      debugShowCheckedModeBanner: false,
      home:HomePageApp(),
      initialRoute: 'home',
      routes: obtenerRutasAplicacion(), 
      onGenerateRoute: (RouteSettings settings) { 
        return MaterialPageRoute(
          builder: (BuildContext context )=> AlertPage() );
      },
      //se agrega esto para poder elegir el idioma del datePicker para 
      //generar fechas en espaniol
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es','ES'), 
        const Locale('en','US'), 
      ],
    );
      
  }
}
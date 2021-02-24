

import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {

  List<dynamic> opciones = [];

  _MenuProvider(){
    // cargarData(); 
  }

  Future<List<dynamic>> cargarData() async{
    final data = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(data);  //pasa la informacion de string a formato mapa
    // print(dataMap['rutas']); //para ver si el future esta trayendo la informacion que quiero
    opciones = dataMap['rutas'];
    return opciones;  
  }

}

//instanciando la clase privada
final menuProvider = new _MenuProvider(); 

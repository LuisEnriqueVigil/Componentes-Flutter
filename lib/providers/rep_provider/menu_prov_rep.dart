
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle; 

class _MenuProvRep { 

  List<dynamic> opciones = []; 
  // _MenuProvRep(){}

  Future <List<dynamic>> cargardata () async{ 

    final data = await rootBundle.loadString('data/menu_opts.json'); 
    Map dataMap = json.decode(data); 
    opciones=dataMap['rutas'];  
    return opciones; 
  }

}
  final menuproviderRep = new _MenuProvRep(); 

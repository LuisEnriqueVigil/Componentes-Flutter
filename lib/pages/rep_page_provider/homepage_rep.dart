import 'package:flutter/material.dart';

import 'package:components_rep/providers/rep_provider/menu_prov_rep.dart';

class HomePagerep extends StatelessWidget {
  const HomePagerep({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title:Text('RepasoFuture'), 
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {

    return FutureBuilder(
      future: menuproviderRep.cargardata(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _crearItemLista(snapshot.data),
        ); 
      }, 
    );
  }
  
  List<Widget> _crearItemLista(List<dynamic> data){ 

    final List<Widget> opciones = [];

    data.forEach((opcion) { 

        final temporalWidget  = ListTile(
          title: Text(opcion['texto']),
          leading: Icon(Icons.library_music),
          trailing: Icon(Icons.keyboard_arrow_right),
        ); 
        opciones..add(temporalWidget)
                ..add(Divider()); 
    });

    return opciones; 
  }
}
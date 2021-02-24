import 'package:flutter/material.dart';

class HomeTempPage extends StatelessWidget {
 
  final opciones = ['uno','dos','tres','cuatro','cinco']; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Flutter'),
      ),
      body: ListView(
        children:_crearItemFormaCorta(), 
      ),
    );
  }

  // List<Widget> _crearItem (){

  //   List<Widget> lista = new List<Widget>(); 

  //   for (String opcion in opciones) {

  //     final widgetTemp = ListTile
  //     (
  //       title: Text(opcion),
  //     ); 

  //     lista..add(widgetTemp)
  //          ..add(Divider()); 
  //   }

  //   return lista; 
  // }
  
  List<Widget> _crearItemFormaCorta(){ 
    
    return opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            subtitle: Text('Contactos'),
            leading: Icon(Icons.account_balance),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
            title: Text(item + '!!'),
          ),
          Divider(),
        ],
      ); 
    }).toList();
  }
}
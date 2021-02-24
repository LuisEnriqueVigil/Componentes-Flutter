

import 'package:flutter/material.dart';
import 'package:components_rep/utils/string_icon_util.dart';
import 'package:components_rep/providers/menu_provider.dart';

// import 'package:components_rep/pages/avatar_page.dart';

class HomePageApp extends StatelessWidget {
  const HomePageApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'), 
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //TODO : Para cargar data de un json se necesita un future
    return FutureBuilder(
      future: menuProvider.cargarData(), // este nos trae la informacion 
      initialData: [],//la informacion que tendra mientras que se trae la data aqui van los loadings
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        //se va disparar en 3 etapas
          //1. cuando esta trayendo la data
          //2. cuando se esta disparando la data
          //3. cuando se termina de disparar la data
        return ListView(
          children: _crearListaItem(snapshot.data,context), 
        );
      } , // este recibe una funcion 
    );
  }

  List<Widget> _crearListaItem(List<dynamic> data,BuildContext context) {

    final List<Widget> opciones = []; 

    data.forEach((opcion) {

      final widgetTemp = ListTile(
        title: Text(opcion['texto']),
        leading: getIcon(opcion['icon']),
        trailing: Icon(Icons.keyboard_arrow_right,color: Colors.blue,),
        onTap: (){
          //usando el material page route
          //Navigator.push(context, MaterialPageRoute(builder: (context) => AvatarPage(),)); 
          // 
          // usando el nombre de la ruta como un string 
          Navigator.pushNamed(context,opcion['ruta']); 
        },
      );  
      opciones..add(widgetTemp) 
              ..add(Divider() );

    }); 

    return opciones;
  }
  
}
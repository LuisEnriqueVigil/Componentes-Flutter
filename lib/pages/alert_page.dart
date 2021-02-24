import 'package:flutter/material.dart';
class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'), 
      ),
      floatingActionButton: 
        FloatingActionButton(
          onPressed: (){
            Navigator.pop(context); 
          }, 
          child: Icon(Icons.arrow_back_ios)
        ),
      body: Center(
        child: RaisedButton(
          onPressed: () =>_mostrarAlerta(context),
          child: Text('Mostrar Alerta',style: TextStyle(color:Colors.white),),
          color: Colors.blue,
          shape: StadiumBorder(),
        )
      )
    );
  }


  void _mostrarAlerta (BuildContext context) {
    showDialog(
      context: context, 
      barrierDismissible: true, 
      builder:  (context) {
        return AlertDialog(
          title: Text('titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min, //toma el minimo tamaño para el Pop Up a mostrar
            children: <Widget>[
              Text('Contenido de la alerta que muestra la descripcion de los datos'), 
              FlutterLogo(size: 100.0,),
            ],
          ), 
          actions: <Widget>[
           FlatButton(
             onPressed: ()=> Navigator.of(context).pop(),
             child: Text('Cancel')
           ),
           FlatButton(
             onPressed: ()=> Navigator.of(context).pop(),
             child: Text('Ok')
           ), 
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
        ); 
      }
    );
    
  }

}
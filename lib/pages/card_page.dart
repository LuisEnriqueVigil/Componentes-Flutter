
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 10.0),
          _cardTipo2(),
          SizedBox(height: 10.0),
          _cardTipo1(),
          SizedBox(height: 10.0),
          _cardTipo2(), 
          SizedBox(height: 10.0),
          _cardTipo1(),
          SizedBox(height: 10.0),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album,color:Colors.blue),
            title: Text('Soy el titulo de la tarjeta'),
            subtitle: Text('Es el subtitulo de la tarjeta que se moestrara adebajo del titulo'),
          ), 
          Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              onPressed: (){}, 
              child: Text('Cancelar')
            ),
            FlatButton(
              onPressed: (){},
              child: Text('Ok')
            )
          ],)
        ],
      ),
    ); 
  }

  Widget _cardTipo2() {

    final card =  Container(
      // elevation: 1.0,
      decoration: BoxDecoration(
        color: Colors.white,
      ) ,
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://i1.trekearth.com/photos/18421/dsc_1479.jpg'), 
            fadeInDuration: Duration(milliseconds: 300),
            height: 250,
            fit: BoxFit.cover,
          ), 
          Container(
            // color: Colors.red,
            padding: EdgeInsets.all(10.0),
            child: Text('Esta Imagen se ve bien dentro de la tarjeta'),  
          )
        ],
      ),
    ); 

    return Container(
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),
      ),
      decoration: BoxDecoration(
        // color:Colors.red, 
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.3),blurRadius: 5,offset: Offset(1,2))
        ],
        borderRadius: BorderRadius.circular(30.0)
      ),

    ); 

  }

}
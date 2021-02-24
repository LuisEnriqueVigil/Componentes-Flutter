
import 'package:flutter/material.dart';
import 'dart:math';


class AnimatedPage extends StatefulWidget {
  AnimatedPage({Key key}) : super(key: key);

  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  double _ancho = 150.0; 
  double _altura = 150.0; 
  Color _color = Colors.purple; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Animando Container'), 
       ),
       body: Center(
         child: AnimatedContainer(
           curve: Curves.fastOutSlowIn,//efectos para hacer animaciones mucho mas elegantes
           height: _altura,width: _ancho,
           decoration:BoxDecoration(
               color:_color,
               borderRadius: BorderRadius.circular(20.0)
           ), 
           duration: Duration(milliseconds: 500), 
         )
       ),
       //localizar el floating action button
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, 
       floatingActionButton: FloatingActionButton(
         onPressed: _cambiarformaColor,
         child: Icon(Icons.play_arrow,size: 40.0,),
       ),
    );
  }

  void _cambiarformaColor ( ){ 
    final random = Random(); 

    setState(() {
      _color = Color.fromRGBO(random.nextInt(200),random.nextInt(200),random.nextInt(150),1); 
      _altura = random.nextInt(300).toDouble(); 
      _ancho  = random.nextInt(250).toDouble();
    });
  }

}
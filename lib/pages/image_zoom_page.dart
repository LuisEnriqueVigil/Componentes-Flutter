import 'package:flutter/material.dart';

class ImagenZoomPage extends StatelessWidget {
  final int imagen; 
  const ImagenZoomPage({image, this.imagen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Imagen grande'),
       ),
       body: Center(
         child: Hero(
           tag: '$imagen',
           child: Image(
             image: NetworkImage('https://picsum.photos/id/$imagen/500/500')
           ),
         ),
       ),
    );
  }
}
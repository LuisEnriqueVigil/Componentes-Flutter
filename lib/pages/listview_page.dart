
import 'package:components_rep/pages/image_zoom_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  List<int> _numeros = new List(); 
  int _ultimonumero=0; 
  bool isLoading = false; 
  ScrollController _scrollController  = new ScrollController(); 

  @override
  void initState() {
    // TODO: USO DEL INIT STATE 
    super.initState(); //ESTO ES NECESARIO 
    _agregar10Imagenes(); //se inicia el proceso antes que se cree todo 
    
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {//final de la pagina maxscrooll
          traerData();  
      }
    }); //esto se dispara cada vez que se mueve el scroll
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose(); //esto ayuda a mejorar el uso de la memoria
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('ListView Builder'),
       ),
       body: Stack(
         children: <Widget>[
           _crearLista(),
           Center(child: _crearLoading()),
         ],
       ),
    );
  }

  Widget _crearLista() {
      //TODO: Usando el refresh indicator
    return RefreshIndicator(

      onRefresh: _onrefreshMetodo, //se esta pasando la referencia
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index){
          final imagen = _numeros[index]; 
          return GestureDetector(
            onTap: (){ 
              Navigator.push( context, MaterialPageRoute(builder: (context)=>ImagenZoomPage(imagen: imagen,)));  
            },
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Hero(
                  tag: '$imagen',
                  child: FadeInImage(
                    placeholder: AssetImage('assets/jar-loading.gif'), 
                    image: NetworkImage('https://picsum.photos/id/$imagen/500/300'),
                    //LA FORMA DEL LINK ANTIGUO //'https://picsum.photos/500/300/?image=$imagen'
                  ),
                ),
              ),
            ),
          );
        }, 
        controller: _scrollController,
        itemCount: _numeros.length,  
      ),
    ); 
  }

//para generar imagenes nuevas
  Future<void> _onrefreshMetodo() async{ 

    final duration =  new Duration(seconds: 3); 
     new Timer(duration, (){
       _numeros.clear(); 
       _ultimonumero++; 
       _agregar10Imagenes(); 
    });

    return Future.delayed(duration);
  }

  void _agregar10Imagenes (){ 
    for (int i = 1 ;  i<10 ; i++){ 
      _ultimonumero ++; 
      _numeros.add(_ultimonumero);
    }
    setState(() {});
  }

  Future<Null> traerData()async{ 
      //se simulara un delay 
     setState(() {
      isLoading = true;
    });
    new Timer(Duration(seconds: 2), respuestaHttp); 
  }

  void respuestaHttp(){ 
    isLoading = false; 
    _agregar10Imagenes(); 
    //TODO: Se puede animar el scroll para listView.builder
    _scrollController.animateTo(
      _scrollController.position.pixels + 200, 
      duration: Duration(milliseconds: 500), 
      curve: Curves.fastOutSlowIn
    );
  }

  Widget _crearLoading() {

    if(isLoading){ 
      return CircularProgressIndicator(
        backgroundColor: Colors.white,
      );
    }
    else{
      return Container();
    }

  }

}
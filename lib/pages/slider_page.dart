import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 50.0 ; 
  bool _bloquearSlider = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Slider Page'),
       ),
       body: Container(
        padding: EdgeInsets.only(top:50.0,left: 20.0,right: 20.0),
         child:Column(
           children: <Widget>[
             _crearSlider(),
             _crearChekBox(),
             _crearSwitch(),
             SizedBox(height: 25.0),
             _crearImagen(),
           ],
         )
       ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.purple,
      label: 'Tamaño de la Imagen',
      divisions: 20,
      value: _valorSlider,
      max: 400,min: 20.0, 
      onChanged: (_bloquearSlider)? null: (valor){ 
        setState(() {
          _valorSlider = valor; 
        }); 
      } 
    );
  }

  Widget _crearImagen() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image(
        image: NetworkImage('https://assets.materialup.com/uploads/922c35bd-940d-4f26-bbd5-ff8b7075f53b/preview.jpg'),
        width: _valorSlider,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _crearChekBox() {
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      activeColor: Colors.purple,
      value: _bloquearSlider, 
      onChanged: (valor){ 
        setState(() {
          _bloquearSlider = valor; 
        });
      }
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      activeColor: Colors.purple,
      value: _bloquearSlider, 
      onChanged: (valor){ 
        setState(() {
        _bloquearSlider = valor;          
        });
      }
    );
  }

}
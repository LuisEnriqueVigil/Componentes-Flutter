import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre=''; 
  String _email=''; 
  String _password='';
  String _fecha =''; 
  String _poderSeleccionado = 'volar'; 

  List<String> _poderes = ['fuerza','volar','rayos X','invisibilidad']; 

  TextEditingController _fechaController = new TextEditingController(); 

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Fields'), 
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal:20.0,vertical:20.0),
        children: <Widget>[
          _crearInput(),
          Divider(), 
          _crearEmail(),
          Divider(), 
          _crearPasword(), 
          Divider(), 
          _crearFecha( context),
          Divider(),
          _crearPersona(), 
          Divider(), 
          _creardropdown()
        ],
      ),

      //botom para simular grabar la informacion
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pop(context), 
        child: Icon(Icons.save,size:30.0),
        backgroundColor: Colors.purple,
      ),

    );
  }

  Widget _crearInput() {

    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences, // para las mayusculas en las sentencias
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        helperText: 'Nombres completos',
        counterText: 'Letras ${_nombre.length}',
        hintText: 'Nombres',
        labelText: 'Nombres completos', //-> se puede poner estilo a cada texto del input field
        // labelStyle: TextStyle(color:Colors.purple,fontSize: 15.0), -> estilo a al titulo de la caja
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor) {
        _nombre = valor; 
        setState(() {});
      },
    );
  }

  Widget _crearPersona() {

    return  ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Correo Electrico : $_email \nPassword : $_password \nFecha de Nacimiento: $_fecha'),
      trailing: Text('$_poderSeleccionado'),
    ); 

  }

  Widget _crearEmail() {
    return TextField(
      autofocus: false,
      keyboardType: TextInputType.emailAddress,//esto permite escoger el tipo de teclado para llenar los campos
      textCapitalization: TextCapitalization.sentences, 
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        helperText: 'Correo Electronico',
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.email),
        icon: Icon(Icons.info)
      ),
      onChanged: (valor) {
        _email = valor; 
        setState(() {});
      },
    );
  }

 Widget _crearPasword() {
   return TextField(
      autofocus: false,
      keyboardType: TextInputType.emailAddress,//esto permite escoger el tipo de teclado para llenar los campos
      textCapitalization: TextCapitalization.sentences, 
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        helperText: 'Contrasenia',
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: (_password.length >0)?Icon(Icons.remove_red_eye):Icon(Icons.lock_outline),
        icon: Icon(Icons.lock_outline)
      ),
      onChanged: (valor) {
        _password = valor; 
        setState(() {});
      },
    );
 }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _fechaController,
      autofocus: false,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        helperText: 'Fecha de Nacimiento',
        labelText: 'Fecha de Nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: (){  //lanza un metodo al presionar el textfield
        FocusScope.of(context).requestFocus(new FocusNode()); // esto es para cambiar el foco una vez hecho tap
        _selecccionarFecha(context);
      },
    );
  }

  //TODO: Manejo de Fechas para la app
  void _selecccionarFecha(BuildContext context) async{

      DateTime picked = await showDatePicker(
        context: context, 
        initialDate: new DateTime.now(), 
        firstDate: new DateTime(2015),
        lastDate: new DateTime(2022), 
        locale: Locale('es', 'ES') //idioma del calendario para seleccionar la fecha
      );
      //aqui se valida la informacion y se asigna la fecha escogida
      //a la varibale fecha
      if(picked !=null) {
        setState(() {
          _fecha = picked.toString();
          _fechaController.text = _fecha; 
        });
      }

  }


  //TODO: creando el un DropDownButton
  List<DropdownMenuItem<String>> obtenerOpciones (){ 

    List<DropdownMenuItem<String>> lista = new List(); 
    
    _poderes.forEach((poder) { 
       Widget widgetTem =DropdownMenuItem(
         child: Text(poder),
         value: poder,
       ); 
       lista.add(widgetTem); 
    });
    return lista; 
  }

  Widget _creardropdown() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.power),
        SizedBox(width: 20.0,),
        DropdownButton(
          value: _poderSeleccionado,
          items: obtenerOpciones(), 
          onChanged: (option){
            setState(() {
            _poderSeleccionado=option; 
           });
          }
        ),  
      ],
    ); 
  }
}
import 'package:flutter/material.dart';

class AvatarPage extends StatefulWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  _AvatarPageState createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  
  //variables que van a cambiar de estado con alguno disparador en la app
  double altura = 150.0; 
  bool fullscren = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        actions: <Widget>[
            //para poner widgets en la parte del appbar
          Container(
            padding: EdgeInsets.all(2.5),
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://www.duna.cl/media/2021/02/elon-musk.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.yellowAccent,
            ),
          )
        ],
        title: Text('Avatar Page'), 
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){ 
            setState(() {
              fullscren =!fullscren;  
              if(fullscren)
                altura = 300.0;   
              if(!fullscren)
                altura =150.0;
            }); 
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            height: altura,
            margin: EdgeInsets.symmetric(horizontal:15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),

              child: FadeInImage(
                fadeInDuration: Duration(milliseconds: 100),
                placeholder: AssetImage('assets/jar-loading.gif'), 
                image: NetworkImage('https://www.duna.cl/media/2021/02/elon-musk.jpg')
              ),
            ),
          ),
        ),
      ),
    );
  }
}
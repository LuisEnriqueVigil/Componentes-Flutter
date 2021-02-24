
import 'package:flutter/material.dart';

final _iconString = <String,IconData> {

  'folder_open'   : Icons.folder_open, 
  'accessibility' : Icons.accessibility, 
  'add_alert'     : Icons.add_alert, 
  'play_arrow'    : Icons.play_arrow,
  'input'         : Icons.input, 
  'slider'        : Icons.style,
  'listas'        : Icons.list,

};

Icon getIcon (String nombreIcon){ 

  return Icon(_iconString[nombreIcon],color:Colors.blue); 

}
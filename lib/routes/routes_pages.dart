
import 'package:components_rep/pages/animated_page.dart';
import 'package:components_rep/pages/input_fields_pages.dart';
import 'package:components_rep/pages/listview_page.dart';
import 'package:components_rep/pages/slider_page.dart';
import 'package:flutter/material.dart';

import 'package:components_rep/pages/alert_page.dart';
import 'package:components_rep/pages/avatar_page.dart';
import 'package:components_rep/pages/homepage.dart';
import 'package:components_rep/pages/card_page.dart';

Map <String,WidgetBuilder> obtenerRutasAplicacion () { 

  return <String,WidgetBuilder> {
        'home'    : (BuildContext context) => HomePageApp(), 
        'alert'   : (BuildContext context ) => AlertPage(),
        'avatar'  : (BuildContext context ) => AvatarPage(),
        'card'    : (BuildContext context ) => CardPage(),
        'animated': (BuildContext context ) => AnimatedPage(), 
        'inputs'  : (BuildContext context)  => InputPage(),
        'slider'  : (BuildContext context)  => SliderPage(),
        'listas'  : (BuildContext context)  => ListViewPage(),


  };
} 
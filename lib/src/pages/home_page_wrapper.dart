import 'package:flutter/material.dart';


import 'package:flutter_web_app/size_config.dart';
import 'package:flutter_web_app/src/pages/home_page_landscape.dart';
import 'package:flutter_web_app/src/pages/home_page_portrait.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    MediaQueryData mediaQuery = MediaQuery.of(context);
    SizeConfig().init(context);
    

    if(mediaQuery.orientation == Orientation.landscape){
      return landscapeHomePage();
    }else{
      return portraitHomePage();
    }
  }  
}
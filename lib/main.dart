import 'package:flutter/material.dart';
import 'package:flutter_web_app/src/pages/home_page_wrapper.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify UI',
      initialRoute: 'home',
      routes: {

        'home'              :(BuildContext context)       =>HomePage(),

      },

      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        sliderTheme: SliderThemeData(
          overlayColor: Colors.white24,
          thumbColor: Colors.green[200],
          valueIndicatorColor: Colors.greenAccent,
          inactiveTrackColor: Colors.greenAccent,
        )
      ),
    );
  }
}
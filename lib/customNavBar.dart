import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {

  double sliderValue = 0.0;


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: size.height*0.13,
      color: Color.fromRGBO(50, 50, 50, 1.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _songData(size),
          Expanded(child: Container()),
          _playInterfase(size),
          Expanded(child: Container()),
          _extraButtons(size)
        ],
      )
    );
  }

  _songData(Size size){
    return Container(
      height: size.height*0.09,
      width: size.width*0.25,
      decoration: BoxDecoration(
        // color: Color.fromRGBO(75, 75, 75, 1.0),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Row(
        children: [
        Container(
          height: size.height*0.09,
          width: size.width*0.045,
          color: Color.fromRGBO(90, 90, 90, 1.0),
          child: Center(child: Text('Album Art', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)),
        ),
        SizedBox(width: 5.0,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Song Name', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400), textAlign: TextAlign.center,),
          Text('Band Name', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200), textAlign: TextAlign.center,)
        ],),
        SizedBox(width: 25.0,),
        IconButton(icon: Icon(Icons.favorite_outline_rounded, color: Colors.white,), onPressed: (){},),
        IconButton(icon: Icon(Icons.fullscreen, color: Colors.white,), onPressed: (){},)

      ],)
    );
  }

  _playInterfase(Size size){
    return Container(
      height: size.height*0.1,
      width: size.width*0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(icon: Icon(Icons.shuffle, color: Colors.white, size: 20), onPressed: (){},),
              IconButton(icon: Icon(Icons.navigate_before, color: Colors.white, size: 24), onPressed: (){},),
              IconButton(icon: Icon(Icons.play_arrow, color: Colors.white, size: 24), onPressed: (){},),
              IconButton(icon: Icon(Icons.navigate_next, color: Colors.white, size: 24), onPressed: (){},),
              IconButton(icon: Icon(Icons.repeat, color: Colors.white, size: 20,), onPressed: (){},),
          ],),
          SizedBox(height: 5.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            // LinearProgressIndicator(backgroundColor: Colors.white, valueColor: AlwaysStoppedAnimation<Color>(Colors.green[300]),)
            Text('0:00', style: TextStyle(color: Colors.white),),
            Text('Progress Bar', style: TextStyle(color: Colors.white),),
            Text('10:00', style: TextStyle(color: Colors.white),)
          ],)
      ],)
    );
  }

  _extraButtons(Size size){

    return Container(
      height: size.height*0.09,
      // width: size.width*0.28,

      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.mic, color: Colors.white, size: 18.0,), onPressed: (){},),
          IconButton(icon: Icon(Icons.list, color: Colors.white, size: 18.0), onPressed: (){},),
          IconButton(icon: Icon(Icons.screen_share_outlined, color: Colors.white, size: 18.0), onPressed: (){},),
          IconButton(icon: Icon(Icons.volume_up, color: Colors.white, size: 18.0), onPressed: (){},),
          Container(width: 150.0,child: Slider(min: 0, max:100, divisions: 100, value: 0, onChanged: (value) => setState((){sliderValue = value;})))
        ],
      )
    );
  }

  
}
import 'package:flutter/material.dart';
import 'package:flutter_web_app/size_config.dart';

class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> with TickerProviderStateMixin{

  double sliderValue = 0.0;
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: SizeConfig.blockSizeVertical * 13,
      color: Color.fromRGBO(50, 50, 50, 1.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _songData(),
          Expanded(child: Container()),
          _playInterfase(),
          Expanded(child: Container()),
          _extraButtons()
        ],
      )
    );
  }

  _songData(){
    return Container(
      height: SizeConfig.blockSizeVertical * 9,
      width: SizeConfig.blockSizeHorizontal * 25,
      decoration: BoxDecoration(
        // color: Color.fromRGBO(75, 75, 75, 1.0),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Row(
        children: [
        Container(
          height: SizeConfig.blockSizeVertical * 9,
          width: SizeConfig.blockSizeHorizontal * 4.5,
          color: Color.fromRGBO(90, 90, 90, 1.0),
          child: Center(child: Text('Album Art', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)),
        ),
        SizedBox(width: 20.0,),
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

  _playInterfase(){

    return Container(
      height: SizeConfig.blockSizeVertical * 10,
      width: SizeConfig.blockSizeHorizontal * 40,
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
            // LinearProgressIndicator(backgroundColor: Colors.white, value: controller.value, minHeight: 5.0,),
            Text('0:00', style: TextStyle(color: Colors.white),),
            Text('[Progress Bar]', style: TextStyle(color: Colors.white),),
            Text('10:00', style: TextStyle(color: Colors.white),)
          ],)
      ],)
    );
  }

  _extraButtons(){

    return Container(
      height: SizeConfig.blockSizeVertical * 9,
      // width: size.width*0.28,

      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.mic, color: Colors.white, size: 18.0,), onPressed: (){},),
          IconButton(icon: Icon(Icons.list, color: Colors.white, size: 18.0), onPressed: (){},),
          IconButton(icon: Icon(Icons.screen_share_outlined, color: Colors.white, size: 18.0), onPressed: (){},),
          IconButton(icon: Icon(Icons.volume_up, color: Colors.white, size: 18.0), onPressed: (){},),
          Container(
            width: SizeConfig.blockSizeHorizontal * 13,
            child: Slider(min: 0, max:100, divisions: 100, value: 0, onChanged: (value) => setState((){sliderValue = value;})))
        ],
      )
    );
  }

  
}
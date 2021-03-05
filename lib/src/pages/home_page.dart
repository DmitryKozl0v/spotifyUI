import 'package:flutter/material.dart';

import 'package:flutter_web_app/customNavBar.dart';
import 'package:flutter_web_app/size_config.dart';

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
      return _landscapePage();
    }else{
      return _portraitPage();
    }
  }

  Widget _landscapePage(){
    return Scaffold(
      body: Row(
        children: <Widget>[
          _landscapeBlackHorizontalBar(context),
          _landscapeMainScreen(context)
        ]
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }

  Widget _portraitPage(){
    // return Scaffold(
    //   body: Row(
    //     children: <Widget>[
    //       _blackHorizontalBar(context),
    //       _mainScreen(context)
    //     ]
    //   ),
    //   bottomNavigationBar: CustomNavBar(),
    // );
    return Container();
  }

  Widget _landscapeBlackHorizontalBar(BuildContext context){

    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      color: Colors.black,
      height: double.infinity,
      width: size.width*0.18,
      child: _lateralMenu(size),
    );

  }

  Widget _landscapeMainScreen(BuildContext context){

    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      color: Color.fromRGBO(22, 22, 22, 1.0),
      height: double.infinity,
      width: SizeConfig.blockSizeHorizontal * 80,
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height*0.09,),
                _suggestionLists(size)
              ],
            ),
          ),
          _topBar(size)
        ],
      )
    );
  }

  _topBar(Size size){
    return Container(
      height: size.height*0.09,
      width: size.width*0.82,
      decoration: BoxDecoration(
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _topNavigationButtons(size),
          _profileButtons(size),
        ],
      )
    );
  }

  _topNavigationButtons(Size size){
    return Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(15, 15, 15, 0.9),
              border: Border.all(color: Color.fromRGBO(15, 15, 15, 0.9)),
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_sharp, size: 16, color: Colors.white,),
              onPressed: (){},
            ),
          ),
          SizedBox(width: 7.5,),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(15, 15, 15, 0.9),
              border: Border.all(color: Color.fromRGBO(15, 15, 15, 0.9)),
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios_sharp, size: 16, color: Colors.white,),
              onPressed: (){},
            ),
          )
        ],
      )
    );
  }

  _profileButtons(Size size){

    return Container(
      height: size.height*0.05,
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(15, 15, 15, 0.8),
        borderRadius: BorderRadius.circular(100.0)
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Color.fromRGBO(75, 75, 75, 1.0),
          style: TextStyle(color: Colors.white),
          hint: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(1.0),
                child: Icon(Icons.person, color: Colors.white, size: 20,), 
                decoration: BoxDecoration(
                  color: Color.fromRGBO(75, 75, 75, 1.0),
                  border: Border.all(color: Color.fromRGBO(75, 75, 75, 1.0)),
                  borderRadius: BorderRadius.circular(100.0)
                  ),
              ),
              SizedBox(width: 5.0,),
              Text('Your UserName', style: TextStyle(color: Colors.white),),
            ],
          ),
          icon: Icon(Icons.arrow_drop_down, color: Colors.white,),
          items: <String>['Account', 'Profile', 'Log out'].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      )
    );
  }

  _suggestionLists(Size size){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: size.width*0.8,
      decoration: BoxDecoration(
        color: Color.fromRGBO(75, 75, 75, 1.0),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: <Widget>[
          _listOfSuggestions(size),
          SizedBox(height: 10.0,),
          _listOfSuggestions(size),
          SizedBox(height: 10.0,),
          _listOfSuggestions(size),
          SizedBox(height: 10.0,),
          _listOfSuggestions(size),
        ],
      )
    );
  }

  _listOfSuggestions(Size size){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      height: size.height*0.5,
      width: size.width*0.8,
      decoration: BoxDecoration(
        color: Color.fromRGBO(90, 90, 90, 1.0),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Text('Title'),
            Expanded(child: Container()),
            Text('See More')
          ],),
          SizedBox(height: 10.0,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: <Widget>[
              _playlistCard(size),
              SizedBox(width: 20.0,),
              _playlistCard(size),
              SizedBox(width: 20.0,),
              _playlistCard(size),
              SizedBox(width: 20.0,),
              _playlistCard(size),
              SizedBox(width: 20.0,),
              _playlistCard(size),
              SizedBox(width: 20.0,),
              _playlistCard(size),
              SizedBox(width: 20.0,)
            ],),
          )        
        ],
      ),
    );
  }

  _playlistCard(Size size){
    return Container(
      padding: EdgeInsets.all(15.0),
      height: size.height*0.35,
      width: size.width*0.13,
      decoration: BoxDecoration(
        color: Color.fromRGBO(110, 110, 110, 1.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: size.height*0.2,
            width: size.width*0.1,
            decoration: BoxDecoration(
              color: Color.fromRGBO(130, 130, 130, 1.0),
              borderRadius: BorderRadius.circular(5.0)
            ),
          ),
          SizedBox(height: 10.0,),
          Text('Title'),
          SizedBox(height: 5.0,),
          Text('Artist')
        ],
      ),
    );
  }

  _lateralMenu(Size size){

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _spotifyLogo(size),
        SizedBox(height: 20.0,),
        _pageSelector(size),
        SizedBox(height: 20.0,),
        _playlists(size),
      ]
    );
  }

  _spotifyLogo(Size size){
    return Container(
      height: size.height*0.09,
      width: size.width*0.15,
      decoration: BoxDecoration(
        color: Color.fromRGBO(75, 75, 75, 1.0),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Center(child: Text('Spotify Logo', style: TextStyle(color: Colors.white),))
    );
  }

  _pageSelector(Size size){
    return Container(
      height: size.height*0.2,
      width: size.width*0.15,
      decoration: BoxDecoration(
        color: Color.fromRGBO(75, 75, 75, 1.0),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Container()),
          Text('Home', style: TextStyle(color: Colors.white)),
          Expanded(child: Container()),
          Text('Search', style: TextStyle(color: Colors.white)),
          Expanded(child: Container()),
          Text('Your Library', style: TextStyle(color: Colors.white)),
          Expanded(child: Container()),
        ]
      ),
    );
  }

  _playlists(Size size){
    return Container(
      height: size.height*0.4,
      width: size.width*0.15,
      decoration: BoxDecoration(
        color: Color.fromRGBO(75, 75, 75, 1.0),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
            Text('A playlist', style: TextStyle(color: Colors.white)),
          ]
        ),
      ),
    );
  }
}
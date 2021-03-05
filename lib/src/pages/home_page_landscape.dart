import 'package:flutter/material.dart';


import 'package:flutter_web_app/customNavBar.dart';
import 'package:flutter_web_app/size_config.dart';


Widget landscapeHomePage(){
  return Scaffold(
      body: Row(
        children: <Widget>[
          _blackHorizontalBar(),
          _mainScreen()
        ]
      ),
      bottomNavigationBar: CustomNavBar(),
    );
}

Widget _blackHorizontalBar(){

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      color: Colors.black,
      height: SizeConfig.blockSizeVertical * 100,
      width: SizeConfig.blockSizeHorizontal * 18,
      child: _lateralMenu(),
    );

}

Widget _mainScreen(){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      color: Color.fromRGBO(22, 22, 22, 1.0),
      height: double.infinity,
      width: SizeConfig.blockSizeHorizontal * 82,
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: SizeConfig.blockSizeVertical * 9,),
                _suggestionLists()
              ],
            ),
          ),
          _topBar()
        ],
      )
    );
}

_topBar(){
    return Container(
      height: SizeConfig.blockSizeVertical * 9,
      width: SizeConfig.blockSizeHorizontal * 82,
      decoration: BoxDecoration(
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _topNavigationButtons(),
          _profileButtons(),
        ],
      )
    );
  }

  _topNavigationButtons(){
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

_profileButtons(){

  return Container(
    height: SizeConfig.blockSizeVertical * 5,
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

_suggestionLists(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: SizeConfig.blockSizeHorizontal * 80,
      decoration: BoxDecoration(
        color: Color.fromRGBO(75, 75, 75, 1.0),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: <Widget>[
          _listOfSuggestions(),
          SizedBox(height: 10.0,),
          _listOfSuggestions(),
          SizedBox(height: 10.0,),
          _listOfSuggestions(),
          SizedBox(height: 10.0,),
          _listOfSuggestions(),
        ],
      )
    );
  }

   

  _listOfSuggestions(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      height: SizeConfig.blockSizeVertical * 50,
      width: SizeConfig.blockSizeHorizontal * 80,
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
              _playlistCard(),
              SizedBox(width: 20.0,),
              _playlistCard(),
              SizedBox(width: 20.0,),
              _playlistCard(),
              SizedBox(width: 20.0,),
              _playlistCard(),
              SizedBox(width: 20.0,),
              _playlistCard(),
              SizedBox(width: 20.0,),
              _playlistCard(),
              SizedBox(width: 20.0,)
            ],),
          )        
        ],
      ),
    );
  }

  _playlistCard(){
    return Container(
      padding: EdgeInsets.all(15.0),
      height: SizeConfig.blockSizeVertical * 35,
      width: SizeConfig.blockSizeHorizontal * 13,
      decoration: BoxDecoration(
        color: Color.fromRGBO(110, 110, 110, 1.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: SizeConfig.blockSizeVertical * 20,
            width: SizeConfig.blockSizeHorizontal * 10,
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

_lateralMenu(){

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _spotifyLogo(),
        SizedBox(height: 20.0,),
        _pageSelector(),
        SizedBox(height: 20.0,),
        _playlists(),
      ]
    );
}

_spotifyLogo(){
    return Container(
      height: SizeConfig.blockSizeVertical * 9,
      width: SizeConfig.blockSizeHorizontal * 15,
      decoration: BoxDecoration(
        color: Color.fromRGBO(75, 75, 75, 1.0),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Center(child: Text('Spotify Logo', style: TextStyle(color: Colors.white),))
    );
}

_pageSelector(){
    return Container(
      height: SizeConfig.blockSizeVertical * 20,
      width: SizeConfig.blockSizeHorizontal * 15,
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

_playlists(){
    return Container(
      height: SizeConfig.blockSizeVertical * 40,
      width: SizeConfig.blockSizeHorizontal * 15,
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

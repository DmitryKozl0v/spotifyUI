import 'package:flutter/material.dart';

import 'package:flutter_web_app/customNavBar.dart';
import 'package:flutter_web_app/size_config.dart';


class LandscapeHomePage extends StatefulWidget {
  @override
  _LandscapeHomePageState createState() => _LandscapeHomePageState();
}

class _LandscapeHomePageState extends State<LandscapeHomePage> {

  int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
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
      color: Color.fromRGBO(22, 22, 22, 1.0),
      height: double.infinity,
      width: SizeConfig.blockSizeHorizontal * 82,
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _header(),
                _suggestionLists()
              ],
            ),
          ),
          _topBar()
        ],
      )
    );
}

Widget _topBar(){
  return Container(
    height: SizeConfig.blockSizeVertical * 9,
    width: SizeConfig.blockSizeHorizontal * 82,
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    color: Colors.transparent,
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

Widget _header(){

  return Container(     
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 0.9],
        colors: [Color.fromRGBO(220, 100, 92, 0.5), Color.fromRGBO(22, 22, 22, 1.0)],
      )
    ),
    height: SizeConfig.blockSizeVertical * 50,
    width: SizeConfig.blockSizeHorizontal * 82,
    child: Container(
      width: SizeConfig.blockSizeHorizontal * 60,
      padding: EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
      child: _latestReproduced()
    ),
  );
}

Widget _latestReproduced(){

  TextStyle _titleStyle = TextStyle(
    fontSize: SizeConfig.blockSizeHorizontal * 2.3,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Greeting', style: _titleStyle,),
      SizedBox(height: 25.0,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        _albumCard(),
        _albumCard(),
        _albumCard(),
      ],),
      SizedBox(height: 15.0,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        _albumCard(),
        _albumCard(),
        _albumCard(),
      ],)
    ],
  ); 
}

Widget _albumCard(){

  TextStyle _albumName = TextStyle(
    fontSize: SizeConfig.blockSizeHorizontal * 1.2,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  return Material(
    color: Colors.transparent,
    child: InkWell(
      hoverColor: Colors.white.withOpacity(0.03),
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(5.0)
        ),
        height: SizeConfig.blockSizeVertical * 12,
        width: SizeConfig.blockSizeHorizontal * 24,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(2, 0),
                    spreadRadius: 5.0,
                    blurRadius: 5.0,
                    color: Colors.black12
                  )
                ]
              ),
              height: SizeConfig.blockSizeVertical * 12,
              width: SizeConfig.blockSizeHorizontal * 6,
              child: Center(child: Text('Album cover', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)),
            ),
            SizedBox(width: 20.0,),
            Text('Album name', style: _albumName,),
          ],
        ),
      ),
    ),
  );
}

Widget _topNavigationButtons(){
  return Container(
    
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(15, 15, 15, 0.6),
            border: Border.all(color: Color.fromRGBO(15, 15, 15, 0.6)),
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
            color: Color.fromRGBO(15, 15, 15, 0.6),
            border: Border.all(color: Color.fromRGBO(15, 15, 15, 0.6)),
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

Widget _profileButtons(){

  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(100.0),
      hoverColor: Colors.white54,
      onTap: (){},
      child: Container(
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
      ),
    ),
  );
}

Widget _suggestionLists(){
  return Container(
    width: SizeConfig.blockSizeHorizontal * 80,
    child: Column(
      children: <Widget>[
        _listOfSuggestions(),
        SizedBox(height: 20.0,),
        _listOfSuggestions(),
        SizedBox(height: 20.0,),
        _listOfSuggestions(),
        SizedBox(height: 20.0,),
        _listOfSuggestions(),
      ],
    )
  );
}

Widget _listOfSuggestions(){

  TextStyle _suggestionsTextStyle = TextStyle(
    fontSize: SizeConfig.blockSizeHorizontal * 1.8,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  TextStyle _seeMoreTextStyle = TextStyle(
    fontSize: SizeConfig.blockSizeHorizontal * 1,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
    height: SizeConfig.blockSizeVertical * 60,
    width: SizeConfig.blockSizeHorizontal * 80,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(children: <Widget>[
          Text('Title', style: _suggestionsTextStyle,),
          Expanded(child: Container()),
          Text('SEE MORE', style: _seeMoreTextStyle,)
        ],),
        SizedBox(height: 10.0,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
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

Widget _playlistCard(){

  TextStyle _playlistTitleTextStyle = TextStyle(
    fontSize: SizeConfig.blockSizeHorizontal * 1.2,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  TextStyle _playlistArtistTextStyle = TextStyle(
    fontSize: SizeConfig.blockSizeHorizontal * 1.1,
    color: Colors.grey,
  );

  return Material(
    color: Colors.transparent,
    child: InkWell(
      hoverColor: Colors.white.withOpacity(0.03),
      onTap: (){},
      child: Container(
        padding: EdgeInsets.all(15.0),
        height: SizeConfig.blockSizeVertical * 46,
        width: SizeConfig.blockSizeHorizontal * 18,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: SizeConfig.blockSizeVertical * 30,
              width: SizeConfig.blockSizeHorizontal * 20,
              decoration: BoxDecoration(
                color: Color.fromRGBO(130, 130, 130, 1.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 5.0,
                    blurRadius: 5.0,
                    offset: Offset(0, 0)
                  )
                ]
              ),
            ),
            SizedBox(height: 15.0,),
            Text('Album title', style: _playlistTitleTextStyle,),
            SizedBox(height: 5.0,),
            Text('Artist', style: _playlistArtistTextStyle,)
          ],
        ),
      ),
    ),
  );
}

Widget _lateralMenu(){

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      _spotifyLogo(),
      SizedBox(height: 20.0,),
      // _pageSelector(),
      PageSelector(),
      SizedBox(height: 20.0,),
      _playlists(),
    ]
  );
}

Widget _spotifyLogo(){
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      padding: EdgeInsets.only(left: 20.0),
      height: SizeConfig.blockSizeVertical * 9,
      width: SizeConfig.blockSizeHorizontal * 15,
      decoration: BoxDecoration(
        // color: Color.fromRGBO(75, 75, 75, 1.0),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Image.asset(
        'assets/img//Sputify_Logo_small.png',
        fit: BoxFit.contain,
      )
    ),
  );
}

class PageSelector extends StatefulWidget {
  @override
  _PageSelectorState createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {

  int tappedIndex;

  TextStyle _selectorTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: SizeConfig.blockSizeHorizontal * 1.2,
  );

  TextStyle _selectedTextStyle = TextStyle(
    color: Colors.white,
    fontSize: SizeConfig.blockSizeHorizontal * 1.2,
  );

  List _selectorContent = [
    {'name': 'Home', 'icon': Icons.home},
    {'name': 'Search', 'icon': Icons.search},
    {'name': 'Your Library', 'icon': Icons.menu_book}
  ];

  @override
  void initState() {
    super.initState();
    tappedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5.0),
          child: InkWell(
            onTap: (){},
            borderRadius: BorderRadius.circular(5.0),
            hoverColor: tappedIndex == index ? Colors.transparent : Colors.white24,
            child: Container(
              height: SizeConfig.blockSizeVertical * 7,
              width: SizeConfig.blockSizeHorizontal * 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: tappedIndex == index ? Colors.white12 : Colors.transparent,
              ),
              child: ListTile(
                title: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    children: [
                      Icon(_selectorContent[index]['icon'], color: Colors.grey, size: 24,),
                      SizedBox(width: 20.0),
                      Text(_selectorContent[index]['name'], style: tappedIndex == index ? _selectedTextStyle : _selectorTextStyle),
                    ],
                  ),
                ),
                onTap:(){
                  setState((){
                    tappedIndex = index;
                  });
                }
              )
            ),
          ),
        );
      }
    ); 
  }
}

// Widget _pageSelector(){

//   return Container(
//     height: SizeConfig.blockSizeVertical * 22,
//     width: SizeConfig.blockSizeHorizontal * 15,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10.0)
//     ),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         _selectorCard('Home', Icons.home),
//         _selectorCard('Search', Icons.search),
//         _selectorCard('Your Library', Icons.menu_book),
//       ]
//     ),
//   );
// }

// ignore: unused_element
Widget _selectorCard(String name, IconData icon){

  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(5.0),
      hoverColor: Colors.white24,
      focusColor: Colors.white24,
      onTap: (){

      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        height: SizeConfig.blockSizeVertical * 6.7,
        width: SizeConfig.blockSizeHorizontal * 15,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10.0),
            Icon(icon, color: Colors.grey, size: 24,),
            SizedBox(width: 20.0),
            Text(name, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    ),
  );
}

Widget _playlists(){
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

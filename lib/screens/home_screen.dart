import 'package:LiteChat/generated/l10n.dart';
import 'package:LiteChat/widgets/category_selector.dart';
import 'package:LiteChat/widgets/favourites.dart';
import 'package:LiteChat/widgets/recent_chats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //UI constants!
  static final double titleFontSize = 28.0;

  //Icon sizes
  static final double tabIconSize = 30.0;
  static final double searchIconSize = 30.0;

  //Radius
  static final double listBorderRadius = 30.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.menu),
            iconSize: tabIconSize,
            color: Colors.white,
            onPressed: () {}),
        title: Text(S.of(context).home_screen_title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: titleFontSize, fontWeight: FontWeight.bold)),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              iconSize: searchIconSize,
              color: Colors.white,
              onPressed: () {})
        ],
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(listBorderRadius),
                        topRight: Radius.circular(listBorderRadius))),
                child: Column(
                  children: <Widget>[FavouritesWidget(), RecentChats()],
                )),
          )
        ],
      ),
    );
  }
}

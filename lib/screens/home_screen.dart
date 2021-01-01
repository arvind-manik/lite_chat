import 'package:LiteChat/constants.dart';
import 'package:LiteChat/generated/l10n.dart';
import 'package:LiteChat/widgets/category_selector.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.menu),
            iconSize: LiteChatConstants.tabIconSize,
            color: Colors.white,
            onPressed: () {}),
        title: Text(S.of(context).home_screen_title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: LiteChatConstants.scaffoldTitleFontSize,
                fontWeight: FontWeight.bold)),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              iconSize: LiteChatConstants.searchIconSize,
              color: Colors.white,
              onPressed: () {})
        ],
      ),
      body: Column(
        children: <Widget>[CategorySelector()],
      ),
    );
  }
}

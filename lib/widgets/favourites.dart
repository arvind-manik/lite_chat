import 'package:LiteChat/constants.dart';
import 'package:LiteChat/generated/l10n.dart';
import 'package:LiteChat/models/message_model.dart';
import 'package:LiteChat/models/user_model.dart';
import 'package:LiteChat/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouritesWidget extends StatelessWidget {
  //UI constants!
  static final double letterSpacing = 1.0;

  static final double moreIconFontSize = 30.0;
  static final double nameFontSize = 16.0;

  static const double horizontalPadding = 20.0;
  static const double verticalPadding = 10.0;
  static const double eachItemImagePadding = 10.0;
  static const double eachItemLeftPadding = 10.0;

  static final double userListRowHeight = 120.0;
  static final double textSeparatorHeight = 6.0;

  static final double circleAvatarRadius = 35.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: verticalPadding),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(S.of(context).favourites,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: LiteChatConstants.subCategoryFontSize,
                        fontWeight: FontWeight.bold,
                        letterSpacing: letterSpacing)),
                IconButton(
                    icon: Icon(Icons.more_horiz),
                    iconSize: moreIconFontSize,
                    color: Colors.blueGrey,
                    onPressed: () {})
              ],
            ),
          ),
          Container(
              height: userListRowHeight,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                      horizontal: eachItemLeftPadding),
                  itemCount: favorites.length,
                  itemBuilder: (BuildContext context, int index) {
                    User favourite = favorites[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ChatScreen(favourite))),
                      child: Padding(
                        padding: const EdgeInsets.all(eachItemImagePadding),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              radius: circleAvatarRadius,
                              backgroundImage: AssetImage(favourite.imageUrl),
                            ),
                            SizedBox(height: textSeparatorHeight),
                            Text(favourite.name,
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: nameFontSize,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

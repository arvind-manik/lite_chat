import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiteChatConstants {
  //Font sizes
  static final double titleFontSize = 28.0;
  static final double subCategoryFontSize = 18.0;

  //Border radius
  static final BorderRadius listBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0));

  //Scroll physics
  static final ScrollPhysics bouncyScrollPhysics =
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());

  //Colors
  static final Color primaryColor = Colors.red;
  static final Color accentColor = Color(0xFFFEF9EB);
  static final Color unreadChatColor = Color(0xFFFFEFEE);

  static final Color otherSenderMessageColor = Color(0xFFFFEFEE);
  static final Color currentSenderMessageColor = Color(0xFFFEF9EB);
}

enum LiteChatTabs { MESSAGES, GROUPS, ONLINE, REQUESTS }

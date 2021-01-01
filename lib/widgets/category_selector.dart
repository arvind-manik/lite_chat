import 'package:LiteChat/constants.dart';
import 'package:LiteChat/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedTabGroupIndex = 0;

  final List<LiteChatTabs> categories = [
    LiteChatTabs.MESSAGES,
    LiteChatTabs.GROUPS,
    LiteChatTabs.ONLINE,
    LiteChatTabs.REQUESTS
  ];

  //UI constants!
  static final double fontSize = 24.0;

  static final double letterSpacing = 1.2;

  static final double containerHeight = 90.0;

  static const double paddingVertical = 30.0;
  static const double paddingHorizontal = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: containerHeight,
        color: Theme.of(context).primaryColor,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            String l10nValue;
            switch (categories[index]) {
              case LiteChatTabs.MESSAGES:
                l10nValue = S.of(context).groups_0;
                break;
              case LiteChatTabs.GROUPS:
                l10nValue = S.of(context).groups_1;
                break;
              case LiteChatTabs.ONLINE:
                l10nValue = S.of(context).groups_2;
                break;
              case LiteChatTabs.REQUESTS:
                l10nValue = S.of(context).groups_3;
                break;
            }

            return GestureDetector(
              onTap: () {
                setState(() {
                  this.selectedTabGroupIndex = index;
                });
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: paddingVertical, horizontal: paddingHorizontal),
                  child: Text(l10nValue,
                      style: TextStyle(
                          color: index == this.selectedTabGroupIndex
                              ? Colors.white
                              : Colors.white60,
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          letterSpacing: letterSpacing))),
            );
          },
        ));
  }
}

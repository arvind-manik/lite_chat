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

  @override
  Widget build(BuildContext context) {
    return Container(
        height: LiteChatConstants.tabGroupChooserHeight,
        color: Colors.deepPurpleAccent,
        child: ListView.builder(
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

            return widget(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: LiteChatConstants.tabGroupPaddingVertical,
                      horizontal: LiteChatConstants.tabGroupPaddingHorizontal),
                  child: Text(l10nValue,
                      style: TextStyle(
                          color: index == this.selectedTabGroupIndex
                              ? Colors.white
                              : Colors.white60,
                          fontSize: LiteChatConstants.tabGroupFontSize,
                          fontWeight: FontWeight.bold,
                          letterSpacing:
                              LiteChatConstants.tabGroupLetterSpacing))),
            );
          },
        ));
  }
}

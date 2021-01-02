import 'package:LiteChat/constants.dart';
import 'package:LiteChat/generated/l10n.dart';
import 'package:LiteChat/models/message_model.dart';
import 'package:LiteChat/screens/chat_screen.dart';
import 'package:LiteChat/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  static final double chatImageBorderRadius = 35.0;

  static final double lastMessageFontSize = 15.0;
  static final double timeTextFontSize = 15.0;
  static final double newIconFontSize = 12.0;

  static final EdgeInsets chatMargin =
      EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0);

  static final EdgeInsets chatPadding =
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0);

  static final double imageSeparartorWidth = 10.0;
  static final double textSeparatorHeight = 5.0;
  static final double timeNewSeparatorHeight = 5.0;

  static final double newIconWidth = 40.0;
  static final double newIconHeight = 20.0;

  static final BorderRadius newIconBorderRadius = BorderRadius.circular(30.0);

  static final double recentMessageWidthFactor = 0.5;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: LiteChatConstants.listBorderRadius),
          child: ClipRRect(
            borderRadius: LiteChatConstants.listBorderRadius,
            child: ListView.builder(
              physics: LiteChatConstants.bouncyScrollPhysics,
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int index) {
                final Message lastMessage = chats[index];
                int messageTime = lastMessage.time;
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ChatScreen(lastMessage.sender))),
                  child: Container(
                    margin: chatMargin,
                    padding: chatPadding,
                    decoration: BoxDecoration(
                        color: lastMessage.unread
                            ? LiteChatConstants.unreadChatColor
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            CircleAvatar(
                              radius: chatImageBorderRadius,
                              backgroundImage:
                                  AssetImage(lastMessage.sender.imageUrl),
                            ),
                            SizedBox(width: imageSeparartorWidth),
                            Container(
                              width: MediaQuery.of(context).size.width *
                                  recentMessageWidthFactor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(lastMessage.sender.name,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: lastMessageFontSize,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis),
                                  SizedBox(height: textSeparatorHeight),
                                  Text(
                                    lastMessage.text,
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: lastMessageFontSize,
                                        fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(LiteChatUtil.getTimeOrDate(messageTime),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: timeTextFontSize,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: timeNewSeparatorHeight),
                            lastMessage.unread
                                ? Container(
                                    width: newIconWidth,
                                    height: newIconHeight,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: newIconBorderRadius),
                                    child: Text(
                                      S.of(context).new_text.toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: newIconFontSize,
                                          fontWeight: FontWeight.bold),
                                    ))
                                : Text('')
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}

import 'package:LiteChat/constants.dart';
import 'package:LiteChat/models/message_model.dart';
import 'package:LiteChat/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen(this.user);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  static final double moreIconSize = 30.0;

  static final EdgeInsets messageTopPadding = EdgeInsets.only(top: 15.0);

  static final EdgeInsets currentSenderMargin =
      EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0);
  static final EdgeInsets otherSenderMargin =
      EdgeInsets.only(top: 8.0, bottom: 8.0, right: 80.0);

  _buildMessage(Message message, bool isMe) {
    return Container(
        margin: isMe ? currentSenderMargin : otherSenderMargin,
        child: Text(message.text),
        color: isMe
            ? LiteChatConstants.currentSenderMessageColor
            : LiteChatConstants.otherSenderMessageColor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            title: Text(widget.user.name,
                style: TextStyle(
                    fontSize: LiteChatConstants.titleFontSize,
                    fontWeight: FontWeight.w500)),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.more_horiz),
                  iconSize: moreIconSize,
                  color: Colors.white,
                  onPressed: () {})
            ]),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: LiteChatConstants.listBorderRadius),
                  child: ClipRRect(
                    borderRadius: LiteChatConstants.listBorderRadius,
                    child: ListView.builder(
                        padding: messageTopPadding,
                        itemCount: messages.length,
                        itemBuilder: (BuildContext context, int index) {
                          Message message = messages[index];
                          bool isMe = message.sender.id == currentUser.id;
                          return _buildMessage(message, isMe);
                        }),
                  )),
            ),
          ],
        ));
  }
}

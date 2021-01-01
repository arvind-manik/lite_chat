import 'package:LiteChat/constants.dart';
import 'package:LiteChat/generated/l10n.dart';
import 'package:LiteChat/models/message_model.dart';
import 'package:LiteChat/models/user_model.dart';
import 'package:LiteChat/util.dart';
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

  static final EdgeInsets currentSenderMessageMargin =
      EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0);
  static final EdgeInsets otherSenderMessageMargin =
      EdgeInsets.only(top: 8.0, bottom: 8.0);

  static final EdgeInsets messagePadding =
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0);

  static final BorderRadius currentSenderMessageRadius = BorderRadius.only(
      topLeft: Radius.circular(15.0), bottomLeft: Radius.circular(15.0));
  static final BorderRadius otherSenderMessageRadius = BorderRadius.only(
      topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0));

  static final double messageLineSeparatorHeight = 8.0;

  static final double messageContainerFontSize = 16.0;

  static final double messageAreaWidthFactor = 0.75;

  static final EdgeInsets composerPadding =
      EdgeInsets.symmetric(horizontal: 8.0);
  static final double composerHeight = 70.0;
  static final double composerIconSize = 25.0;

  _buildMessage(Message message, bool isMe) {
    final Container messageContainer = Container(
        width: MediaQuery.of(context).size.width * messageAreaWidthFactor,
        margin: isMe ? currentSenderMessageMargin : otherSenderMessageMargin,
        padding: messagePadding,
        decoration: BoxDecoration(
            borderRadius:
                isMe ? currentSenderMessageRadius : otherSenderMessageRadius,
            color: isMe
                ? LiteChatConstants.currentSenderMessageColor
                : LiteChatConstants.otherSenderMessageColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LiteChatUtil.getTimeOrDate(message.time),
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: messageContainerFontSize,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: messageLineSeparatorHeight),
            Text(message.text,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: messageContainerFontSize,
                    fontWeight: FontWeight.w600))
          ],
        ));
    return isMe
        ? messageContainer
        : Row(
            children: [
              messageContainer,
              IconButton(
                  icon: Icon(
                      message.isLiked ? Icons.favorite : Icons.favorite_border),
                  iconSize: moreIconSize,
                  color: message.isLiked
                      ? Theme.of(context).primaryColor
                      : Colors.blueGrey,
                  onPressed: () {})
            ],
          );
  }

  _buildComposer() {
    return Container(
        padding: composerPadding,
        height: composerHeight,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.attach_file),
              iconSize: composerIconSize,
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
            Expanded(
                child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration.collapsed(
                  hintText: S.of(context).type_message),
            )),
            IconButton(
              icon: Icon(Icons.send),
              iconSize: composerIconSize,
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            )
          ],
        ));
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
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: LiteChatConstants.listBorderRadius),
                    child: ClipRRect(
                      borderRadius: LiteChatConstants.listBorderRadius,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          padding: messageTopPadding,
                          itemCount: messages.length,
                          reverse: true,
                          itemBuilder: (BuildContext context, int index) {
                            Message message = messages[index];
                            bool isMe = message.sender.id == currentUser.id;
                            return _buildMessage(message, isMe);
                          }),
                    )),
              ),
              _buildComposer()
            ],
          ),
        ));
  }
}

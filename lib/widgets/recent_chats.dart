import 'package:LiteChat/models/message_model.dart';
import 'package:LiteChat/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  static final double listBorderRadius = 30.0;

  static final double chatImageBorderRadius = 35.0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(listBorderRadius),
                  topRight: Radius.circular(listBorderRadius))),
          child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final Message lastMessage = chats[index];
              DateTime messageTime =
                  DateTime.fromMillisecondsSinceEpoch(lastMessage.time);
              return Row(
                children: <Widget>[
                  Row(
                    children: [
                      CircleAvatar(
                        radius: chatImageBorderRadius,
                        backgroundImage:
                            AssetImage(lastMessage.sender.imageUrl),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(lastMessage.sender.name),
                          Text(lastMessage.text)
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(LiteChatUtil.getTimeOrDate(messageTime)),
                      Text('NEW')
                    ],
                  )
                ],
              );
            },
          )),
    );
  }
}

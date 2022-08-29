// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tim_ui_kit/tim_ui_kit.dart';
import 'package:tim_ui_kit/ui/views/TIMUIKitChat/tim_uikit_chat.dart';

class TIMUIKitChatExample extends StatelessWidget {
  const TIMUIKitChatExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TIMUIKitChat(
        conversationID:
            '121405', // Please fill in here according to the actual cleaning
        conversationShowName:
            'hello 121405', // Please fill in here according to the actual cleaning
        conversationType: 1,
        messageItemBuilder: MessageItemBuilder(

          // customMessageItemBuilder: (V2TimMessage message,
          //     bool isShowJump,
          //     VoidCallback clearJump,){
          //   var customElem = message.customElem;
          // }

        ),
      ),
    );
  }
}

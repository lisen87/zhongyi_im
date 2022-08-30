// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tim_ui_kit/business_logic/view_models/tui_chat_view_model.dart';
import 'package:tim_ui_kit/data_services/services_locatar.dart';
import 'package:tim_ui_kit/tim_ui_kit.dart';
import 'package:tim_ui_kit/ui/utils/message.dart';
import 'package:tim_ui_kit/ui/views/TIMUIKitChat/TIMUIKItMessageList/TIMUIKitTongue/tim_uikit_chat_history_message_list_tongue.dart';
import 'package:tim_ui_kit/ui/views/TIMUIKitChat/tim_uikit_chat.dart';

class TIMUIKitChatExample extends StatefulWidget {

  TIMUIKitChatExample({Key? key}) : super(key: key);

  @override
  State<TIMUIKitChatExample> createState() => _TIMUIKitChatExampleState();
}

class _TIMUIKitChatExampleState extends State<TIMUIKitChatExample> {
  final TUIChatViewModel model = serviceLocator<TUIChatViewModel>();

  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return TIMUIKitChat(
      conversationID:
          '121405', // Please fill in here according to the actual cleaning
      conversationShowName:
          'hello 121405', // Please fill in here according to the actual cleaning
      conversationType: 1,
      extraTipsActionItemBuilder: (V2TimMessage message, Function() closeTooltip,[Key ? key]){
        return Container(height: 100,width: 200,color: Colors.red,);
      },
      tongueItemBuilder:(VoidCallback onClick, MessageListTongueType valueType, int unreadCount){
        return Container(height: 100,width: 100,color: Colors.green,);
      },
      topFixWidget: Container(height: 20,width: double.infinity,color: Colors.orange,),
      textFieldHintText: '请输入您要咨询的问题',
      closeTap: () async {
        print('closeTap');
        V2TimValueCallback<V2TimMessage>? data = await MessageUtils.handleMessageError(
            model.sendCustomMessage(
                data: '{"type":0}', convID: "121405", convType: ConvType.c2c),
            context);
        setState(() {
          isShow = false;
        });
      },
      morePanelConfig: MorePanelConfig(
        showFilePickAction: false,
        extraAction: [
      //     MorePanelItem(
      //         id: "voiceCall",
      //         title: imt("语音通话"),
      //         onTap: (c) {
      //           // _onFeatureTap("voiceCall", c);
      //           _goToVoiceUI();
      //         },
      //         icon: Container(
      //           height: 64,
      //           width: 64,
      //           margin: const EdgeInsets.only(bottom: 4),
      //           decoration: const BoxDecoration(
      //               color: Colors.white,
      //               borderRadius: BorderRadius.all(Radius.circular(5))),
      //           child: SvgPicture.asset(
      //             "images/voice-call.svg",
      //             package: 'tim_ui_kit',
      //             height: 64,
      //             width: 64,
      //           ),
      //         )),
        ]
      ),
      config: TIMUIKitChatConfig(
        isShowTextField: isShow,
          isAllowEmojiPanel: false,
          isAllowSoundMessage: false,
          isUseMessageReaction: false,),
      messageItemBuilder: MessageItemBuilder(

          messageRowBuilder: (V2TimMessage message,
              Widget messageWidget,
              Function onScrollToIndex,
              bool isNeedShowJumpStatus,
              VoidCallback clearJumpStatus,
              Function onScrollToIndexBegin) {
            // return null;
            return Container(
              color: Colors.red,
              padding: EdgeInsets.all(50),
              child: messageWidget,
            );
          },
        customMessageItemBuilder: (V2TimMessage message,
            bool isShowJump,
            VoidCallback clearJump,){
          var customElem = message.customElem;
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(14),
            child: Column(
              children: const [
                Text(
                  '对话已结束，请对本对话评分',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          );
        }

      ),
    );
  }
}

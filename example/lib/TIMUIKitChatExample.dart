// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tim_ui_kit/business_logic/view_models/tui_chat_view_model.dart';
import 'package:tim_ui_kit/data_services/services_locatar.dart';
import 'package:tim_ui_kit/tim_ui_kit.dart';
import 'package:tim_ui_kit/ui/views/TIMUIKitChat/TIMUIKItMessageList/TIMUIKitTongue/tim_uikit_chat_history_message_list_tongue.dart';
import 'package:tim_ui_kit/ui/views/TIMUIKitChat/tim_uikit_chat.dart';

class TIMUIKitChatExample extends StatelessWidget {
  final TUIChatViewModel model = serviceLocator<TUIChatViewModel>();
  TIMUIKitChatExample({Key? key}) : super(key: key);
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
      closeTap: (){
        print("closeTap");
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
      config: const TIMUIKitChatConfig(
          isAllowEmojiPanel: false,
          isAllowSoundMessage: false,
          isUseMessageReaction: false,),
      // messageItemBuilder: MessageItemBuilder(
      //
      //   customMessageItemBuilder: (V2TimMessage message,
      //       bool isShowJump,
      //       VoidCallback clearJump,){
      //     var customElem = message.customElem;
      //   }
      //
      // ),
    );
  }
}

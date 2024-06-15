import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/controllers/call_helper.dart';
import 'package:the_rock_mobile/models/chat_model.dart';
import 'package:the_rock_mobile/screens/app/home_page.dart';
import 'package:the_rock_mobile/utility/parse_auth_userid.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:the_rock_mobile/models/message_model.dart';
// import 'package:the_rock_mobile/components/chat_bubble.dart';

class Chat extends StatelessWidget {
  static const String namedRoute = "/chat";
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> routeData = Get.arguments;
    // final callId = parseAuthUserId("e065f7c4-7bd6-4287-9b23-2cc5fec5d9de");
    final callId = parseAuthUserId(routeData["id"]);
    final fullname = routeData["name"] ?? "";

    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final TextEditingController messageController = TextEditingController();

    void goBack() => Get.back();

    void sendMessage() {
      messageController.clear();
      print("sendMessage...");
    }

    void attachToMessage() {
      print("attach To Message...");
    }

    // void videoCall() {
    //   // print("VideoCall...");
    //   Get.to(() => const HomePage());
    // }

    // void voiceCall() {
    //   Get.to(() => const HomePage());
    //   // print("VoiceCall...");
    // }

    /// message inputFiled
    sendMessageArea() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.base_),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(AppSizes.base_),
          ),
          child: Row(
            children: <Widget>[
              //attach btn
              IconButton(
                iconSize: 25,
                color: Colors.grey,
                onPressed: attachToMessage,
                icon: Transform.rotate(
                    angle: math.pi / 4, child: const Icon(Icons.attach_file)),
              ),

              // text field
              Expanded(
                child: TextField(
                  controller: messageController,
                  autocorrect: true,
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.send,
                  decoration: const InputDecoration.collapsed(
                    hintText: 'Type your message here..',
                  ),
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),

              // send btn
              InkButton(
                onTap: sendMessage,
                height: double.infinity,
                width: 70,
                background: colorScheme.tertiary,
                // background: Colors.white,
                borderRadius: AppSizes.base_,
                borderColor: Colors.grey,
                child: SvgPicture.asset(
                  AppImages.send,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// app bar
          PurpleAppBar(
            height: appHeight * .12,
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.xs),
            child: Container(
              alignment: const Alignment(0, 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkButton(
                    onTap: goBack,
                    borderRadius: AppSizes.md,
                    background: colorScheme.background,
                    iconColor: colorScheme.primary,
                  ),

                  SizedBox(width: appWidth * 0.01),

                  Text(
                    fullname,
                    style:
                        textTheme.displayMedium!.copyWith(color: Colors.white),
                  ),

                  /// ICONS
                  Row(
                    children: [
                      sendCallButton(
                        inviteeName: fullname,
                        isVideoCall: false,
                        inviteeUsersID: callId,
                        onCallFinished: onSendCallInvitationFinished,
                        icon: ButtonIcon(
                            icon: const Icon(Icons.phone, color: Colors.white),
                            backgroundColor: Colors.transparent),
                      ),
                      sendCallButton(
                        inviteeName: fullname,
                        isVideoCall: true,
                        inviteeUsersID: callId,
                        onCallFinished: onSendCallInvitationFinished,
                        icon: ButtonIcon(
                            icon: const Icon(Icons.videocam_outlined,
                                color: Colors.white, size: 30),
                            backgroundColor: Colors.transparent),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // chat collection
          Expanded(
            flex: 9,
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.only(top: AppSizes.md),
              itemCount: chatMessages.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                  child: ChatBubble(
                    message: chatMessages[index],
                  ),
                );
              },
            ),
          ),

          sendMessageArea(),
          const SizedBox(height: AppSizes.lg)
        ],
      ),
    );
  }
}

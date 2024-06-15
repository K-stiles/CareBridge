// Package imports:
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_rock_mobile/constants/current_user.dart';
import 'package:the_rock_mobile/controllers/common.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

ZegoUIKitPrebuiltCallController? callController;

/// on user login
void onUserLogin() {
  callController ??= ZegoUIKitPrebuiltCallController();

  /// 4/5. initialized ZegoUIKitPrebuiltCallInvitationService when account is logged in or re-logged in
  ZegoUIKitPrebuiltCallInvitationService().init(
    appID: 583317779 /*input your AppID*/,
    appSign:
        "d1ee95f0ce2ff7ccc441ce1f682da710deb21be6cce01883bc930a1e44ba16cc" /*input your AppSign*/,
    userID: currentUser.id /*attach Logged in user id*/,
    userName: currentUser.name /*attach Logged in user name*/,
    androidNotificationConfig: ZegoAndroidNotificationConfig(
      channelID: "ZegoUIKit",
      channelName: "Call Notifications",
      sound: "notification",
      icon: "notification_icon",
    ),
    iOSNotificationConfig: ZegoIOSNotificationConfig(
      systemCallingIconName: 'CallKitIcon',
    ),
    plugins: [ZegoUIKitSignalingPlugin()],
    controller: callController,
    requireConfig: (ZegoCallInvitationData data) {
      final config = (data.invitees.length > 1)
          ? ZegoCallType.videoCall == data.type
              ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
              : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
          : ZegoCallType.videoCall == data.type
              ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
              : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();

      config.avatarBuilder = customAvatarBuilder;

      /// support minimizing, show minimizing button
      config.topMenuBarConfig.isVisible = true;
      config.topMenuBarConfig.buttons
          .insert(0, ZegoMenuBarButtonName.minimizingButton);

      config.onError = (ZegoUIKitError error) {
        debugPrint('onError:$error');
      };

      return config;
    },
  );
}

/// on user logout
void onUserLogout() {
  callController = null;

  /// 5/5. de-initialization ZegoUIKitPrebuiltCallInvitationService when account is logged out
  ZegoUIKitPrebuiltCallInvitationService().uninit();
}

void onSendCallInvitationFinished(
  String code,
  String message,
  List<String> errorInvitees,
) {
  if (errorInvitees.isNotEmpty) {
    String userIDs = "";
    for (int index = 0; index < errorInvitees.length; index++) {
      if (index >= 5) {
        userIDs += '... ';
        break;
      }

      var userID = errorInvitees.elementAt(index);
      userIDs += '$userID ';
    }
    if (userIDs.isNotEmpty) {
      userIDs = userIDs.substring(0, userIDs.length - 1);
    }

    var message = 'User doesn\'t exist or is offline: $userIDs';
    if (code.isNotEmpty) {
      message += ', code: $code, message:$message';
    }
    Get.snackbar(
      "code: $code",
      message,
      colorText: Colors.white,
      backgroundColor: Colors.black.withOpacity(0.4),
      duration: const Duration(seconds: 4),
      icon: const Icon(
        FluentIcons.warning_12_filled,
        color: Colors.white,
      ),
    );
  } else if (code.isNotEmpty) {
    Get.snackbar(
      "code: $code",
      'code: $code, message:$message',
      colorText: Colors.white,
      backgroundColor: Colors.black.withOpacity(0.4),
      duration: const Duration(seconds: 4),
      icon: const Icon(
        FluentIcons.warning_12_filled,
        color: Colors.white,
      ),
    );
  }
}

Widget sendCallButton({
  required inviteeName,
  required ButtonIcon icon,
  required bool isVideoCall,
  required String inviteeUsersID,
  void Function(String code, String message, List<String>)? onCallFinished,
}) {
  return ZegoSendCallInvitationButton(
    isVideoCall: isVideoCall,
    invitees: getInvitesFromTextCtrl(inviteeUsersID, inviteeName),
    icon: icon,
    resourceID: "zego_data",
    padding: EdgeInsets.zero,
    margin: EdgeInsets.zero,
    iconSize: const Size(40, 40),
    buttonSize: const Size(50, 50),
    onPressed: onCallFinished,
  );
}

List<ZegoUIKitUser> getInvitesFromTextCtrl(
    String textCtrlText, String inviteeName) {
  List<ZegoUIKitUser> invitees = [];

  var inviteeIDs = textCtrlText.trim().replaceAll(',', '');
  inviteeIDs.split(",").forEach((inviteeUserID) {
    if (inviteeUserID.isEmpty) {
      return;
    }

    invitees.add(ZegoUIKitUser(
      id: inviteeUserID,
      name: inviteeName != "" ? inviteeName : 'user_$inviteeUserID',
    ));
  });

  return invitees;
}

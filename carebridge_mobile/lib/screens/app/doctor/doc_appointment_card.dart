import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/controllers/call_helper.dart';
import 'package:the_rock_mobile/models/response/appointment_model.dart';
import 'package:the_rock_mobile/screens/app/patient/chat.dart';
import 'package:the_rock_mobile/utility/capitalizewords_and_split.dart';
import 'package:the_rock_mobile/utility/parse_auth_userid.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class DocAppointmentCard extends StatelessWidget {
  final Appointment card;

  const DocAppointmentCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    /// DATETIME FORMATTER
    String scheduledDate =
        DateFormat('EEEE, MMM d, y', 'en_US').format(card.scheduledDate);
    // String scheduledDate =
    //     DateFormat('EEEE, MMMM d, y', 'en_US').format(card.scheduledDate);

    void onChatTap() {
      Get.to(() => const Chat(), arguments: {
        "id": parseAuthUserId(card.patientId),
        "name": card.patient.fullname,
      });
    }

    return Container(
      padding: const EdgeInsets.all(AppSizes.sm),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.base_),
          border: Border.all(
            width: 1,
            color: colorScheme.primary.withOpacity(0.3),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          // left
          Row(
            children: [
              //doc info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card.patient.fullname.toUpperCase(),
                    style: textTheme.displaySmall!
                        .copyWith(color: Colors.grey.shade800),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    capitalizeWordsAndSplit(card.medium),
                    style: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    scheduledDate,
                    style: textTheme.bodySmall!.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              )
            ],
          ),

          //right side with Buttons
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /// CHAT
              CallCardBtn(
                onTap: onChatTap,
                background:
                    card.medium == "CHAT" ? Colors.green : Colors.transparent,
                icon: Icon(
                  Icons.chat_outlined,
                  color: card.medium == "CHAT"
                      ? Colors.white
                      : Colors.grey.shade500,
                  size: 25,
                ),
              ),
              const SizedBox(width: AppSizes.base_),

              /// PHONE CALL
              sendCallButton(
                inviteeName: card.patient.fullname,
                isVideoCall: false,
                inviteeUsersID: parseAuthUserId(card.patientId),
                onCallFinished: onSendCallInvitationFinished,
                icon: ButtonIcon(
                  icon: Icon(
                    Icons.phone_in_talk_outlined,
                    color: card.medium == "VOICE_CALL"
                        ? Colors.white
                        : Colors.grey.shade500,
                  ),
                  backgroundColor: card.medium == "VOICE_CALL"
                      ? Colors.green
                      : Colors.transparent,
                ),
              ),
              const SizedBox(width: AppSizes.base_),

              /// VIDEO CALL
              sendCallButton(
                inviteeName: card.patient.fullname,
                isVideoCall: true,
                inviteeUsersID: parseAuthUserId(card.patientId),
                onCallFinished: onSendCallInvitationFinished,
                icon: ButtonIcon(
                  icon: Icon(
                    Icons.video_camera_back_outlined,
                    color: card.medium == "VIDEO_CALL"
                        ? Colors.white
                        : Colors.grey.shade500,
                  ),
                  backgroundColor: card.medium == "VIDEO_CALL"
                      ? Colors.green
                      : Colors.transparent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

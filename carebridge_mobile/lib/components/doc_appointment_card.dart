// import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';
// import 'package:intl/intl.dart';
// import 'package:the_rock_mobile/constants/app_sizes.dart';
// import 'package:the_rock_mobile/controllers/call_helper.dart';
// import 'package:the_rock_mobile/models/response/appointment_model.dart';
// import 'package:the_rock_mobile/screens/app/patient/chat.dart';
// import 'package:the_rock_mobile/utility/capitalizewords_and_split.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// // import 'package:the_rock_mobile/models/appointment_model.dart';
// // import 'package:the_rock_mobile/screens/app/chat.dart';
// // import 'package:the_rock_mobile/util/capitalizewords_and_split.dart';
// // import 'package:the_rock_mobile/screens/app/video_call.dart';
// // import 'package:the_rock_mobile/screens/app/voice_call.dart';

// // import '../models/call_card_model.dart';
// import 'call_card_btn.dart';

// class DocAppointmentCard extends StatelessWidget {
//   final Appointment card;
//   // final AppointmentCardData card;
//   // final void Function()? onTap;

//   const DocAppointmentCard({super.key, required this.card});

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     // final colorScheme = Theme.of(context).colorScheme;

//     // List<String> words = inputString.split('_');

//     /// DATETIME FORMATTER
//     String scheduledDate =
//         DateFormat('EEEE, MMMM d, y', 'en_US').format(card.scheduledDate);

//     void onChatTap() {
//       Get.to(() => const Chat(), arguments: {
//         "name": card.patient.fullname,
//       });
//     }

//     void onPhoneTap() {}

//     void onVideoTap() {}
//     // void onPhoneTap() => Navigator.pushNamed(context, VoiceCall.namedRoute);
//     // void onVideoTap() =>
//     //     Navigator.pushNamed(context, VideoCallScreen.namedRoute);

//     return Container(
//       padding: const EdgeInsets.all(AppSizes.sm),
//       decoration: BoxDecoration(
//           // color: colorScheme.background,
//           borderRadius: BorderRadius.circular(AppSizes.base_),
//           border: Border.all(width: 1, color: Colors.grey.shade500)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // left
//           Row(
//             children: [
//               //doc info
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     card.patient.fullname,
//                     style: textTheme.displaySmall!
//                         .copyWith(color: Colors.grey.shade800),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     capitalizeWordsAndSplit(card.medium),
//                     style: textTheme.bodyMedium!
//                         .copyWith(color: Colors.grey.shade500),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     scheduledDate,
//                     style: textTheme.bodyMedium!
//                         .copyWith(color: Colors.grey.shade500),
//                   ),
//                 ],
//               )
//             ],
//           ),

//           //right side
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               /// CHAT
//               CallCardBtn(
//                 onTap: onChatTap,
//                 background:
//                     card.medium == "CHAT" ? Colors.green : Colors.transparent,
//                 icon: Icon(
//                   Icons.chat_outlined,
//                   color: card.medium == "CHAT"
//                       ? Colors.white
//                       : Colors.grey.shade600,
//                 ),
//               ),
//               const SizedBox(width: AppSizes.base_),

//               /// PHONE CALL
//               sendCallButton(
//                 isVideoCall: false,
//                 inviteeUsersID: "callId",
//                 onCallFinished: onSendCallInvitationFinished,
//                 icon: ButtonIcon(
//                   icon: Icon(
//                     Icons.phone_in_talk_outlined,
//                     color: card.medium == "VOICE_CALL"
//                         ? Colors.white
//                         : Colors.grey.shade500,
//                   ),
//                   backgroundColor: card.medium == "VOICE_CALL"
//                       ? Colors.green
//                       : Colors.transparent,
//                 ),
//               ),

//               const SizedBox(width: AppSizes.base_),

//               /// VIDEO CALL
//               sendCallButton(
//                 isVideoCall: true,
//                 inviteeUsersID: "callId",
//                 onCallFinished: onSendCallInvitationFinished,
//                 icon: ButtonIcon(
//                   icon: Icon(
//                     Icons.video_camera_back_outlined,
//                     color: card.medium == "VIDEO_CALL"
//                         ? Colors.white
//                         : Colors.grey.shade500,
//                   ),
//                   backgroundColor: card.medium == "VIDEO_CALL"
//                       ? Colors.green
//                       : Colors.transparent,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

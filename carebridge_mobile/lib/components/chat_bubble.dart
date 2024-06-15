import 'package:flutter/material.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/chat_model.dart';
// import 'package:the_rock_mobile/models/message_model.dart';

class ChatBubble extends StatelessWidget {
  final Message message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    // final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;

    final CrossAxisAlignment alignment =
        message.iamSender ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final double radiusTopRight = message.iamSender ? 0.0 : AppSizes.md;
    final double radiusTopLeft = message.iamSender ? AppSizes.md : 0.0;
    final double marginRight = message.iamSender ? 0.0 : appWidth * .1;
    final double marginLeft = message.iamSender ? appWidth * .1 : 0.0;

    final Color background = message.iamSender
        ? colorScheme.primary
        : colorScheme.primary.withOpacity(0.2);
    final Color msgColor =
        message.iamSender ? Colors.white : Colors.grey.shade800;
    final Color timeColor =
        message.iamSender ? Colors.grey.shade400 : Colors.grey.shade600;

    return Container(
        margin: EdgeInsets.only(
          top: AppSizes.sm,
          bottom: AppSizes.sm,
          right: marginRight,
          left: marginLeft,
        ),
        child: Column(
          crossAxisAlignment: alignment,
          children: <Widget>[
            /// name and time
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(message.sender, style: textTheme.bodySmall),
              ],
            ),

            const SizedBox(height: AppSizes.base_),

            /// msg bubble
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.base_),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.sm, vertical: AppSizes.md),
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(AppSizes.md),
                    bottomRight: const Radius.circular(AppSizes.md),
                    topRight: Radius.circular(radiusTopRight),
                    topLeft: Radius.circular(radiusTopLeft),
                  ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.4),
                  //     spreadRadius: 0.5,
                  //     blurRadius: 15,
                  //
                  // ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      message.message,
                      style: textTheme.bodyMedium!.copyWith(color: msgColor),
                    ),
                    const SizedBox(height: AppSizes.xs),
                    Text(
                      message.time,
                      style: textTheme.bodySmall!
                          .copyWith(fontSize: 12, color: timeColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:the_rock_mobile/models/chat_model.dart';
import '../constants/app_sizes.dart';

class ChatCard extends StatelessWidget {
  final ChatModel chat;
  final void Function()? onTap;

  const ChatCard({super.key, required this.onTap, required this.chat});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSizes.sm),
          decoration: BoxDecoration(
            // color: Colors.amber,
            borderRadius: BorderRadius.circular(AppSizes.sm),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                child: ClipOval(
                  child: Image.network(
                    chat.image,
                    width: AppSizes.xxl * 3,
                    height: AppSizes.xxxl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.base_),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          chat.patientName,
                          style: textTheme.displayMedium!
                              .copyWith(color: Colors.grey.shade800),
                        ),
                        Text(
                          chat.time,
                          style: textTheme.bodySmall!
                              .copyWith(color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.xs),
                    Text(
                      chat.message,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: textTheme.bodySmall!
                          .copyWith(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

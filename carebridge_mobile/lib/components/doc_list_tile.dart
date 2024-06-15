import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/doctor_model.dart';

class DocListTile extends StatelessWidget {
  final Doctor doctor;
  final void Function()? onTap;
  const DocListTile({super.key, required this.onTap, required this.doctor});

  @override
  Widget build(BuildContext context) {
    // final patientProvider = Provider.of<DoctorProvider>(context);

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 90,
        padding: const EdgeInsets.all(AppSizes.sm),
        decoration: BoxDecoration(
            color: colorScheme.background,
            // color: Colors.amber,
            borderRadius: BorderRadius.circular(AppSizes.sm)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // left
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: doctor.profile == ""
                        ? SvgPicture.asset(
                            AppImages.client,
                            fit: BoxFit.cover,
                            width: AppSizes.xxl * 3,
                            height: AppSizes.xxxl,
                            color: colorScheme.primary,
                          )
                        : Image.network(
                            doctor.profile,
                            width: AppSizes.xxl * 3,
                            height: AppSizes.xxxl,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),

                const SizedBox(width: 15),

                //doc info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. ${doctor.fullname}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "⭐️ 4.5 (34.0 reviews)",
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Psychotherapist",
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    ),
                  ],
                )
              ],
            ),

            //right side
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                doctor.fullname != ""
                    ? const DocStatus(online: true)
                    : const DocStatus(online: false),
                Text(
                  doctor.fullname != "" ? "online    " : "offline ",
                  style: textTheme.bodySmall!.copyWith(
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

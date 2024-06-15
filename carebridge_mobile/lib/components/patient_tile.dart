import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/response/patient_model.dart';

class PatientTile extends StatelessWidget {
  final PatientModel patient;
  final void Function()? onTap;
  const PatientTile({super.key, required this.onTap, required this.patient});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSizes.sm),
        decoration: BoxDecoration(
            color: colorScheme.background,
            borderRadius: BorderRadius.circular(AppSizes.sm)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // left
            Row(
              children: [
                /// IMAGE
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade300,
                  child: ClipOval(
                      child: patient.profile != ""
                          ? Image.network(
                              patient.profile,
                              width: AppSizes.xxl * 3,
                              height: AppSizes.xxxl,
                              fit: BoxFit.cover,
                            )
                          : SvgPicture.asset(
                              AppImages.client,
                              fit: BoxFit.cover,
                              width: AppSizes.xxl * 3,
                              height: AppSizes.xxxl,
                              color: colorScheme.primary,
                            )),
                ),

                const SizedBox(width: 15),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// FULL NAME
                    Text(
                      patient.fullname,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    const SizedBox(height: 5),

                    /// EMAIL
                    Text(
                      patient.email,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

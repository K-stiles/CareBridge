import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/doctor_model.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final void Function()? onTap;

  const DoctorCard({super.key, required this.onTap, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 250,
        width: appWidth * .45,
        decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: BorderRadius.circular(AppSizes.xs),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSizes.xs),
                topRight: Radius.circular(AppSizes.xs),
              ),
              child: doctor.profile == ""
                  ? Center(
                      child: Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: SvgPicture.asset(
                          AppImages.practitioner,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          color: colorScheme.primary,
                        ),
                      ),
                    )
                  : Image.network(
                      doctor.profile,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            Padding(
              padding: doctor.profile == ""
                  ? const EdgeInsets.symmetric(horizontal: 10, vertical: 20)
                  : const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// doc name
                  Text(
                    "Dr. ${doctor.fullname}",
                    style: textTheme.displayMedium,
                  ),
                  const SizedBox(height: 8),

                  /// specialization
                  Text(
                    doctor.qualification ?? "specialization not specified",
                    style: textTheme.bodySmall,
                  ),

                  const SizedBox(height: 8),

                  /// display Doctor Service
                  Text(
                    doctor.qualification ?? "no assigned service",
                    style: textTheme.bodySmall,
                  ),

                  const SizedBox(height: 8),

                  /// ratings and reviews
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: AppSizes.md,
                      ),
                      const SizedBox(width: AppSizes.xs),
                      Text("4.6 (no review yet)", style: textTheme.bodySmall),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:the_rock_mobile/components/app_bar.dart';
import 'package:the_rock_mobile/components/doc_list_tile.dart';
import 'package:the_rock_mobile/components/ink_button.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/doctor_model.dart';
import 'package:the_rock_mobile/services/doctor/doctor_service.dart';
// import 'package:the_rock_mobile/providers/doctor_provider.dart';
// import 'package:the_rock_mobile/services/doctor_service.dart';

// import '../../models/doctor_model.dart';
import 'doctor_info.dart';

class FavoriteDoctors extends StatelessWidget {
  static const String namedRoute = "/favorite-doctors";

  const FavoriteDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final navigator = Navigator.of(context);

    void gotoDocInfo(int id, Doctor doctor) {
      navigator.pushNamed(
        DoctorInfo.namedRoute,
        arguments: {
          "name": doctor.fullname,
          "image": doctor.profile,
          "about": doctor.email,
        },
      );
    }

    void goBack() => Navigator.pop(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// app bar

          PurpleAppBar(
            height: appHeight * .18,
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.xs),
            child: Container(
              alignment: const Alignment(0, 0.5),
              child: Row(
                children: [
                  InkButton(
                    onTap: goBack,
                    borderRadius: AppSizes.md,
                    background: colorScheme.background,
                    iconColor: colorScheme.primary,
                  ),

                  SizedBox(width: appWidth * 0.2),

                  // title
                  Text(
                    "Favorite Doctors",
                    style:
                        textTheme.displayMedium!.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          // Consumer<DoctorProvider>(builder: (context, value, child) {
          //   final List<Doctor> doctors = value.doctors;
          //   return Expanded(
          //     child: ListView.separated(
          //       padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
          //       scrollDirection: Axis.vertical,
          //       itemCount: doctors.length,
          //       shrinkWrap: true,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Padding(
          //           padding:
          //               const EdgeInsets.symmetric(horizontal: AppSizes.md),
          //           child: DocListTile(
          //               doctor: doctors[index],
          //               onTap: () => gotoDocInfo(index)),
          //         );
          //       },
          //       separatorBuilder: (BuildContext context, int index) {
          //         return const SizedBox(height: AppSizes.sm);
          //       },
          //     ),
          //   );
          // }),

          Expanded(
            child: FutureBuilder<List<Doctor>>(
              future: DoctorService().fecthDoctors(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text("loading..."),
                  );
                } else if (snapshot.hasData) {
                  List<Doctor> doctors = snapshot.data!;

                  // _doctors.addAll(doctors);
                  // _temporaryList = _doctors;

                  return ListView.separated(
                    padding: const EdgeInsets.only(top: AppSizes.md),
                    scrollDirection: Axis.vertical,
                    itemCount: doctors.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      final Doctor doctor = doctors[index];
                      return Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: AppSizes.md),
                        child: DocListTile(
                            doctor: doctor,
                            onTap: () => gotoDocInfo(index, doctor)),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: AppSizes.base_);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        Text(
                          "Error fetching doctors...",
                          style: TextStyle(color: Colors.grey.shade800),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Please check your internet",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 15),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text("Something went wrong...!"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:the_rock_mobile/components/app_bar.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/doctor_model.dart';
import 'package:the_rock_mobile/models/learn_model.dart';
import 'package:the_rock_mobile/providers/exports.dart';
import 'package:the_rock_mobile/screens/app/patient/appointment_booking.dart';
import 'package:the_rock_mobile/screens/app/patient/doctor_info.dart';
import 'package:the_rock_mobile/screens/app/patient/learn_details.dart';
import 'package:the_rock_mobile/screens/app/patient/notify.dart';
import 'package:the_rock_mobile/screens/app/patient/profile_patient.dart';
import 'package:the_rock_mobile/screens/app/patient/top_doctors.dart';
import 'package:the_rock_mobile/services/doctor/doctor_service.dart';
import 'package:the_rock_mobile/utility/extract_firstname.dart';

class Home extends StatefulWidget {
  static const String namedRoute = "/home";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProfileNotifier>(context, listen: false).getPatientProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final patientData = Provider.of<ProfileNotifier>(context).patientProfile;

    final List<String> chips = [
      "Maternity",
      "Nutrition",
      "OPD",
      "Gynaecology",
      "Nutritionist",
      "Dietitian",
      "others"
    ];

    final appHeight = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    void gotoNotification() {
      Get.to(() => const Notify());
    }

    void gotoProfile() {
      Get.to(() => const PatientProfile());
    }

    void bookAppointment() {
      Get.to(() => const BookAppointment());
    }

    void chipbuttonTap(int index) {
      Get.to(() => const BookAppointment());
    }

    void seeAllTopDocs() {
      Get.to(() => const TopDoctors());
    }

    void gotoDoc(int index, Doctor doctor) {
      Get.to(
        () => const DoctorInfo(),
        arguments: {
          "id": doctor.id,
          "name": doctor.fullname,
          "image": doctor.profile,
          "about": doctor.email,
        },
      );
    }

    void gotoLearn(int index) {
      Get.to(
        () => const LearnDetails(),
        arguments: {
          "title": learnData[index].title,
          "message": learnData[index].message,
          "date": learnData[index].date,
          "image": learnData[index].image,
          "readtime": learnData[index].readtime,
        },
      );
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /// app bar
          SizedBox(
            height: appHeight * .30,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.topStart,
              children: [
                PurpleAppBar(
                    showTitle: true,
                    height: appHeight * .26,
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSizes.xs),

                    ///Bar content
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 30.0, right: 30, top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          //user info
                          Row(
                            children: <Widget>[
                              // user profile
                              Consumer<ImageUploaderNotifier>(
                                  builder: (context, imageUploader, child) {
                                return GestureDetector(
                                  onTap: gotoProfile,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: ClipOval(
                                        child: imageUploader.image != null
                                            ? Image.file(imageUploader.image!,
                                                height: AppSizes.xxl * 3,
                                                width: AppSizes.xxl * 3,
                                                fit: BoxFit.cover)
                                            : SvgPicture.asset(
                                                AppImages.client,
                                                fit: BoxFit.cover,
                                                width: AppSizes.xxl * 3,
                                                height: AppSizes.xxxl,
                                                color: colorScheme.primary,
                                              )),
                                  ),
                                );
                              }),

                              const SizedBox(width: 10),

                              //username 4
                              Consumer<ProfileNotifier>(
                                  builder: (context, profileNotifier, child) {
                                if (profileNotifier.processing == true) {
                                  return const Text(
                                    "Loading...",
                                    style: TextStyle(color: Colors.white),
                                  );
                                }

                                var patientData =
                                    profileNotifier.patientProfile;
                                final firstname =
                                    extractFirstName(patientData!.fullname);
                                return Text(
                                  "Hello $firstname,",
                                  style: textTheme.displayLarge!.copyWith(
                                    color: Colors.white,
                                  ),
                                );
                              }),
                            ],
                          ),

                          //bell
                          IconButton(
                            onPressed: gotoNotification,
                            icon: const Icon(
                              Icons.notifications_none_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    )),

                /// search bar
                Positioned(
                  top: appHeight * .24,
                  left: 32,
                  child: ButtonTextField(
                    onTap: seeAllTopDocs,
                    hintText: "Search doctors and services",
                  ),
                ),
              ],
            ),
          ),

          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // services
              Padding(
                padding: const EdgeInsets.all(AppSizes.md),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Our Services", style: textTheme.displayMedium),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: chips.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return ChipButton(
                            chip: chips[index],
                            onTap: () => chipbuttonTap(index),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 6);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSizes.md),

              // booking
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text("Do you need medical attention?"),
                    const SizedBox(height: AppSizes.xs),
                    ElevatedButton(
                      onPressed: bookAppointment,
                      style: ElevatedButton.styleFrom(
                        textStyle: textTheme.bodyMedium,
                        minimumSize: const Size.fromHeight(45),
                      ),
                      child: const Text("Book an appointment"),
                    )
                  ],
                ),
              ),

              const SizedBox(height: AppSizes.md),

              // Top Doctors
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                child: Column(
                  children: <Widget>[
                    // label
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Top Doctors",
                          style: textTheme.displayMedium,
                        ),
                        // see all btn
                        TextButton(
                          onPressed: seeAllTopDocs,
                          child: Text(
                            "see all",
                            style: textTheme.bodyMedium!
                                .copyWith(color: colorScheme.primary),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSizes.xs),
                    SizedBox(
                      height: 300,
                      child: FutureBuilder<List<Doctor>>(
                        future: DoctorService().fecthDoctors(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Text("loading...");
                          } else if (snapshot.hasData) {
                            List<Doctor> doctors = snapshot.data!;
                            return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: doctors.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                final Doctor doctor = doctors[index];
                                return DoctorCard(
                                  doctor: doctor,
                                  onTap: () => gotoDoc(index, doctor),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(width: AppSizes.base_);
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Column(
                              children: [
                                Text(
                                  "Error fetching doctors...",
                                  style: TextStyle(color: Colors.grey.shade800),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Please check your internet",
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 15),
                                ),
                              ],
                            );
                          } else {
                            return const Text("Something went wrong...!");
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: AppSizes.lg),

              // Learn
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //label
                    Text("Learn", style: textTheme.displayMedium),

                    const SizedBox(height: AppSizes.sm),

                    //doctorn cards
                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: learnData.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return LearnCard(
                              learn: learnData[index],
                              onTap: () {
                                gotoLearn(index);
                              });
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: AppSizes.md);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50)
            ],
          ))
        ],
      ),
    );
  }
}

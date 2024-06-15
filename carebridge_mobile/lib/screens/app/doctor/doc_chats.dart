import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/chat_model.dart';
import 'package:the_rock_mobile/providers/exports.dart';
import 'package:the_rock_mobile/screens/app/doctor/profile_doctor.dart';
import 'package:the_rock_mobile/screens/app/patient/chat.dart';
import 'package:the_rock_mobile/screens/app/patient/notify.dart';
import 'package:the_rock_mobile/utility/extract_firstname.dart';

class DocChats extends StatefulWidget {
  static const String namedRoute = "/doc-chats";

  const DocChats({super.key});

  @override
  State<DocChats> createState() => _DocChatsState();
}

class _DocChatsState extends State<DocChats> {
  List<ChatModel> _temporaryList = [];
  String query = '';

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Provider.of<ProfileNotifier>(context, listen: false).getDoctorProfile();
    // });
    _temporaryList = localChats;
  }

  void searchChat(String query) {
    final searchResult = localChats.where((chat) {
      final chatTitle = chat.patientName.toLowerCase();
      final searchLower = query.toLowerCase();
      return chatTitle.contains(searchLower);
    }).toList();

    setState(() {
      query = query;
      _temporaryList = searchResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    void gotoNotification() {
      Get.to(() => const Notify());
    }

    void gotoProfile() {
      Get.to(() => const DoctorProfile());
    }

    void gotoChats(int index) {
      Get.to(() => const Chat(), arguments: {
        "id": _temporaryList[index].id,
        "name": _temporaryList[index].patientName,
      });
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// app bar
          SizedBox(
            height: appHeight * .28,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.topStart,
              children: [
                /// APP BAR
                PurpleAppBar(
                    showTitle: true,
                    height: appHeight * .22,
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
                          ///user info
                          Row(
                            children: <Widget>[
                              /// user profile
                              Stack(
                                children: <Widget>[
                                  Consumer<ImageUploaderNotifier>(
                                      builder: (context, imageUploader, child) {
                                    return GestureDetector(
                                      onTap: gotoProfile,
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.white,
                                        child: ClipOval(
                                          child: imageUploader.image != null
                                              ? Image.file(
                                                  imageUploader.image!,
                                                  height: AppSizes.xxl * 3,
                                                  width: AppSizes.xxl * 3,
                                                  fit: BoxFit.cover,
                                                )
                                              : SvgPicture.asset(
                                                  AppImages.client,
                                                  fit: BoxFit.cover,
                                                  width: AppSizes.xxl * 3,
                                                  height: AppSizes.xxxl,
                                                  color: colorScheme.primary,
                                                ),
                                        ),
                                      ),
                                    );
                                  }),
                                  Positioned(
                                    right: 1,
                                    child: Container(
                                      height: 12,
                                      width: 12,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  )
                                ],
                              ),

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

                                var doctorData = profileNotifier.doctorProfile;
                                final firstname =
                                    extractFirstName(doctorData!.fullname);
                                return Text(
                                  "Hello Dr.$firstname,",
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
                  top: appHeight * .20,
                  left: 32,
                  child: SearchField(
                    hintText: "Search chat",
                    onChanged: (query) => searchChat(query),
                  ),
                ),
              ],
            ),
          ),

          /// message list
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: _temporaryList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                  child: ChatCard(
                    chat: _temporaryList[index],
                    onTap: () => gotoChats(index),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
                  child: Divider(height: AppSizes.md, thickness: 1),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

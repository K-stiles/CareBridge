import 'package:the_rock_mobile/constants/app_images.dart';

class Learn {
  String title;
  String message;
  String image;
  String date;
  double readtime;
  List<String> tags;

  Learn({
    required this.title,
    required this.message,
    required this.image,
    required this.date,
    required this.readtime,
    required this.tags,
  });
}

List<Learn> learnData = [
  Learn(
    title: "Irritable Bowel Syndrome: Symptoms and Care",
    image: AppImages.learn1,
    message: "Video appointment at 9am",
    date: "June 15, 2020",
    readtime: 10,
    tags: ["stomach upset", "constipation", "alcohol"],
  ),
  Learn(
    title: "Alcohol Addiction",
    image: AppImages.learn2,
    message: "Video appointment at 9am",
    date: "June 15, 2020",
    readtime: 5,
    tags: ["stomach upset", "constipation", "alcohol"],
  ),
  Learn(
    title: "Measure and Watch Your Weight",
    image: AppImages.learn3,
    message: "Video appointment at 9am",
    date: "June 15, 2020",
    readtime: 2,
    tags: ["stomach upset", "constipation", "alcohol"],
  ),
  Learn(
    title: "Take Multivitamin Supplements",
    image: AppImages.learn4,
    message: "Video appointment at 9am",
    date: "June 15, 2020",
    readtime: 8,
    tags: ["stomach upset", "constipation", "alcohol"],
  ),
  Learn(
    title: "Get Enough Good Sleep",
    image: AppImages.learn5,
    message: "Video appointment at 9am",
    date: "June 15, 2020",
    readtime: 2,
    tags: ["stomach upset", "constipation", "alcohol"],
  ),
  Learn(
    title: "Get Enough Good Sleep",
    image: AppImages.learn6,
    message: "Video appointment at 9am",
    date: "June 15, 2020",
    readtime: 1,
    tags: ["stomach upset", "constipation", "alcohol"],
  ),
];

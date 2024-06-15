import 'package:the_rock_mobile/constants/app_images.dart';

class HistoryCardData {
  String label;
  String image;

  HistoryCardData({required this.label, required this.image});
}

List<HistoryCardData> historyData = [
  HistoryCardData(label: "Pharmacy", image: AppImages.hist1),
  HistoryCardData(label: "Laboratory", image: AppImages.hist2),
  HistoryCardData(label: "Home Care", image: AppImages.hist3),
];

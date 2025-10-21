import 'package:mom_plus/core/constants/app_images.dart';

enum MainItems {
  weight(unit: "kg", icon: AppImages.weightMachine, buttonTitle: "Vazn", title: "Vazni"),
  height(unit: "sm", icon: AppImages.ruler, buttonTitle: "Bo'y", title: "Bo'yi"),
  head(unit: "sm", icon: AppImages.head, buttonTitle: "Bosh o'lchami", title: "Boshi");

  final String title;
  final String icon;
  final String unit;
  final String buttonTitle;

  const MainItems({required this.title, required this.buttonTitle, required this.icon, required this.unit});

  bool get isWeight => this == MainItems.weight;

  bool get isHeight => this == MainItems.height;

  bool get isHead => this == MainItems.head;

  static MainItems fromString(String value) {
    return MainItems.values.firstWhere((element) => element.name == value, orElse: () => MainItems.weight);
  }
}

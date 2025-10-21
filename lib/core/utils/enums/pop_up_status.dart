import 'package:mom_plus/core/constants/app_icons.dart';

enum PopUpStatus {
  success(title: "Success", icon: AppIcons.success),
  error(title: "Error", icon: AppIcons.error),
  warning(title: "Warning", icon: AppIcons.warning);

  final String title;
  final String icon;

  const PopUpStatus({required this.title, required this.icon});
}

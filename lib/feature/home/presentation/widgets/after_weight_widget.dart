import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mom_plus/core/constants/app_icons.dart';
import 'package:mom_plus/core/theme/app_colors.dart';
import 'package:mom_plus/core/utils/extension/context_extension.dart';

class AfterWeightWidget extends StatelessWidget {
  const AfterWeightWidget({super.key, required this.date, required this.weight});

  final String date;
  final String weight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 154,
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(color: AppColors.pinkLight, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Hozirgi bo’yi", style: context.textTheme.bodyLarge),
          Text("35,5 sm", style: context.textTheme.bodyLarge),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: AppColors.slowWhite, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppIcons.calendar, height: 24, width: 24),
                Text("21.05.2025", style: context.textTheme.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

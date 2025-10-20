import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mom_plus/core/constants/app_icons.dart';
import 'package:mom_plus/core/theme/app_colors.dart';
import 'package:mom_plus/core/utils/extension/context_extension.dart';
import 'package:mom_plus/feature/common/presentation/widgets/animated_button.dart';

class FirstWeightWidget extends StatelessWidget {
  const FirstWeightWidget({super.key, required this.edit, required this.date, required this.weight});

  final VoidCallback edit;
  final String date;
  final String weight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 88,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(color: AppColors.solitude, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tug’ilgandagi vazni", style: context.textTheme.bodyLarge),
              Text("21.05.2025", style: context.textTheme.bodyLarge),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedButton(child: SvgPicture.asset(AppIcons.edit), onTap: () {}),
              Text("343 kg", style: context.textTheme.bodyLarge),
            ],
          ),
        ],
      ),
    );
  }
}

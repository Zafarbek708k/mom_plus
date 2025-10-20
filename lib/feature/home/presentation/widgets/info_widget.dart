import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mom_plus/core/constants/app_icons.dart';
import 'package:mom_plus/core/theme/app_colors.dart';
import 'package:mom_plus/core/utils/extension/context_extension.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
      decoration: BoxDecoration(color: AppColors.pinkLight, borderRadius: BorderRadius.circular(16)),
      child: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AppIcons.infoCircle, height: 32, width: 32),
          Flexible(
            child: Text(
              data,
              style: context.textTheme.bodySmall?.copyWith(color: AppColors.pinkText, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

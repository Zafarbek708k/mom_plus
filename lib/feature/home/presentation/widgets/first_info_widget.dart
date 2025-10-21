import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:mom_plus/core/constants/app_icons.dart';
import 'package:mom_plus/core/theme/app_colors.dart';
import 'package:mom_plus/core/utils/enums/main_items.dart' show MainItems;
import 'package:mom_plus/core/utils/extension/context_extension.dart';
import 'package:mom_plus/feature/common/presentation/widgets/animated_button.dart';
import 'package:mom_plus/feature/home/domain/entities/baby_info_entity.dart';
import 'package:mom_plus/feature/home/presentation/mixin/my_functions.dart';

class FirstInfoWidget extends StatelessWidget {
  const FirstInfoWidget({
    super.key,
    required this.edit,
    required this.info,
    required this.status,
    required this.babyInfoWeight,
    required this.babyInfoHeight,
    required this.babyInfoHead,
    required this.add,
  });

  final VoidCallback edit;
  final VoidCallback add;
  final MainItems info;
  final List<BabyInfoEntity> babyInfoWeight;
  final List<BabyInfoEntity> babyInfoHeight;
  final List<BabyInfoEntity> babyInfoHead;
  final FormzSubmissionStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(color: AppColors.solitude, borderRadius: BorderRadius.circular(16)),
      child: Builder(
        builder: (context) {
          final isEmptyHead = info.isHead && babyInfoHead.isEmpty;
          final isEmptyHeight = info.isHeight && babyInfoHeight.isEmpty;
          final isEmptyWeight = info.isWeight && babyInfoWeight.isEmpty;
          if (isEmptyHead || isEmptyHeight || isEmptyWeight) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(MyFunctions.addingTitle(info), style: context.textTheme.bodyLarge),
                  AnimatedButton(onTap: add, child: Icon(Icons.add)),
                ],
              ),
            );
          }

          final baby =
              info.isWeight
                  ? babyInfoWeight.first
                  : info.isHeight
                  ? babyInfoHeight.first
                  : babyInfoHead.first;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 12,
                children: [
                  if (status.isFailure) ...{
                    Text("Something went wrong", style: context.textTheme.bodyLarge),
                    Text("..", style: context.textTheme.bodyLarge),
                  } else ...{
                    Text(MyFunctions.title(info), style: context.textTheme.bodyLarge),
                    Text(MyFunctions.date(info, baby), style: context.textTheme.bodyLarge),
                  },
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 12,
                children: [
                  AnimatedButton(onTap: edit, child: SvgPicture.asset(AppIcons.edit)),
                  Text("${MyFunctions.value(info, baby)} ${info.unit}", style: context.textTheme.bodyLarge),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

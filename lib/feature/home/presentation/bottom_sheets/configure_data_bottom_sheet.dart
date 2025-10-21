import 'package:flutter/material.dart';
import 'package:mom_plus/core/theme/app_colors.dart';
import 'package:mom_plus/core/utils/enums/main_items.dart';
import 'package:mom_plus/core/utils/extension/context_extension.dart';
import 'package:mom_plus/feature/common/presentation/widgets/w_bottom_sheet.dart';
import 'package:mom_plus/feature/common/presentation/widgets/w_button.dart';
import 'package:mom_plus/feature/common/presentation/widgets/w_textfield.dart';

class ConfigureDataBottomSheet extends StatelessWidget {
  const ConfigureDataBottomSheet({super.key, required this.info, required this.valueCtrl, required this.dateCtrl});

  final MainItems info;
  final TextEditingController valueCtrl;
  final TextEditingController dateCtrl;

  @override
  Widget build(BuildContext context) {
    return WBottomSheet(
      hasTopLine: true,
      children: [
        const SizedBox(height: 12),
        Center(child: Text(info.title, style: context.textTheme.bodyLarge)),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: WTextField(
            borderRadius: 16,
            controller: valueCtrl,
            hasBorderColor: true,
            borderColor: AppColors.gray,
            fillColor: AppColors.textField,
            prefix: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 10),
              child: Text(info.title, style: context.textTheme.bodyMedium),
            ),
            suffix: Padding(
              padding: const EdgeInsets.only(right: 10, top: 5),
              child: Text(info.unit, style: context.textTheme.bodyMedium),
            ),

            onChanged: (value) {
              debugPrint("Value $value");
            },
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: WTextField(
            controller: dateCtrl,
            borderRadius: 16,
            hasBorderColor: true,
            borderColor: AppColors.gray,
            fillColor: AppColors.textField,
            prefix: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 10),
              child: Text("Sana", style: context.textTheme.bodyMedium),
            ),
            onChanged: (value) {
              debugPrint("Value $value");
            },
          ),
        ),
        SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            spacing: 8.5,
            children: [
              Expanded(
                child: WButton(
                  onTap: () => Navigator.of(context).pop(),
                  text: "Bekor qilish",
                  color: AppColors.solitude,
                ),
              ),
              Expanded(
                child: WButton(
                  onTap: () {
                    // update the baby value
                  },
                  text: "Saqlash",
                  textColor: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

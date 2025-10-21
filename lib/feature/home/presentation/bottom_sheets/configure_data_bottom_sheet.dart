import 'package:flutter/material.dart';
import 'package:mom_plus/core/theme/app_colors.dart';
import 'package:mom_plus/core/utils/extension/context_extension.dart';
import 'package:mom_plus/feature/common/presentation/widgets/w_bottom_sheet.dart';
import 'package:mom_plus/feature/common/presentation/widgets/w_button.dart';
import 'package:mom_plus/feature/common/presentation/widgets/w_textfield.dart';

class ConfigureDataBottomSheet extends StatelessWidget {
  const ConfigureDataBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return WBottomSheet(
      hasTopLine: true,
      children: [
        Center(child: Text("data", style: context.textTheme.bodyLarge)),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: WTextField(
            onChanged: (value) {
              debugPrint("");
            },
            fillColor: AppColors.textField,
            borderRadius: 16,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: WTextField(
            onChanged: (value) {
              debugPrint("");
            },
            fillColor: AppColors.textField,
            borderRadius: 16,
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

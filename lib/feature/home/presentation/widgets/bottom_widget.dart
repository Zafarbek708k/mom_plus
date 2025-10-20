import 'package:flutter/material.dart';
import 'package:mom_plus/core/theme/app_colors.dart';
import 'package:mom_plus/core/utils/extension/context_extension.dart';
import 'package:mom_plus/feature/home/presentation/pages/home.dart';

class BottomWidget extends StatefulWidget implements PreferredSizeWidget {
  const BottomWidget({super.key, required this.controller, this.onTap});

  final TabController controller;
  final ValueChanged<int>? onTap;

  @override
  State<BottomWidget> createState() => _BottomWidgetState();

  @override
  Size get preferredSize => Size(double.infinity, 50);
}

class _BottomWidgetState extends State<BottomWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        height: 44,
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        decoration: BoxDecoration(color: AppColors.solitude, borderRadius: BorderRadius.circular(12)),
        child: TabBar(
          onTap: widget.onTap,
          isScrollable: false,
          padding: EdgeInsets.symmetric(horizontal: 0),
          labelPadding: EdgeInsets.symmetric(horizontal: 10),
          labelColor: AppColors.textColor,
          labelStyle: context.textTheme.bodyLarge,
          unselectedLabelColor: AppColors.textGrey,
          unselectedLabelStyle: context.textTheme.bodyLarge,
          indicator: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10)),
          dividerHeight: 0,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            ...List.generate(MainItems.values.length, (i) {
              final item = MainItems.values[i];
              return OrderTabWidget(title: item.title, isActive: true);
            }),
          ],
          controller: widget.controller,
        ),
      ),
    );
  }
}

class OrderTabWidget extends StatelessWidget {
  const OrderTabWidget({super.key, required this.title, required this.isActive});

  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) => Tab(
    height: 40,
    iconMargin: EdgeInsets.symmetric(horizontal: 12),
    child: Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text(title, maxLines: 1)),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:mom_plus/core/theme/app_colors.dart';
import 'package:mom_plus/core/utils/enums/main_items.dart';
import 'package:mom_plus/core/utils/extension/context_extension.dart';
import 'package:mom_plus/feature/common/presentation/widgets/shimmer_loader.dart';
import 'package:mom_plus/feature/home/presentation/bloc/home_bloc/home_bloc.dart';

class BottomWidget extends StatefulWidget implements PreferredSizeWidget {
  const BottomWidget({super.key, required this.controller, this.onTap, required this.bloc});

  final TabController controller;
  final ValueChanged<int>? onTap;
  final HomeBloc bloc;

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
        margin: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        decoration: BoxDecoration(color: AppColors.solitude, borderRadius: BorderRadius.circular(12)),
        child: BlocSelector<HomeBloc, HomeState, FormzSubmissionStatus>(
          bloc: widget.bloc,
          selector: (state) => state.getBabiesStatus,
          builder: (context, state) {
            if (!state.isSuccess) {
              return Shimmer(child: ShimmerLoading(isLoading: true, child: ShimmerContainer()));
            }

            return TabBar(
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
            );
          },
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

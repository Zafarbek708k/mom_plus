import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:mom_plus/core/constants/app_icons.dart';
import 'package:mom_plus/core/constants/app_images.dart';
import 'package:mom_plus/core/theme/app_colors.dart';
import 'package:mom_plus/core/utils/enums/main_items.dart';
import 'package:mom_plus/core/utils/enums/pop_up_status.dart';
import 'package:mom_plus/core/utils/extension/context_extension.dart';
import 'package:mom_plus/feature/common/presentation/widgets/animated_button.dart';
import 'package:mom_plus/feature/common/presentation/widgets/shimmer_loader.dart';
import 'package:mom_plus/feature/common/presentation/widgets/w_button.dart';
import 'package:mom_plus/feature/home/domain/entities/baby_entity.dart';
import 'package:mom_plus/feature/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:mom_plus/feature/home/presentation/bottom_sheets/configure_data_bottom_sheet.dart';
import 'package:mom_plus/feature/home/presentation/pages/history.dart';
import 'package:mom_plus/feature/home/presentation/widgets/after_weight_widget.dart';
import 'package:mom_plus/feature/home/presentation/widgets/bottom_widget.dart';
import 'package:mom_plus/feature/home/presentation/widgets/first_info_widget.dart';
import 'package:mom_plus/feature/home/presentation/widgets/info_widget.dart';
import 'package:mom_plus/feature/home/presentation/widgets/line_chart.dart';

part 'package:mom_plus/feature/home/presentation/mixin/home_mixin.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin, HomeMixin {
  @override
  void initState() {
    init(this, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        leadingWidth: 32,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: AnimatedButton(
            child: SvgPicture.asset(AppIcons.arrowLeft),
            onTap: () async {
              if (!Navigator.of(context).canPop()) {
                context.showPopUp(status: PopUpStatus.error, message: "You can't Pop this screen", context: context);
              }
            },
          ),
        ),
        actions: [
          AnimatedButton(
            child: SvgPicture.asset(AppIcons.clock, height: 24, width: 24),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => History())),
          ),
          SizedBox(width: 12),
        ],
        title: Text("O’lchovlar", style: context.textTheme.titleMedium),
        bottom: BottomWidget(
          bloc: homeBloc,
          controller: _tabController,
          onTap: (value) {
            _selectedView.value = MainItems.values[value];
          },
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (o, n) => o.getBabiesStatus != n.getBabiesStatus,
        builder: (context, state) {
          log("babies list ${state.babies.length}");

          if (state.getBabiesStatus.isInProgress || state.getBabiesStatus.isInitial && state.babies.isEmpty) {
            return LoadingUi();
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  ValueListenableBuilder(
                    valueListenable: _selectedView,
                    builder: (context, item, child) {
                      return FirstInfoWidget(
                        info: item,
                        status: state.getBabiesStatus,
                        add: () {
                          showModalBottomSheet(
                            constraints: BoxConstraints(maxWidth: context.sizeOf.height * 0.8),
                            isDismissible: true,
                            isScrollControlled: false,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return ConfigureDataBottomSheet(info: _selectedView.value);
                            },
                          );
                        },
                        edit: () {
                          showModalBottomSheet(
                            constraints: BoxConstraints(maxWidth: context.sizeOf.height * 0.8),
                            isDismissible: true,
                            isScrollControlled: false,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return ConfigureDataBottomSheet(info: _selectedView.value);
                            },
                          );
                        },
                        babyInfoWeight: state.birthDateWeight,
                        babyInfoHeight: state.birthDateHeight,
                        babyInfoHead: state.birthDateHead,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  AfterWeightWidget(date: "", weight: ""),
                  const SizedBox(height: 16),
                  GrowthChart(),
                  const SizedBox(height: 16),
                  InfoWidget(
                    data:
                        "Bu grafiklar JSST (WHO) standartlariga asoslangan. O‘lchovlarni muntazam kiritib, bolaning rivojlanishini kuzating.",
                  ),

                  SizedBox(height: 100),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ValueListenableBuilder(
          valueListenable: _selectedView,
          builder: (context, view, child) {
            return WButton(
              height: 56,
              text: "${view.buttonTitle} qo’shish",
              textStyle: context.textTheme.titleMedium?.copyWith(color: AppColors.white),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}

class LoadingUi extends StatelessWidget {
  const LoadingUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: ShimmerLoading(
        isLoading: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),

            child: Column(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(9, (i) {
                  return ShimmerContainer(width: double.infinity, height: 100);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

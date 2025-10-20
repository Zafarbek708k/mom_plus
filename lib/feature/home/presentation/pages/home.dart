import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mom_plus/core/constants/app_icons.dart';
import 'package:mom_plus/core/theme/app_colors.dart';
import 'package:mom_plus/core/utils/extension/context_extension.dart';
import 'package:mom_plus/feature/common/presentation/widgets/animated_button.dart';
import 'package:mom_plus/feature/common/presentation/widgets/w_button.dart';
import 'package:mom_plus/feature/home/presentation/pages/history.dart';
import 'package:mom_plus/feature/home/presentation/widgets/after_weight_widget.dart';
import 'package:mom_plus/feature/home/presentation/widgets/bottom_widget.dart';
import 'package:mom_plus/feature/home/presentation/widgets/first_weight_widget.dart';
import 'package:mom_plus/feature/home/presentation/widgets/info_widget.dart';
import 'package:mom_plus/feature/home/presentation/widgets/line_chart.dart';

part 'package:mom_plus/feature/home/presentation/mixin/home_mixin.dart';

enum MainItems {
  weight(buttonTitle: "Vazn", title: "Vazni"),
  height(buttonTitle: "Bo'y", title: "Bo'yi"),
  head(buttonTitle: "Bosh o'lchami", title: "Boshi");

  final String title;
  final String buttonTitle;

  const MainItems({required this.title, required this.buttonTitle});

  bool get isWeight => this == MainItems.weight;

  bool get isHeight => this == MainItems.height;

  bool get isHead => this == MainItems.head;
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin, HomeMixin {
  @override
  void initState() {
    init(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leadingWidth: 34,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: AnimatedButton(
            child: SvgPicture.asset(AppIcons.arrowLeft),
            onTap: () {
              final canPop = Navigator.of(context).canPop();
              if (canPop) {
                log("message");
              } else {
                log("You can not Pop from this page");
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
          controller: _tabController,
          onTap: (value) {
            _selectedView.value = MainItems.values[value];
            log("Index: $value");
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              FirstWeightWidget(
                edit: () {
                  debugPrint("edit function");
                },
                date: '',
                weight: '',
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
            ],
          ),
        ),
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

final baby = {"height": [], "weight": {}, "head": {}};

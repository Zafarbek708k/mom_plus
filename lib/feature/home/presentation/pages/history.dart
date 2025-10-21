import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:mom_plus/core/constants/app_icons.dart';
import 'package:mom_plus/core/utils/enums/main_items.dart';
import 'package:mom_plus/core/utils/extension/context_extension.dart';
import 'package:mom_plus/feature/common/presentation/widgets/animated_button.dart';
import 'package:mom_plus/feature/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:mom_plus/feature/home/presentation/pages/home.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        leadingWidth: 34,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: AnimatedButton(
            child: SvgPicture.asset(AppIcons.arrowLeft),
            onTap: () {
              final canPop = Navigator.of(context).canPop();
              if (canPop) {
                Navigator.of(context).pop();
              } else {
                log("You can not Pop from this page");
              }
            },
          ),
        ),
        title: Text("O’lchovlar tarixi", style: context.textTheme.titleMedium),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.historyStatus.isInitial) {
            return LoadingUi();
          }

          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: state.histories.length,
            itemBuilder: (context, index) {
              log("index=$index");
              final item = state.histories[index];

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.date, style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500)),
                  ...List.generate(item.items.length, (i) {
                    final data = item.items[i];
                    final type = MainItems.fromString(data.type);
                    return SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(type.icon, height: double.infinity),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("${data.value} ${data.unit}", style: context.textTheme.bodyLarge),
                              Text("${data.period} ", style: context.textTheme.bodySmall),
                            ],
                          ),
                          Spacer(),
                          Text(item.date, style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500)),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 26),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

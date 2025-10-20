import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mom_plus/core/constants/app_icons.dart';
import 'package:mom_plus/core/utils/extension/context_extension.dart';
import 'package:mom_plus/feature/common/presentation/widgets/animated_button.dart';

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
      body: Center(),
    );
  }
}

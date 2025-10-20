import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_plus/core/theme/light.dart';
import 'package:mom_plus/core/utils/extension/context_extension.dart';
import 'package:mom_plus/feature/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:mom_plus/feature/home/presentation/pages/home.dart';

void main() {
  runZonedGuarded(
    () async {
      DartPluginRegistrant.ensureInitialized();
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      runApp(const MyApp());
    },
    (error, stack) {
      debugPrint("Error: $error\n");
      debugPrint("Path: $stack\n");
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: LightTheme.theme(),
        themeMode: ThemeMode.light,
        home: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(context.maxScale)),
          child: Home(),
        ),
      ),
    );
  }
}

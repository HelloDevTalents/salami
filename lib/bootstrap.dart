// Copyright (c) 2022, DEVTALENTS
// https://devtalents.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:salami/app/app.dart';
import 'package:salami_api/salami_api.dart';
import 'package:salami_repository/salami_repository.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(BaseUrls baseUrls) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio(BaseOptions(baseUrl: baseUrls.api));
  final apiClient = SalamiApi(dio, baseUrls);
  final salamiRepository = SalamiRepository(apiClient);

  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          Provider.value(
            value: baseUrls,
            child: App(
              salamiRepository: salamiRepository,
            ),
          ),
        ),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

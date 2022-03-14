// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:salami/home/home.dart';
import 'package:salami/l10n/l10n.dart';
import 'package:salami_repository/salami_repository.dart';
import 'package:salami_theme/salami_theme.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.salamiRepository}) : super(key: key);

  final SalamiRepository salamiRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: salamiRepository,
      child: MaterialApp(
        theme: SalamiTheme.themeData,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const HomePage(),
      ),
    );
  }
}

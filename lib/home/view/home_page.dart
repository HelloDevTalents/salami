import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salami/home/cubit/home_cubit.dart';
import 'package:salami/l10n/l10n.dart';
import 'package:salami_theme/salami_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route<HomePage> route() {
    return MaterialPageRoute(
      builder: (context) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..fetchAll(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.appBarTitle)),
      body: const Center(child: _Content()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: const Key('action-button-increment'),
            onPressed: () => context.read<HomeCubit>().increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('action-button-decrement'),
            onPressed: () => context.read<HomeCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.select((HomeCubit cubit) => cubit.state.status);

    switch (status) {
      case HomeStatus.initial:
        return const SizedBox();
      case HomeStatus.loading:
        return const Center(child: CircularProgressIndicator.adaptive());
      case HomeStatus.success:
        return const _HomeStart();
    }
  }
}

class _HomeStart extends StatelessWidget {
  const _HomeStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final count = context.select((HomeCubit cubit) => cubit.state.counter);

    return SingleChildScrollView(
      key: const Key('home-scroll-view'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(l10n.appName, style: SalamiTextStyle.headline1),
          Text(l10n.appDescription, style: SalamiTextStyle.bodyText1),
          const SizedBox(height: 20),
          const SalamiStart(),
          Text(
            '$count',
            style: SalamiTextStyle.headline1,
            key: const Key('counter-text'),
          ),
        ],
      ),
    );
  }
}
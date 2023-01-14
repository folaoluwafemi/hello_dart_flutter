import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_dart_flutter/src/features/hello/ui/state/hello_cubit.dart';
import 'package:hello_dart_flutter/src/utils/utils_barrel.dart';

part 'custom/home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HelloCubit>(
      create: (context) => HelloCubit()..fetchHello(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hello',
            style: context.theme.textTheme.headline4?.withWhite,
          ),
        ),
        body: HelloView(),
      ),
    );
  }
}
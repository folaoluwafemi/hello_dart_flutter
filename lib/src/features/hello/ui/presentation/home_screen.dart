import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_dart_flutter/src/features/hello/ui/state/hello_cubit.dart';
import 'package:hello_dart_flutter/src/utils/utils_barrel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HelloCubit>(
      create: (context) => HelloCubit(),
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

class HelloView extends StatefulWidget {
  const HelloView({Key? key}) : super(key: key);

  @override
  State<HelloView> createState() => _HelloViewState();
}

class _HelloViewState extends State<HelloView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<HelloCubit, HelloState>(
              builder: (context, state) {
                if (state.status == HelloStatus.error) {
                  return Text(
                    state.error?.message ?? '',
                    style: context.theme.textTheme.bodyMedium?.withSize(18),
                  );
                }
                return Text(
                  state.hello ?? 'No hello',
                  style: context.theme.textTheme.bodyMedium?.withSize(18),
                );
              },
            ),
            Row(
              children: [
                const Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter a hello and send'
                    ),
                  ),
                ),
                BlocBuilder<HelloCubit, HelloState>(
                  builder: (context, state) {
                    if (state.status == HelloStatus.loading ||
                        state.status == HelloStatus.initial) {
                      return const SizedBox.square(
                        dimension: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                        ),
                      );
                    }
                    return IconButton(
                      onPressed: onSendPressed,
                      icon: const Icon(
                        Icons.send,
                        color: Colors.brown,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onSendPressed() {}
}

part of '../home_screen.dart';

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
                    state.error?.message ?? 'An error occurred',
                    style: context.theme.textTheme.bodyMedium
                        ?.withSize(15)
                        .withColor(Colors.red),
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
                Flexible(
                  child: TextField(
                    controller: helloFieldController,
                    decoration: const InputDecoration(
                      hintText: 'Enter a hello and send',
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

  final TextEditingController helloFieldController = TextEditingController();

  @override
  void dispose() {
    helloFieldController.dispose();
    super.dispose();
  }

  void onSendPressed() {
    final String helloText = helloFieldController.text;
    helloFieldController.clear();
    context.read<HelloCubit>().saveHello(helloText);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/mvvm/timer/view_model/timer_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            final viewModel = ref.watch(timerViewModelProvider.notifier);
            final countDown = ref.watch(timerViewModelProvider).countDown;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$countDown'),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      viewModel.startCountDown();
                    },
                    child: const Text('スタート'),
                ),
                const SizedBox(
                    height: 50
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.resetCountDown();
                  },
                  child: const Text('リセット'),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}

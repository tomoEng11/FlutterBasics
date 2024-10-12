import 'package:flutter/material.dart';
import 'package:flutter_basic/mvvm/view_model/counter_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            final count = ref.watch(counterViewModelProvider).count;
            final viewModel = ref.watch(counterViewModelProvider.notifier);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('New Counter App'),
                Text('$count'),
                ElevatedButton(
                  onPressed: () {
                    viewModel.increment();
                  }, 
                  child: const Text('CountUp'),
                  ),
              ],
            );
          }
        ),
      ),
    );
  }
}

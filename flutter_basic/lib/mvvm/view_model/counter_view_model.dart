
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_basic/mvvm/state/counter_state.dart';


part 'counter_view_model.g.dart';

@riverpod
final class CounterViewModel extends _$CounterViewModel {
  @override
  CounterState build() {
    return const CounterState(
      count: 0,
    );
  }

  void increment() {
    state = state.copyWith(
        count: state.count + 1
    );
  }
}
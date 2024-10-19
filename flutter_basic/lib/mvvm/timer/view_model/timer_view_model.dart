import 'dart:async';

import 'package:flutter_basic/mvvm/timer/state/timer_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timer_view_model.g.dart';

@riverpod
final class TimerViewModel extends _$TimerViewModel {
  @override
  TimerState build() {
    return const TimerState(
        countDown: 10
    );
  }

  Future<void> init() async {}

  Timer? _timer;

  void startCountDown() {
    if (_timer != null && _timer!.isActive) {
      return;
    } else if (_timer != null && !(_timer!.isActive)) {
      print('タイマーがあるけど動いてない');
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (state.countDown >= 1) {
          state = state.copyWith(countDown: state.countDown - 1);
        } else {
          _timer?.cancel();
        }
      });
    } else {
      print('タイマーがnull');
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (state.countDown >= 1) {
          state = state.copyWith(countDown: state.countDown - 1);
        } else {
          _timer?.cancel();
        }
      });
    }
  }

  void resetCountDown() {
    state = state.copyWith(
      countDown: 10
    );
  }
}
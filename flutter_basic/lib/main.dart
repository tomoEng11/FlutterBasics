import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_basic/mvvm/timer/view/timer_view.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: TimerView(),
      ),
    ),
  );
}

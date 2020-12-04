// Copyright 2020 LTMM. All rights reserved.
// Uses of this source code is governed by 'The Unlicense' that can be
// found in the LICENSE file.

import 'package:bloc/bloc.dart';

import 'timed_widget_states.dart';

class TimedWidgetCubit extends Cubit<TimedWidgetState> {
  bool _cancelUpdates;

  TimedWidgetCubit() : super(TimedWidgetInitial());

  void cancelTimerUpdates() async => _cancelUpdates = true;

  void updatingTimer(Duration duration) async {
    _cancelUpdates = false;
    final finish = DateTime.now().add(duration.abs());
    double pct = 1.0;
    Duration interval = finish.difference(DateTime.now());
    while (!interval.isNegative && !_cancelUpdates) {
      emit(UpdateTimer(pct, interval));
      pct = 1.0 - (duration.inMilliseconds - interval.inMilliseconds) / duration.inMilliseconds;
      if (duration.isNegative) pct = 1.0 + pct;
      if (!_cancelUpdates) await Future.delayed(Duration(milliseconds: 150));
      interval = finish.difference(DateTime.now());
    }
    emit(UpdateComplete());
  }
}

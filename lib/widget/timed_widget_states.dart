// Copyright 2020 LTMM. All rights reserved.
// Uses of this source code is governed by 'The Unlicense' that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';

part 'timed_widget_state.dart';

/// Classes for the cubit state
class TimedWidgetInitial extends TimedWidgetState {
  const TimedWidgetInitial() : super(TimedWidgetBuilderState.TimedWidgetInitial);
}

class UpdateComplete extends TimedWidgetState {
  const UpdateComplete() : super(TimedWidgetBuilderState.UpdateComplete);
}

class UpdateTimer extends TimedWidgetState {
  final Duration duration;
  final double pct;
  const UpdateTimer(this.pct, this.duration) : super(TimedWidgetBuilderState.UpdateTimer);
  @override
  List<Object> get props => [pct, timedWidgetBuilderState];
}

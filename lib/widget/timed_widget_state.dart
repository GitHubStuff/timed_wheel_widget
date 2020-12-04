// Copyright 2020 LTMM. All rights reserved.
// Uses of this source code is governed by 'The Unlicense' that can be
// found in the LICENSE file.

part of 'timed_widget_states.dart';

enum TimedWidgetBuilderState {
  TimedWidgetInitial,
  UpdateComplete,
  UpdateTimer,
}

abstract class TimedWidgetState extends Equatable {
  final TimedWidgetBuilderState timedWidgetBuilderState;
  const TimedWidgetState(this.timedWidgetBuilderState);

  @override
  List<Object> get props => [timedWidgetBuilderState];
}

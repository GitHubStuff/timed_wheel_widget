// Copyright 2021 LTMM. All rights reserved.

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

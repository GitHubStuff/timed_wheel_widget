// Copyright 2020 LTMM. All rights reserved.
// Uses of this source code is governed by 'The Unlicense' that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'timed_widget_cubit.dart';
import 'timed_widget_states.dart';

class TimedWheelWidget extends StatefulWidget {
  final Duration duration;
  final Function(double, Duration) callback;
  final Function completion;
  const TimedWheelWidget({
    Key key,
    @required this.duration,
    this.callback,
    this.completion,
  })  : assert(duration != null),
        super(key: key);
  @override
  _TimedWheelWidget createState() => _TimedWheelWidget();
}

class _TimedWheelWidget extends State<TimedWheelWidget> {
  TimedWidgetCubit _timedWidgetCubit;
  double _value = 0.5;

  @override
  Widget build(BuildContext context) {
    _timedWidgetCubit = TimedWidgetCubit();
    return BlocBuilder<TimedWidgetCubit, TimedWidgetState>(
        bloc: _timedWidgetCubit,
        builder: (context, sensorState) {
          switch (sensorState.timedWidgetBuilderState) {
            case TimedWidgetBuilderState.TimedWidgetInitial:
              _timedWidgetCubit.updatingTimer(widget.duration);
              break;
            case TimedWidgetBuilderState.UpdateComplete:
              _value = (widget.duration.isNegative) ? 1.0 : 0.0;
              if (widget.completion != null) widget.completion();
              break;
            case TimedWidgetBuilderState.UpdateTimer:
              final info = (sensorState as UpdateTimer);
              _value = info.pct;
              if (widget.callback != null) widget.callback(_value, info.duration);
          }
          return CircularProgressIndicator(value: _value);
        });
  }
}

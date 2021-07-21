# timed\_wheel\_widget

Shows a CircularProgressIndicator as count-down/up ring for a given duration.

## Getting Started

```dart
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
```

NOTE: If **duration** is negative it counts down, other wise counts up

NOTE: **callback** is optional, it can return percentage complated and remaining duration

NOTE: **complete** is optional, it returns when the drawing completes (aka duration is over)

### Example

```dart
timed_wheel_widget/example/main.dart
```

Details the widget usage.

## Final thoughts

Be kind to each other.
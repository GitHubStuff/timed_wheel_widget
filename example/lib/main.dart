// Copyright 2020 LTMM. All rights reserved.
// Uses of this source code is governed by 'The Unlicense' that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:timed_wheel_widget/timed_wheel_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'TimedWheelWidget demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Duration _positiveDuration = Duration(minutes: 2);
  Duration _negativeDuration = Duration(minutes: -2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _text(
              'Push button for animated wheel',
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TimedWheelWidget(
                callback: (pct, dur) {
                  debugPrint('Positive $dur $pct');
                },
                completion: () {
                  debugPrint('PosDone');
                },
                duration: _positiveDuration,
              ),
            ),
            _text('Positive Duration in seconds: ${_positiveDuration.inSeconds}'),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                SizedBox(
                  height: 150.0,
                  width: 150.0,
                  child: TimedWheelWidget(
                    callback: (pct, dur) {
                      debugPrint('Negative $dur $pct');
                    },
                    completion: () {
                      debugPrint('NegDone');
                    },
                    duration: _negativeDuration,
                  ),
                ),
                SizedBox(
                  height: 130.0,
                  width: 130.0,
                  child: TimedWheelWidget(
                    callback: (pct, dur) {
                      debugPrint('Negative $dur $pct');
                    },
                    completion: () {
                      debugPrint('NegDone');
                    },
                    duration: _positiveDuration,
                  ),
                ),
              ],
            ),
            _text('Negative Duration in seconds: ${_negativeDuration.inSeconds}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _text(String caption) {
    return Text(caption, style: TextStyle(fontSize: 24.0));
  }
}

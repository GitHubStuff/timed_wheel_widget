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
  Duration duration = Duration(seconds: 5);

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
                  debugPrint('$dur $pct');
                },
                completion: () {
                  debugPrint('Done');
                },
                duration: duration,
              ),
            ),
            _text('Duration in seconds: ${duration.inSeconds}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            duration = (duration.isNegative) ? Duration(seconds: 2) : Duration(seconds: -3);
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _text(String caption) {
    return Text(caption, style: TextStyle(fontSize: 24.0));
  }
}

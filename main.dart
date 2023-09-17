import 'package:flutter/material.dart';
import 'login.dart';
import 'stopwatch.dart';

void main() => runApp(StopwatchApp());

class StopwatchApp extends StatelessWidget {
    Widget build (BuildContext context) {
      return MaterialApp(
        home: loginScreen()
      );
    }
  }

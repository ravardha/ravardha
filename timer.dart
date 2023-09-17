import 'dart:async';
import 'package:flutter/material.dart';
import 'about.dart';
import 'stopwatch.dart';
import 'timer_end.dart';


class Clock extends StatefulWidget {
  @override
  State createState() => ClockState();
}

class ClockState extends State<Clock> {
  bool isTicking = true;
  int seconds = 0;
  late Timer timer;
  final laps = <int>[];

  void _onTick(Timer timer){
    setState(() {
      seconds -= 1;
      if (seconds == 0){
        timer.cancel();

        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ClockEnd()),
        );

      }
    });
  }

  // String _secondsString() => seconds == 1 ? 'second' : 'seconds';
  String _secondsString(int milliseconds) {
    return '$seconds';
  }

  void dispose(){
    timer.cancel();
    super.dispose();
  }

  void _startCountdown(){
    timer = Timer.periodic(Duration(seconds: 1), _onTick);
    setState(() {
      isTicking = true;
    });
  }

  void _pauseCountdown(){
    setState(() {
      timer.cancel();
      isTicking = true;
    });
  }

  void _stopCountdown(){
    setState(() {
      seconds = 0;
      timer.cancel();
      isTicking = true;
    });
  }

  void _movetoabout(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => About()),
    );
  }

  void _movetostopwatch(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Stopwatch()),
    );
  }

  void _plusone(){
    seconds += 1;
    setState(() {
      isTicking = true;
    });
  }

  void _plusfive(){
    seconds += 5;
    setState(() {
      isTicking = true;
    });
  }

  void _plusten(){
    seconds += 10;
    setState(() {
      isTicking = true;
    });
  }

  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Timer"),
      ),

      body: Column(
          children: <Widget>[
            Expanded(child: buildCounter(context)),
            Expanded(child: _buildLapDisplay()),
          ]
      ),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.greenAccent,
        height: 65,
        child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  child: TextButton(
                    onPressed: _movetostopwatch,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.timer_outlined, color: Colors.white,),
                        Text("Stopwatch", style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.greenAccent,
                  width: 100,
                  child: TextButton(
                    onPressed: null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.watch_later_outlined, color: Colors.white,),
                        Text("Timer", style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  child: TextButton(
                    onPressed: _movetoabout,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_2_outlined, color: Colors.white, size: 30,),
                        Text("About", style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

  Widget buildCounter(BuildContext context) {
    return Container(
        color: Colors.lightBlueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _secondsString(seconds),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Text(
                "Seconds",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16)
            ),
            SizedBox(
                height: 20
            ),

            buildControls(),
            SizedBox(
                width: 20
            ),


          ],
        )
    );
  }

  Row buildControls() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),

            ),
            onPressed: () => _startCountdown(),
            child: Text(
                'Start'
            ),
          ),

          SizedBox(
              width: 20
          ),

          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: isTicking ? _pauseCountdown : null,
              child: Text(
                  'Pause'
              )
          ),

          SizedBox(
              width: 20
          ),

          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: isTicking ? _stopCountdown : null,
              child: Text(
                  'Stop'
              )
          ),
        ]
    );


  }
  Widget _buildLapDisplay() {
    return Container (
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _plusone,
                child: Text(
                    "+ 1 Seconds"
                )
            ),
            SizedBox(
                width: 20
            ),
            ElevatedButton(
                onPressed: _plusfive,
                child: Text(
                    "+ 5 Seconds"
                )
            ),
            SizedBox(
                width: 20
            ),
            ElevatedButton(
                onPressed: _plusten,
                child: Text(
                    "+ 10 Seconds"
                )
            ),
          ],

        )
    );
  }
}
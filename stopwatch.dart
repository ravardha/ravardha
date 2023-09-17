import 'dart:async';
import 'package:flutter/material.dart';
import 'about.dart';
import 'timer.dart';

class Stopwatch extends StatefulWidget {

  @override
  State createState () => StopwatchState();
}

class StopwatchState extends State<Stopwatch> {
  late bool isTicking = true;
  int seconds = 0;
  late Timer timer;
  int milliseconds = 0 ;
  final laps = <int>[];
  final itemHeight = 60.0;
  final scrollController = ScrollController();

  void _onTick(Timer time){
    setState(() {
      milliseconds +=100;
    });
  }

  String _secondsString(int milliseconds){
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 100), _onTick);

    setState(() {
      isTicking = true;
      laps.clear();
    });
  }

  void _stopTimer(){
    timer.cancel();

    setState(() {
      isTicking = false;
    });
  }

  void _resetTimer(){
    //timer.cancel();

    setState(() {
      milliseconds = 0;
    });
  }

  void _lap(){

    setState(() {
      laps.add(milliseconds);
      _resetTimer();
    });

    scrollController.animateTo(
        itemHeight * laps.length,
        duration: Duration(milliseconds: 500 ),
        curve: Curves.easeIn);
  } //ini buat nambahin data ke dalam array

  void _movetoabout(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => About()),
    );
  }

  void _movetotimer(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Clock()),
    );
  }



  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text('Stopwatch'), backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: buildCounter(context)),
          Expanded(child: _buildLapDisplay())

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
    onPressed: null,
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
    width: 100,
    child: TextButton(
    onPressed: _movetotimer,
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
      color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Lap ${laps.length + 1}',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white),
          ),
          Text(
              _secondsString(milliseconds),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)
          ),
          SizedBox(width: 20),
          buildControls(),
        ],
      ),
    );

  }

  Widget buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: ()=> _startTimer(),
            child: Text('Start')
        ),
        SizedBox(width: 20),
        TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: ()=> _stopTimer(),
            child: Text('Stop')
        ),
        SizedBox(width: 20),
        TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: isTicking ? _lap: null,
            child: Text('Lap')
        ),
      ],
    );
  }

  Widget _buildLapDisplay() {
    return Scrollbar(
      child: ListView.builder(
          itemCount: laps.length,
          itemBuilder: (context, index) {
            final milliseconds = laps[index];
            return ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 50),
              title: Text('Lap ${index + 1}'),
              trailing: Text(_secondsString(milliseconds)),
            );
          }
      ),
    );
  }


}
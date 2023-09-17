import 'dart:async';
import 'package:flutter/material.dart';
import 'stopwatch.dart';
import 'timer.dart';


class About extends StatefulWidget {
  @override
  State createState () => AboutState();
}

class AboutState extends State<About> {
  void _movetostopwatch(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Stopwatch()),
    );
  }

  void _movetotimer(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Clock()),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'), backgroundColor: Colors.red,
      ),
        body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                    width: 350,
                    height: 175,
                    child: Image.asset('assets/FTI.png'),
                ),
                Container(
                  width: 350,
                  height: 175,
                  child: Image.asset('assets/SI.png'),
                ),
                    SizedBox(
                      height: 50,
                    ),
                    Text("REGITTA APRILLIE VARDHA",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, )),
                    Text("SISTEM INFROMASI",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,)),
                    Text("825210132",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,)),
                  ],
                )
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
                    onPressed: _movetostopwatch,
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
}
import 'timer.dart';
import 'package:flutter/material.dart';

class ClockEnd extends StatefulWidget {
  @override
  State createState() => EndState();
}

class EndState extends State<ClockEnd> {

  void _movetocountdown(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Clock()),
    );
  }


  Widget build(BuildContext context){
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Countdown Telah Selesai!",
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: _movetocountdown, child: Text("Back"))
              ],
            )
          ],
        )
    );
  }
}
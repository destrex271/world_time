import 'package:flutter/material.dart';
import 'Services/wrldt.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "";

  void setup() async{
    WorldTime wd = WorldTime(zone: "Asia/Kolkata");
    await wd.getData();
    time = wd.time;
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': time,
      'zone': wd.zone,
      'pic': wd.pic,
      'col': wd.col
    });
  }

  @override
  void initState() {
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: const Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0
        ),
      ),
    );
  }
}
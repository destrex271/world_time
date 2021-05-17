import 'package:flutter/material.dart';
import 'package:wrld_time/Pages/Services/wrldt.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  
  List wr = <WorldTime>[
    WorldTime(zone: "America/Chicago"),
    WorldTime(zone: "America/New_York"),
    WorldTime(zone: "America/Yakutat"),
    WorldTime(zone: "America/Toronto"),
    WorldTime(zone: "Antarctica/Rothera"),
    WorldTime(zone: "Antarctica/Mawson"),
    WorldTime(zone: "Asia/Shanghai"),
    WorldTime(zone: "Asia/Singapore"),
    WorldTime(zone: "Australia/Sydney"),
    WorldTime(zone: "Australia/Perth"),
    WorldTime(zone: "Australia/Melbourne"),
    WorldTime(zone: "Europe/London"),
    WorldTime(zone: "Europe/Berlin"),
    WorldTime(zone: "Europe/Paris"),
    WorldTime(zone: "Europe/Moscow"),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: const Text("Choose Location"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:10,horizontal: 0),
        child: ListView.builder(
          itemCount: wr.length,
          itemBuilder:(context, index){
            return ListTile(
              title: Text(wr[index].zone),
              onTap: () async{
                await wr[index].getData();
                Navigator.popAndPushNamed(context, '/home', arguments: {
                  'time': wr[index].time,
                  'zone': wr[index].zone,
                  'col': wr[index].col,
                  'pic': wr[index].pic,
                });
              },
            );
          },
        ),
      ),

    );
  }
}
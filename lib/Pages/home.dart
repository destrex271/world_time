import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  int i = 0;
  Color col = Colors.blue;
  String pic = "day.jpg";
  String time = "";
  String zone = "";

  @override
  Widget build(BuildContext context) {
    if(i == 0){
      data = ModalRoute.of(context)!.settings.arguments as Map;
      i++;
    }
    col = data["col"];
    pic = data["pic"];
    zone = data["zone"];
    time = data["time"];

    return Scaffold(
      backgroundColor: col,
      body: SizedBox.expand(
        child: SafeArea(
          child: Container(
            color: col,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/$pic'), fit: BoxFit.cover,
              ),
              color: col,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(13,220,0,0),
                child: Column(
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.edit_location,color:Colors.white),
                      label: const Text("Edit Location", style: TextStyle(color:Colors.white, fontSize: 15, letterSpacing: 1)),
                      onPressed: (){
                        Navigator.pushNamed(context,"/location");
                        setState((){
                          data = ModalRoute.of(context)!.settings.arguments as Map;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      zone,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        )
      ),
    ));
  }
}
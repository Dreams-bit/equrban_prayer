import 'dart:ui';

import 'package:equrban/Homepage/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:compasstools/compasstools.dart';
import 'package:flutter/services.dart';


class QiblatPageState extends StatefulWidget {

  static const routeName = '/qiblatpage';
  const QiblatPageState({ Key? key }) : super(key: key);

  @override
  createState() => QiblatPage();
}

class QiblatPage extends State<QiblatPageState> {
  late int _haveSensor;
  late String sensorType;

  @override
  void initState() {
    super.initState();
    checkDeviceSensors();
  }
  
  Future<void> checkDeviceSensors() async {
    int _haveSensor;
    String sensorType;

     @override
     void initState() {
       super.initState();
       checkDeviceSensors();
    }
     int haveSensor;

    try {
      haveSensor = await Compasstools.checkSensors;


      switch (haveSensor) {
        case 0:
          {
            sensorType = "No sensors for compass!";
          }
          break;


        case 1:
          {
            sensorType = "Accelerometer + Magnetometer!";
          }
          break;


        case 2:
          {
            sensorType = "Gyroscope!";
          }
          break;


        default:
          {
            sensorType = "Error!";
          }
          break;
      }
    } on Exception {}
    if (!mounted) return;
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(82, 183, 136, 1),
              Color.fromRGBO(64, 145, 108, 1),
              Color.fromRGBO(45, 106, 79, 1)
            ], 
          )
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 35,
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    iconSize: 35,
                    color: Colors.white,
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomepageState())
                        );
                    },
                  ),
                  const Text("Homepage",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white
                  ),),
                ],),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25)
                      ),
                      color: Color(0xffF2AF2E)
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const Text("Qiblat",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26
                          ),),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.0)
                                ),
                                primary: Colors.white,
                                minimumSize: const Size(411, 590),
                                maximumSize: const Size(411, 590),
                                ), 
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 25,
                                ),
                                const Icon(
                                  Icons.expand_less,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                const Text("North",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20
                                ),
                                ),
                                StreamBuilder(
                                  stream: Compasstools.azimuthStream,
                                  builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                                    if(snapshot.hasData){
                                      return Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Center(
                                          child:  RotationTransition(
                                            turns:  AlwaysStoppedAnimation(snapshot.data! / 360),
                                            child: Image.asset("assets/images/qiblaB.png"),
                                          )
                                        ),
                                      );
                                    }
                                    else{
                                      return const Text("Error in stream!");
                                    }
                                  },
                              ),
                              ],
                            ))
                        ],
                      ),
                    ),
                  ),    
                ),
            ]
          ),
        )
      ),
    );
  }



  
}
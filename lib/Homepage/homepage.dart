import 'dart:ui';

import 'package:equrban/MainActivity/main_activity.dart';
import 'package:equrban/PrayerPage/prayer_page.dart';
import 'package:equrban/QiblatPage/qiblat.dart';
import 'package:equrban/QurbanStatus/qurban_status.dart';
import 'package:equrban/SurauLocation/map_utils.dart';
import 'package:equrban/SurauLocation/surau_location.dart';
import 'package:equrban/TasbihCounter/tasbih_counter.dart';
import 'package:equrban/ZikirPage/zikir_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';


class HomepageState extends StatefulWidget {

  static const routeName = '/homepage';
  const HomepageState({Key? key }) : super(key: key);

  @override
  createState() => Homepage();
}

class Homepage extends State<HomepageState> {
  final availableMaps = MapLauncher.installedMaps;
  
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
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    iconSize: 35,
                    color: Colors.white,
                    onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => MainActivityState())
                        );
                    },
                  ),
                  Column(
                    children: const <Widget>[
                      Text("Ahlan Wa",
                      style: TextStyle(
                        fontSize: 34,
                        color: Colors.white
                        ),),
                        Text("Sahlan",
                        style: TextStyle(
                          fontSize: 34,
                          color: Colors.white
                        ),),
                    ],
                  ),
                  
                  Image.asset("assets/images/mosque.png",
                  height: 160,
                  width: 120,),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => PrayerPageState())
                                  );
                              }, 
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset("assets/images/prayers.png",
                                  height: 59,
                                  width: 55),
                                  const Text("Prayers",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20
                                  ),),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0)
                                ),
                                primary: Color(0xff3F8F6A),
                                minimumSize: const Size(145, 157),
                                maximumSize: const Size(145, 157),
                                )
                              ),
                              ElevatedButton(
                              onPressed: () async{
                                
                                MapUtils.openMap(5.643728716206963, 100.5444021198659);
                              }, 
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset("assets/images/mosquel.png",
                                  height: 59,
                                  width: 55),
                                  const Text("Mosque Location",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20
                                  ),),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0)
                                ),
                                primary: Color(0xff3F8F6A),
                                minimumSize: const Size(145, 157),
                                maximumSize: const Size(145, 157),
                                )
                              ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => TasbihCounterState())
                                  );
                              }, 
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset("assets/images/tasbih.png",
                                  height: 59,
                                  width: 55),
                                  const Text("Tasbih Counter",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0)
                                ),
                                primary: Color(0xff3F8F6A),
                                minimumSize: const Size(145, 157),
                                maximumSize: const Size(145, 157),
                                )
                              ),
                              ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => ZikirPageState())
                                  );
                              }, 
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset("assets/images/dua.png",
                                  height: 59,
                                  width: 55),
                                  const Text("Doa & Zikr",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20
                                  ),),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0)
                                ),
                                primary: Color(0xff3F8F6A),
                                minimumSize: const Size(145, 157),
                                maximumSize: const Size(145, 157),
                                )
                              ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => QiblatPageState())
                                  );
                              }, 
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset("assets/images/qibla.png",
                                  height: 59,
                                  width: 55),
                                  const Text("Qiblat",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20
                                  ),),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0)
                                ),
                                primary: Color(0xff3F8F6A),
                                minimumSize: const Size(145, 157),
                                maximumSize: const Size(145, 157),
                                )
                              ),
                              ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => QurbanStatusState())
                                );
                              }, 
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset("assets/images/qurban.png",
                                  height: 59,
                                  width: 55),
                                  const Text("Qurban Status",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20
                                  ),),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0)
                                ),
                                primary: Color(0xff3F8F6A),
                                minimumSize: const Size(145, 157),
                                maximumSize: const Size(145, 157),
                                )
                              ),
                          ],
                        ),
                      ],
                    ),
                    )
                ),
            ],
          ),
        ),
      ),
    );
  }
}
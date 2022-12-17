
import 'package:equrban/Homepage/homepage.dart';
import 'package:equrban/PrayerPage/json_connection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class PrayerPageState  extends StatefulWidget {

  static const routeName = '/prayerpage';
  const PrayerPageState({ Key? key }) : super(key: key);

  @override
  createState() => PrayerPage();
}



class PrayerPage extends State<PrayerPageState> {

  JsonConnection jsonConnection = new JsonConnection();
  Position? _currentPosition;
  String? _currentCity;
  String? _currentCountry;


  _getCurrentLocation() {
    Geolocator
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
      .then((Position position) {
        setState(() {
          _currentPosition = position;
          _getAddressFromLatLng();
        });
      }).catchError((e) {
        print(e);
      });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition!.latitude,
        _currentPosition!.longitude
      );

      Placemark place = placemarks[0];

      setState(() {
        _currentCity = "${place.locality}";
        _currentCountry = "${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
 
  @override
  Widget build(BuildContext context) {
    _getCurrentLocation();
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 33,
                      vertical: 15
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25)
                      ),
                      color: Color(0xffF2AF2E)
                    ),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 31,
                          ),
                          Text("Prayers Time",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26
                          ),),
                          SizedBox(
                            height: 40,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              child: Text("",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17
                                ),),
                                ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(
                                            child: Text("",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17
                                              ),),
                                              ),
                                              SizedBox(
                                                child: Icon(
                                                  Icons.location_pin
                                                ),
                                              ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 34,
                                    ),
                          Expanded(
                            child: FutureBuilder(
                              future: jsonConnection.getPTLocation(),
                              builder: (BuildContext context, AsyncSnapshot snapshot){
                                if(snapshot.hasData){
                                  return Column(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14.0)
                                        ),
                                        elevation: 3,
                                        child: ListTile(
                                          title: Text("Imsak"),
                                          trailing: Text(snapshot.data.data.timings.imsak),
                                        ),
                                      ),
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14.0)
                                        ),
                                        elevation: 3,
                                        child: ListTile(
                                          title: Text("Fajr"),
                                          trailing: Text(snapshot.data.data.timings.fajr),
                                        ),
                                      ),
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14.0)
                                        ),
                                        elevation: 3,
                                        child: ListTile(
                                          title: Text("Dhuhr"),
                                          trailing: Text(snapshot.data.data.timings.dhuhr),
                                        ),
                                      ),
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14.0)
                                        ),
                                        elevation: 3,
                                        child: ListTile(
                                          title: Text("Asr"),
                                          trailing: Text(snapshot.data.data.timings.asr),
                                        ),
                                      ),
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14.0)
                                        ),
                                        elevation: 3,
                                        child: ListTile(
                                          title: Text("Magribh"),
                                          trailing: Text(snapshot.data.data.timings.maghrib),
                                        ),
                                      ),
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14.0)
                                        ),
                                        elevation: 3,
                                        child: ListTile(
                                          title: Text("Isha"),
                                          trailing: Text(snapshot.data.data.timings.isha),
                                        ),
                                      ),
                                        ],
                                      ),
                                      
                                    ],
                                  );
                                }else{
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ),
            ]
          ),
        )
      ),
    );
  }
}
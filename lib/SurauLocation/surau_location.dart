import 'package:equrban/Homepage/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SurauLocationState  extends StatefulWidget {
  
  static const routeName = '/suraulocation';
  const SurauLocationState({ Key? key }) : super(key: key);

  @override
  createState() => SurauLocation();
}

class SurauLocation extends State<SurauLocationState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
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
                    horizontal: 35,
                    vertical: 25
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Text("Surau Location",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              width: 285,
                              height: 42,
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32),
                                    borderSide: BorderSide.none,
                                  )
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)
                                  ),
                                  primary: Colors.white,
                                  minimumSize: const Size(54, 38),
                                  maximumSize: const Size(54, 38),
                                  ),
                                  onPressed: () {}, 
                                  child: const Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  )),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ),
          ]
        ),
      )
    );
  }
}
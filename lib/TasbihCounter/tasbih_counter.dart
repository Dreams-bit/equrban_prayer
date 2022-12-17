import 'dart:ui';

import 'package:equrban/Homepage/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TasbihCounterState  extends StatefulWidget {
  const TasbihCounterState({ Key? key }) : super(key: key);

  @override
  createState() => TasbihCounter();
}

class TasbihCounter extends State<TasbihCounterState> {
  
  int _counter = 0;
  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter(){
    setState(() {
      _counter = _counter -1;
    });
  }
  void _resetCounter(){
    setState(() {
      _counter = 0;
    });
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
                          const Text("Tasbih Counter",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26
                          ),),
                          const SizedBox(
                              height: 42,
                            ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.0)
                                ),
                                primary: Colors.white,
                                minimumSize: const Size(356, 193),
                                maximumSize: const Size(356, 193),
                                ),
                            onPressed: (){}, 
                            child: Container(
                              width: 300,
                              height: 88,
                              decoration: BoxDecoration(
                                color: const Color(0xffDBDBDB),
                                borderRadius: BorderRadius.circular(14)
                              ),
                              child: Center(
                                child: Text(_counter.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 56
                                ),),
                              )
                            )
                            ),
                            const SizedBox(
                              height: 56,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.0)
                                ),
                                primary: const Color(0xffDBDBDB),
                                minimumSize: const Size(356, 62),
                                maximumSize: const Size(356, 62),
                              ),
                              onPressed: () {
                                _resetCounter();
                              }, 
                              child: const Text("Reset",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35
                              ),)
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    _decrementCounter();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.0)
                                    ),
                                    primary: const Color(0xffFFFFFF),
                                    minimumSize: const Size(135, 105),
                                    maximumSize: const Size(135, 105),
                                    ), 
                                    child: const Icon(
                                      Icons.remove,
                                      size: 50,
                                      color: Colors.black,
                                    )
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _incrementCounter();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.0)
                                    ),
                                    primary: const Color(0xffFFFFFF),
                                    minimumSize: const Size(135, 105),
                                    maximumSize: const Size(135, 105),
                                    ), 
                                    child: const Icon(
                                      Icons.add,
                                      size: 50,
                                      color: Colors.black,
                                    )
                                ),
                              ],
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
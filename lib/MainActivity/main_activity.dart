import 'package:equrban/Homepage/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainActivityState extends StatefulWidget{

  static const routeName = '/main';

  const MainActivityState({Key? key}) : super(key: key);
  @override
  createState() => MainActivity();

}

class MainActivity extends State<MainActivityState>{
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: Image.asset("assets/images/mosque.png"),
              width: 155,
              height: 156,
            ),
            SizedBox(
              height: 25,
            ),
            const Text("Surau Al-Muhajirin",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            )
            ),
            const Text("Zon Anggerik",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            )
            ),
            SizedBox(
              height: 123,
            ),
            const Text(""" "Islam itu Mudah" """,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
            )
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xffE09600),
                padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 17),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0)
                )
              ),
              onPressed: () {
                Navigator.push(context,
                 MaterialPageRoute(
                   builder: (context) => const HomepageState(
                    
                   ),
                   ));
              }, 
              child: const Text("Get Started",
              style: TextStyle(
                color: Colors.black,
                fontSize: 19
              ),))
          ],
        ),
          ),
      ),
    );
    
  }
}
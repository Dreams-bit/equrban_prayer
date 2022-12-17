import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:equrban/Homepage/homepage.dart';
import 'package:equrban/ZikirPage/dua_model.dart';
import 'package:equrban/ZikirPage/zikr_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ZikirPageState  extends StatefulWidget {

  static const routeName = '/zikirpage';
  const ZikirPageState({ Key? key }) : super(key: key);

  @override
  createState() => ZikirPage();
}

class ZikirPage extends State<ZikirPageState> {

  Future<List<Dua>> ReadJsonDua() async{
    final jsonData = await rootBundle.loadString('assets/jsonfile/dua.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => Dua.fromJson(e)).toList();
  }

  Future<List<Zikr>> ReadJsonZikr() async{
    final jsonData = await rootBundle.loadString('assets/jsonfile/zikr.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => Zikr.fromJson(e)).toList();
  }

  int _currentIndex = 0;

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
      child: DefaultTabController(
        length: 3,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("Doa & Zikir",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 26
                            ),),
                            DefaultTabController(
                              length: 2,
                              initialIndex: 0, 
                              child: Column(
                                children: <Widget>[
                                  Container(
                                  padding: const EdgeInsets.all(35),
                                  child: const TabBar(
                                    indicatorColor: Color(0xff3F8F6A),
                                  labelColor: Color(0xff3F8F6A),
                                  unselectedLabelColor: Colors.white,
                                  labelStyle: TextStyle(
                                    fontSize: 23
                                  ),
                                  tabs: [
                                    Tab(text: "Doa",),
                                    Tab(text: "Zikir"),
                                  ],
                                ),
                               ),
                               Container(
                                 height: 470,
                                 child: TabBarView(
                                   children: <Widget>[
                                     Container(
                                       child: FutureBuilder(
                                         future: ReadJsonDua(),
                                         builder: (context, data){
                                           if(data.hasError){
                                             return Center(
                                               child: Text("has error")
                                             );
                                           }else if(data.hasData){
                                             var items = data.data as List<Dua>;
                                             return CarouselSlider.builder(
                                                    itemCount: items == null? 0: items.length,
                                                    options: CarouselOptions(height:300,enlargeCenterPage: true), 
                                                    itemBuilder: (context,index,realIndex){
                                                      return Container(
                                                           width: 360,
                                                           child: Card(
                                                             shape: RoundedRectangleBorder(
                                                               borderRadius: BorderRadius.circular(12.0)
                                                             ),
                                                             child: Column(
                                                               children: <Widget>[
                                                                SizedBox(
                                                                  height: 22,
                                                                ),      
                                                                 Container(
                                                                   width: 320,
                                                                   height: 225,
                                                                   child: Card(
                                                                     shape: RoundedRectangleBorder(
                                                                       borderRadius: BorderRadius.circular(12.0),
                                                                       side: BorderSide(
                                                                         color: Color(0xffE09600),
                                                                         width: 3
                                                                       )
                                                                     ),
                                                                     child: Column(
                                                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                       children: <Widget>[
                                                                         Text(items[index].title.toString(),
                                                                         textAlign: TextAlign.center,
                                                                         style: TextStyle(
                                                                           fontWeight: FontWeight.bold,
                                                                           fontSize: 18
                                                                         ),
                                                                         ),
                                                                         Text(items[index].dua.toString(),
                                                                         textAlign: TextAlign.center,
                                                                         style: TextStyle(
                                                                           fontWeight: FontWeight.w900
                                                                         ),
                                                                         ),
                                                                         Text(items[index].meaning.toString(),
                                                                         textAlign: TextAlign.center,
                                                                         style: TextStyle(
                                                                           fontWeight: FontWeight.w500,
                                                                           fontStyle: FontStyle.italic,
                                                                           fontSize: 10,
                                                                         ),
                                                                         ),
                                                                       ],
                                                                     ),
                                                                   ),
                                                                 )
                                                               ],
                                                             ),
                                                           ),
                                                         );
                                                    }, 
                                                   
                                                    );
                                           }else{
                                             return Center(child: CircularProgressIndicator(),);
                                           }
                                           }
                                       )
                                         ),
                                         Container(
                                       child: FutureBuilder(
                                         future: ReadJsonZikr(),
                                         builder: (context, data){
                                           if(data.hasError){
                                             return Center(
                                               child: Text("has error")
                                             );
                                           }else if(data.hasData){
                                             var items = data.data as List<Zikr>;
                                             return CarouselSlider.builder(
                                                    itemCount: items == null? 0: items.length,
                                                    options: CarouselOptions(height:300,enlargeCenterPage: true), 
                                                    itemBuilder: (context,index,realIndex){
                                                      return Container(
                                                           width: 360,
                                                           child: Card(
                                                             shape: RoundedRectangleBorder(
                                                               borderRadius: BorderRadius.circular(12.0)
                                                             ),
                                                             child: Column(
                                                               children: <Widget>[
                                                                SizedBox(
                                                                  height: 22,
                                                                ),      
                                                                 Container(
                                                                   width: 320,
                                                                   height: 225,
                                                                   child: Card(
                                                                     shape: RoundedRectangleBorder(
                                                                       borderRadius: BorderRadius.circular(12.0),
                                                                       side: BorderSide(
                                                                         color: Color(0xffE09600),
                                                                         width: 3
                                                                       )
                                                                     ),
                                                                     child: Column(
                                                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                       children: <Widget>[
                                                                         Text(items[index].zikr.toString(),
                                                                         textAlign: TextAlign.center,
                                                                         style: TextStyle(
                                                                           fontWeight: FontWeight.bold,
                                                                           fontSize: 18
                                                                         ),
                                                                         ),
                                                                         Text(items[index].pronounce.toString(),
                                                                         textAlign: TextAlign.center,
                                                                         style: TextStyle(
                                                                           fontWeight: FontWeight.w900
                                                                         ),
                                                                         ),
                                                                         Text(items[index].meaning.toString(),
                                                                         textAlign: TextAlign.center,
                                                                         style: TextStyle(
                                                                           fontWeight: FontWeight.w500,
                                                                           fontStyle: FontStyle.italic,
                                                                           fontSize: 10,
                                                                         ),
                                                                         ),
                                                                       ],
                                                                     ),
                                                                   ),
                                                                 )
                                                               ],
                                                             ),
                                                           ),
                                                         );
                                                    }, 
                                                   
                                                    );
                                           }else{
                                             return Center(child: CircularProgressIndicator(),);
                                           }
                                           }
                                       )
                                         ),
                                         
    
    
    
    
    
    
    
    
                                   ]
                                   ),
                               )
                              ] 
                            ),
                           )
                          ],     
                        ),
                      ),
                    ),    
                  ),
              ]
            ),
          )
        ),
      ),
    );
  }
}
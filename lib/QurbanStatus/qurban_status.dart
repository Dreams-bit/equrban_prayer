import 'dart:convert';
import 'package:equrban/QurbanStatus/price.dart';
import 'package:equrban/QurbanStatus/status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Homepage/homepage.dart';

class QurbanStatusState  extends StatefulWidget {
  const QurbanStatusState({ Key? key }) : super(key: key);

  @override
  createState() => QurbanStatus();
}

class QurbanStatus extends State<QurbanStatusState> {
  TextEditingController ic_number = TextEditingController();

  List<Status> _filtered_korban_data = [];

  List<Status> _korban_data = [];
  List<Price> _qurban_price = [];

  Future<List<Status>> getData() async{
    String url = "http://192.168.100.26/qurban_data/getData.php";
    http.Response response = await http.get(Uri.parse(url));
    final data = await json.decode(response.body);

    List<Status> korban_datas = [];
    for(var korban_data in data){
        korban_datas.add(Status.fromJson(korban_data));
    }

    return (korban_datas);
  }

  Future<List<Price>> getQurbanPrice() async{
    String url = "http://192.168.100.26/qurban_data/getQurbanPrice.php";
    http.Response response = await http.get(Uri.parse(url));
    final data = await json.decode(response.body);

    List<Price> qurban_prices = [];
    for(var qurban_price in data){
        qurban_prices.add(Price.fromJson(qurban_price));
    }
    
    return (qurban_prices);
  }




  int isSync = 0;
  //Data will be binded to the flutter UI
  String searchText = "";
  late DataRow getDataUI;

  getDataByIc(){
    _filtered_korban_data.clear();
    for(var detail in _korban_data){
            //2. find IC
            if(detail.ic_number == searchText)
            { 
              _filtered_korban_data.add(detail);
            }
    }
  }

List<DataRow> getDataRow(){

        if(isSync == 0){
          _filtered_korban_data.clear();

            return _filtered_korban_data.map((e) => 
            DataRow(
            cells: [
              DataCell(Text('#')),
              DataCell(Text("")),
              DataCell(Text(""))
            ])
            ).toList();
        } else {
          int bilangan = 0; 
          return
          _filtered_korban_data.map((e) => 
            DataRow(
            cells: [
              DataCell(Text(e.peserta_name?? e.peserta_name.toString())),
              DataCell(Text(e.hari_korban?? e.hari_korban.toString())),
              DataCell(Text(e.waktu_sembelihan?? e.waktu_sembelihan.toString()))
            ])
            ).toList();

        // for(var data in _filtered_korban_data){
        //   setState(() {
            
           
        //     getDataUI = DataRow(
        //       cells: [
        //           DataCell(Text('1')),  
        //           DataCell(Text( data.peserta_name?? data.peserta_name.toString())),  
        //           DataCell(Text(data.hari_korban?? data.hari_korban.toString(),
        //           style: TextStyle(
        //             fontSize: 11
        //           ),)),
                  
        //           ],
        //       );    
        //   });
        //   break;
        //   }
        }

  }


  @override
  void initState(){
    super.initState();
    getData().then((value){
      setState(() {
        _korban_data.addAll(value);
      });
    });
    getQurbanPrice().then((e){
      setState(() {
        _qurban_price.addAll(e);
      });
    });
     isSync = 0;

  }
  

  @override
  Widget build(BuildContext context) {
    getQurbanPrice();
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
        resizeToAvoidBottomInset: false,
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
                          const Text("Qurban Current Price",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26
                          ),),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {}, 
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset("assets/images/meat.png",
                                  height: 70,
                                  width: 80),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("One cow portion",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text("RM " + (_qurban_price.isNotEmpty? _qurban_price[0].harga_qurban_bahagian.toString() : ".")),
                                  )
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0)
                                ),
                                primary: Color(0xFFFFFF),
                                minimumSize: const Size(185, 157),
                                maximumSize: const Size(185, 157),
                                )
                              ),
                              ElevatedButton(
                              onPressed: () {
                                
                              }, 
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset("assets/images/cow.png",
                                  height: 70,
                                  width: 80),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("One whole Cow",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18
                                    ),),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text("RM " + (_qurban_price.isNotEmpty? _qurban_price[0].harga_qurban_seekor.toString() : "-")),
                                  )
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0)
                                ),
                                primary: Color(0xFFFFFF),
                                minimumSize: const Size(185, 157),
                                maximumSize: const Size(185, 157),
                                )
                              ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: 340,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text("You can check your qurban status here :")
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 285,
                                  child: TextField( 
                                    controller: ic_number,
                                    onChanged: (value) => setState(() {
                                      searchText = value;
                                    }),
                                    autofocus: false,
                                    keyboardType: TextInputType.number,
                                    style:
                                        TextStyle(fontSize: 22.0, color: Colors.black),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'IC number',
                                      contentPadding: const EdgeInsets.only(
                                          left: 14.0, bottom: 8.0, top: 8.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.white),
                                        borderRadius: new BorderRadius.circular(32),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.white),
                                        borderRadius: new BorderRadius.circular(32),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 49,
                                  width: 50,
                                  child: ElevatedButton(
                                    onPressed: (){
                                      if(searchText!="")
                                      {
                                        setState(() {
                                          isSync = 1;
                                        });
                                        getDataByIc();
                                                                    
                                      }else {
                                        setState(() {
                                          isSync = 0;
                                        });
                                      }                              
                                    }, 
                                    child: Icon(
                                      Icons.person_search_rounded,
                                      color: Colors.black,
                                    ),
                                    
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0)
                                      ),
                                      primary: Colors.white,
                                      minimumSize: const Size(54, 38),
                                      maximumSize: const Size(54, 38),
                                      )
                                  ),
                                ),
                              ]
                            ),
                          ],
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.0)
                                ),
                                primary: Colors.white,
                                minimumSize: const Size(345, 38),
                                maximumSize: const Size(380, 250),
                                ),
                            onPressed: (){
                              
                            }, 
                            child: Container(
                              height: double.infinity,
                              child: DataTable(  
                                columns: const [  
                                  DataColumn(label: Text(  
                                      'Nama',  
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)  
                                  )),  
                                  DataColumn(label: Text(  
                                      'Hari',  
                                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)  
                                  )),  
                                  DataColumn(label: Text(  
                                      'Waktu',  
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)  
                                  )),  
                                ],  
                                rows:
                                getDataRow()
                              ),
                            ),  
                          ),
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
import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Data_Model/Lecturer/Lecturer_Information.dart';


class LecturerHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<LecturerHomePage> {

  List<Lecturer_Information> information = [];

  Future<List<Lecturer_Information>> fetchInformation() async {

    List<Lecturer_Information> infor = [];
    var url = 'http://localhost:3000/Lecturer_information';

    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var urjson = json.decode(response.body);

      for(var jsondata in urjson){
        infor.add(Lecturer_Information.fromJson(jsondata));
      }
    }
    return infor;
  }

  @override
  void initState(){
    fetchInformation().then((value) {
      setState(() {
        information.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final data = ModalRoute.of(context)?.settings?.arguments as Map<String, String?>;
    int? id = int.parse(data['ID']!) - 1;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(105, 184, 165, 1.0),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            iconSize: 40,
            color: const Color.fromRGBO(255, 255, 255, 1.0),
          ),
          title:Text(
            'Home',
            style: const TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1.0),
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
              iconSize: 40,
              color: const Color.fromRGBO(255, 255, 255, 1.0),
            ),
            IconButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              icon: const Icon(Icons.logout),
              iconSize: 40,
              color: const Color.fromRGBO(255, 255, 255, 1.0),
            ),
          ],
        ),
        body: Wrap(
            children: [
              Container(
                color: const Color.fromRGBO(105, 184, 165, 0.5),
                width: 200.0,
                height: 1200.0,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        child: TextButton(
                          child: const Text(
                            'Account',
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1.0),
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () { },
                        ),
                      ),
                    ),
                    const Divider(height: 20.0, thickness: 1, color: Colors.black),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextButton(
                        child: const Text(
                          'Question Bank',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.6),
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/LecturerQuestionBank');
                          }
                      ),
                    ),
                    const Divider(height: 20.0, thickness: 1, color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: TextButton(
                          child: const Text(
                            'Performance',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.6),
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/LecturerPerformance');
                          },
                        ),
                      ),
                    ),
                    const Divider(height: 20.0, thickness: 1, color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: TextButton(
                          child: const Text(
                            'Contact Us',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.6),
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: (){},
                        ),
                      ),
                    ),
                    const Divider(height: 20.0, thickness: 1, color: Colors.black),
                  ],
                ),
              ),

              Transform.translate(
                offset: Offset(45.0,-40.0),
                child : Padding(
                  padding: const EdgeInsets.all(150.0),
                  child: Container(
                    height: 500.0,
                    width: 1000.0,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 0.8),
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child:  Row(
                      children: [
                        SizedBox(width: 80),
                        ClipOval (
                          child :Image.network(
                            'https://cdn130.picsart.com/317989064177201.jpg',
                            width:300,
                            height:300,
                            fit:BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 80),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                  'Name                 : ${information[id].name}',
                                  style : TextStyle(
                                    fontSize:30,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              Text(
                                  'Lecture ID          : ${information[id].lecturerId}',
                                  style : TextStyle(
                                    fontSize:30,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              Text(
                                  'Position             : ${information[id].position}',
                                  style : TextStyle(
                                    fontSize:30,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              Text(
                                  'Department       : ${information[id].department}',
                                  style : TextStyle(
                                    fontSize:30,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              Text(
                                  'Faculty               : ${information[id].faculty}',
                                  style : TextStyle(
                                    fontSize:30,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              Text(
                                  'Status                : ${information[id].status}',
                                  style : TextStyle(
                                    fontSize:30,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              Text(
                                  'Phone Number : ${information[id].phoneNumber}',
                                  style : TextStyle(
                                    fontSize:30,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )

            ],
            ),
        );
    }
}

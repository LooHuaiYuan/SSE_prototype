import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';
import '../../Data_Model/Student/Student_Information.dart';
import 'package:http/http.dart' as http;


class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}
class _StudentHomePageState extends State<StudentHomePage> {

  late Future<List<Student_Information>> information;

  Future<List<Student_Information>> fetchInformation() async{

    var url = 'http://localhost:3000/Student_information';

    final response = await http.get(Uri.parse(url));
    final urjson = json.decode(response.body);
    List<Student_Information> info;
    info = List<Student_Information>.from(urjson.map(
            (jsondata) => Student_Information.fromJson(jsondata)));
    return info;
  }


  @override
  void initState () {
    super.initState();
    information = fetchInformation();
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
        title: const Text(
          'Home Page',
          style: TextStyle(
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
                        Navigator.pushNamed(context, '/StudentQuestionBank');
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
                        Navigator.pushNamed(context, '/StudentPerformance');
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
                child: Row(
                  children: [
                    SizedBox(width: 80),
                    ClipOval (
                      child :Image.network(
                        'https://avatars.githubusercontent.com/u/25801929?v=4',
                        width:300,
                        height:300,
                        fit:BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 80),
                FutureBuilder<List<Student_Information>>(
                  future: information,
                  builder: (context, snapshot){
                    return Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                              'Name                 : ${snapshot.data![id].name}',
                              style : TextStyle(
                                fontSize:30,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          Text(
                              'Student ID          : ${snapshot.data![id].studentId}',
                              style : TextStyle(
                                fontSize:30,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          Text(
                              'Faculty               : ${snapshot.data![id].faculty}',
                              style : TextStyle(
                                fontSize:30,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          Text(
                              'Course               : ${snapshot.data![id].course}',
                              style : TextStyle(
                                fontSize:30,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          Text(
                              'Status                : ${snapshot.data![id].status}',
                              style : TextStyle(
                                fontSize:30,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          Text(
                              'Phone Number : ${snapshot.data![id].phoneNumber}',
                              style : TextStyle(
                                fontSize:30,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                        ],
                      ),
                    );
                  },

                ),
                    ],
                    ),
                    ),
                ),
              ),
    ],
            ),
          );

  }
}

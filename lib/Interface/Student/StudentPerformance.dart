import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:http/http.dart' as http;
import '../../Data_Model/Student/Student_Performance.dart';
import 'dart:convert';
import 'dart:core';



class StudentPerformance extends StatefulWidget {
  @override
  _StudentPerformanceState createState() => _StudentPerformanceState();
}

class _StudentPerformanceState extends State<StudentPerformance> {

  var index = 0;
  String subjectdropdownvalue = 'SSE3301';
  var subject = ['CSC3100', 'CSC3200', 'SSE3201', 'SSE3301'];

  String examexercisedropdownvalue = 'Exam';
  var type = ['Exam', 'Exercise'];

  String titledropdownvalue = 'Test 1';
  var title = ['Test 1', 'Test 2', 'Test 3', 'Exercise 1', 'Exercise 2'];

  final ticks = [20, 40, 60, 80, 100];
  final pentagonLabels = [
    'Time Management',
    'Critical thinking (C2)',
    'Creative thinking (C3)',
    'Problem Solving (C4)',
    'Knowledge mastery (C1)'
  ];

  final pentagondata = [[20, 40, 60 , 80, 100]
  ];
  final pentagondatas = [
    [20, 40, 60, 80, 100],
    [20, 10, 60, 10, 10],
    [20, 10, 90, 80, 100],
    [20, 40, 60, 70, 10],
    [10, 30, 50, 70, 90],
    [15, 25, 35, 45, 55],
    [5, 15, 25, 35, 45],
    [50, 40, 30, 20, 10],
    [25, 35, 45, 55, 65],
  ];

  final timeSpents = ['45 mins', '1 hour', '1 hour and 15 mins', '1 hour and 30 mins', '2 hours'];
  final overallScores = ['50%', '60%', '70%', '80%', '90%', '100%'];
  final q1 = [1, 2, 1.5, 2.5, 3];
  final q2 = [2.5, 1, 3, 2, 1.5];
  final q3 = [2, 1.5, 1, 3, 2.5];



  @override
  Widget build(BuildContext context) {

    bool check = true;

    List<DataRow> rows = [
      DataRow(key: UniqueKey(), cells: [
        DataCell(Text('Jacob')),
        DataCell(Text(timeSpents[0])),
        DataCell(Text(overallScores[0])),
        DataCell(Text('')),
        DataCell(Text(q1[0].toString())),
        DataCell(Text(q2[0].toString())),
        DataCell(Text(q3[0].toString())),
      ]),
      DataRow(key: UniqueKey(), cells: [
        DataCell(Text('Jacob')),
        DataCell(Text(timeSpents[1])),
        DataCell(Text(overallScores[1])),
        DataCell(Text('')),
        DataCell(Text(q1[1].toString())),
        DataCell(Text(q2[1].toString())),
        DataCell(Text(q3[1].toString())),
      ]),
      DataRow(key: UniqueKey(), cells: [
        DataCell(Text('Jacob')),
        DataCell(Text(timeSpents[2])),
        DataCell(Text(overallScores[2])),
        DataCell(Text('')),
        DataCell(Text(q1[2].toString())),
        DataCell(Text(q2[2].toString())),
        DataCell(Text(q3[2].toString())),
      ]),
      DataRow(key: UniqueKey(), cells: [
        DataCell(Text('Jacob')),
        DataCell(Text(timeSpents[3])),
        DataCell(Text(overallScores[3])),
        DataCell(Text('')),
        DataCell(Text(q1[3].toString())),
        DataCell(Text(q2[3].toString())),
        DataCell(Text(q3[3].toString())),
      ]),
      DataRow(key: UniqueKey(), cells: [
        DataCell(Text('Jacob')),
        DataCell(Text(timeSpents[4])),
        DataCell(Text(overallScores[4])),
        DataCell(Text('')),
        DataCell(Text(q1[4].toString())),
        DataCell(Text(q2[4].toString())),
        DataCell(Text(q3[4].toString())),
      ])
    ];

    List<DataRow> row = [DataRow(key: UniqueKey(), cells: [
      DataCell(Text('Jacob')),
      DataCell(Text(timeSpents[0])),
      DataCell(Text(overallScores[0])),
      DataCell(Text('')),
      DataCell(Text(q1[0].toString())),
      DataCell(Text(q2[0].toString())),
      DataCell(Text(q3[0].toString())),
    ]),];

    void updateData(index) {
      setState(() {
        // Modify the data as needed
        row[0] = rows[1];
        pentagondata[0] = pentagondatas[index];
      });
    }

    print(index);
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
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                            color: Color.fromRGBO(255, 255, 255, 0.6),
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  const Divider(
                      height: 20.0, thickness: 1, color: Colors.black),
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
                          Navigator.popAndPushNamed(
                              context, '/StudentQuestionBank');
                        }
                    ),
                  ),
                  const Divider(
                      height: 20.0, thickness: 1, color: Colors.black),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: TextButton(
                        child: const Text(
                          'Performance',
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1.0),
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const Divider(
                      height: 20.0, thickness: 1, color: Colors.black),
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
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const Divider(
                      height: 20.0, thickness: 1, color: Colors.black),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 20.0, 0.0, 0.0),
                      child: Container(
                        height: 40.0,
                        width: 200.0,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(240, 240, 240, 0.8),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Subject:',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1.0),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 30.0,
                              width: 100.0,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(200, 200, 200, 0.8),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(40)),
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(width: 5),
                                    DropdownButton(
                                      value: subjectdropdownvalue,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      items: subject.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          subjectdropdownvalue = newValue!;
                                          index = index + 1;
                                          if (index == 10) {
                                            index = 0;
                                          }
                                          updateData(index);
                                        });
                                      },
                                    )
                                  ]
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 20.0, 0.0, 0.0),
                      child: Container(
                        height: 40.0,
                        width: 200.0,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(240, 240, 240, 0.8),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Title:',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1.0),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 30.0,
                              width: 120.0,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(200, 200, 200, 0.8),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(40)),
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(width: 5),
                                    DropdownButton(
                                      value: titledropdownvalue,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      items: title.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          titledropdownvalue = newValue!;
                                          index = index + 1;
                                          if (index == 10) {
                                            index = 0;
                                          }
                                          updateData(index);
                                        });
                                      },
                                    )
                                  ]
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(
                            500.0, 10.0, 0.0, 0.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(240, 240, 240,
                                0.8), // Adjust the color and opacity as needed
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.filter_alt_outlined),
                            iconSize: 40,
                            color: Colors.black, // Change the icon color
                          ),
                        )
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(200.0, 30.0, 0.0, 0.0),
                  child: DataTable(
                    key: UniqueKey(),
                    border: TableBorder.all(width: 1.0),
                    columnSpacing: 30.0,

                    columns: const [
                      DataColumn(label: Text('Student Name',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),
                      DataColumn(label: Text('Time Spent',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),
                      DataColumn(label: Text('Overall Scores',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),
                      DataColumn(label: Text('Question/Total Mark',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),
                      DataColumn(label: Text('Q1/2',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),
                      DataColumn(label: Text('Q2/1',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),
                      DataColumn(label: Text('Q3/3',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ),
                    ],
                    rows: row,
                  ),

                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(200.0, 30.0, 0.0, 0.0),
                  child: Row(
                    children: [
                      Container(
                        width: 800,
                        height: 400,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 215, 125, 0.2),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        padding: const EdgeInsets.fromLTRB(
                            10.0, 10.0, 10.0, 10.0),
                        child: RadarChart(
                          ticks: ticks,
                          features: pentagonLabels,
                          featuresTextStyle: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          data: pentagondata,
                          reverseAxis: false,
                          sides: 5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

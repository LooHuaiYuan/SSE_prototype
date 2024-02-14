import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';


class LecturerPerformance extends StatefulWidget {
  @override
  _LecturerPerformanceState createState() => _LecturerPerformanceState();
}

class _LecturerPerformanceState extends State<LecturerPerformance> {

  var value = [
    [
  StudentScore('Average', 67, charts.ColorUtil.fromDartColor(Colors.blue)),
  StudentScore('Jackson', 25, charts.ColorUtil.fromDartColor(Colors.orange)),
  StudentScore('Jacob', 100, charts.ColorUtil.fromDartColor(Colors.purple)),
  StudentScore('Mandy', 75, charts.ColorUtil.fromDartColor(Colors.green)),
    ],
    [
    StudentScore('Average', 70, charts.ColorUtil.fromDartColor(Colors.blue)),
    StudentScore('Jackson', 65, charts.ColorUtil.fromDartColor(Colors.orange)),
    StudentScore('Jacob', 87, charts.ColorUtil.fromDartColor(Colors.purple)),
    StudentScore('Mandy', 59, charts.ColorUtil.fromDartColor(Colors.green)),
    ],
    [
      StudentScore('Average', 65, charts.ColorUtil.fromDartColor(Colors.blue)),
      StudentScore('Jackson', 45, charts.ColorUtil.fromDartColor(Colors.orange)),
      StudentScore('Jacob', 90, charts.ColorUtil.fromDartColor(Colors.purple)),
      StudentScore('Mandy', 60, charts.ColorUtil.fromDartColor(Colors.green)),
    ],
    [
      StudentScore('Average', 90, charts.ColorUtil.fromDartColor(Colors.blue)),
      StudentScore('Jackson', 100, charts.ColorUtil.fromDartColor(Colors.orange)),
      StudentScore('Jacob', 95, charts.ColorUtil.fromDartColor(Colors.purple)),
      StudentScore('Mandy', 85, charts.ColorUtil.fromDartColor(Colors.green)),
    ],
    [
      StudentScore('Average', 50, charts.ColorUtil.fromDartColor(Colors.blue)),
      StudentScore('Jackson', 80, charts.ColorUtil.fromDartColor(Colors.orange)),
      StudentScore('Jacob', 40, charts.ColorUtil.fromDartColor(Colors.purple)),
      StudentScore('Mandy', 30, charts.ColorUtil.fromDartColor(Colors.green)),
    ],

  ];

  final List<charts.Series<StudentScore, String>> _data = [
    charts.Series<StudentScore, String>(
      id: 'student',
      domainFn: (StudentScore student, _) => student.name,
      measureFn: (StudentScore student, _) => student.score,
      colorFn: (StudentScore student, _) => student.barColor,
      data: [
        StudentScore('Average', 67, charts.ColorUtil.fromDartColor(Colors.blue)),
        StudentScore('Jackson', 25, charts.ColorUtil.fromDartColor(Colors.orange)),
        StudentScore('Jacob', 100, charts.ColorUtil.fromDartColor(Colors.purple)),
        StudentScore('Mandy', 75, charts.ColorUtil.fromDartColor(Colors.green)),
      ],
    ),
  ];



  String subjectdropdownvalue = 'SSE3301';
  var subject = ['CSC3100', 'CSC3200', 'SSE3201', 'SSE3301'];

  String examexercisedropdownvalue = 'Exam';
  var type = ['Exam', 'Exercise'];

  String titledropdownvalue = 'Test 1';
  var title = ['Test 1', 'Test 2', 'Test 3', 'Exercise 1', 'Exercise 2'];

  final List<Map<String, String>> studentData = [
    {
      'name': 'Jackson',
      'timeSpent': '1 hour 25 mins',
      'overallScores': '88%',
      'q1': '2',
      'q2': '1',
      'q3': '1.5',
    },
    {
      'name': 'Lily',
      'timeSpent': '55 mins',
      'overallScores': '60%',
      'q1': '2',
      'q2': '1',
      'q3': '2',
    },
    {
      'name': 'Jacob',
      'timeSpent': '1 hour',
      'overallScores': '34%',
      'q1': '1.5',
      'q2': '0',
      'q3': '2',
    },
    {
      'name': 'Mandy',
      'timeSpent': '1 hour 29 mins',
      'overallScores': '20%',
      'q1': '1',
      'q2': '0',
      'q3': '1.5',
    },
  ];

  var index = 0;

  @override
  Widget build(BuildContext context) {

    void updateData(index) {
      setState(() {
        _data[0] = charts.Series<StudentScore, String>(
          id: 'student',
          domainFn: (StudentScore student, _) => student.name,
          measureFn: (StudentScore student, _) => student.score,
          colorFn: (StudentScore student, _) => student.barColor,
          data: value[index],
        );
      });
    }

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
                        Navigator.popAndPushNamed(context, '/LecturerQuestionBank');
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
                          color: Color.fromRGBO(0, 0, 0, 1.0),
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {},
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
                              borderRadius: BorderRadius.all(Radius.circular(40)),
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
                                        if (index == 5) {
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
                              borderRadius: BorderRadius.all(Radius.circular(40)),
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
                                        if (index == 5) {
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
                      padding: const EdgeInsets.fromLTRB(500.0, 10.0, 0.0, 0.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(240, 240, 240, 0.8), // Adjust the color and opacity as needed
                        ),
                        child: IconButton(
                          onPressed: () {
                            // Implement your filter logic here
                          },
                          icon: const Icon(Icons.filter_alt_outlined),
                          iconSize: 40,
                          color: Colors.black, // Change the icon color
                        ),
                      )
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(150.0, 20.0, 0.0, 0.0),
                child: Container(
                  height: 30.0,
                  width: 300.0,
                  child: const Text(
                    'Overall Performance:',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1.0),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(150.0, 10.0, 0.0, 0.0),
                child: DataTable(
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
                  rows: List.generate(
                    studentData.length,
                        (index) => DataRow(cells: [
                      DataCell(
                        Align(
                          alignment: Alignment.center,
                          child: Text(studentData[index]['name']!),
                        ),
                      ),
                      DataCell(
                        Align(
                          alignment: Alignment.center,
                          child: Text(studentData[index]['timeSpent']!),
                        ),
                      ),
                      DataCell(
                        Align(
                          alignment: Alignment.center,
                          child: Text(studentData[index]['overallScores']!),
                        ),
                      ),
                      const DataCell(
                        Align(
                          alignment: Alignment.center,
                          child: Text(''),
                        ),
                      ),
                      DataCell(
                        Align(
                          alignment: Alignment.center,
                          child: Text(studentData[index]['q1']!),
                        ),
                      ),
                      DataCell(
                        Align(
                          alignment: Alignment.center,
                          child: Text(studentData[index]['q2']!),
                        ),
                      ),
                      DataCell(
                        Align(
                          alignment: Alignment.center,
                          child: Text(studentData[index]['q3']!),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100.0, 30.0, 0.0, 0.0),
                child: Row(
                  children: [
                    Container(
                      width: 1000,
                      height: 200,
                      decoration: const BoxDecoration(

                        color: Color.fromRGBO(0, 215, 125, 0.2),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),

                      child: charts.BarChart(
                        _data,
                        animate: true,
                        vertical: false,
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

class StudentScore {
  final String name;
  final int score;
  final charts.Color barColor;

  StudentScore(this.name, this.score, this.barColor);
}

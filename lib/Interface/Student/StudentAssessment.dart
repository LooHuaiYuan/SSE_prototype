import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sse_prototype/Data_Model/Lecturer/Question_Answer.dart';
import '../../Data_Model/Lecturer/Mark.dart';
import '../../Data_Model/Student/Exam_Question111.dart';

class StudentAssessment extends StatefulWidget {
  @override
  _StudentAssessment createState() => _StudentAssessment();
}

class _StudentAssessment extends State<StudentAssessment> {
  List<bool?> isCheckedSubject = [true, false, false, false];
  late List<bool> isExplanationVisibleList;

  @override
  void initState() {
    super.initState();
    isExplanationVisibleList = List.generate(questions.length, (index) => false);
    information = fetchInformation();
  }

  List<String> questions = [
    "Question1 : Define encapsulation, inheritance, and polymorphism in the context of object-oriented programming. Provide an example for each concept and explain how they contribute to code organization and reusability.(3M)",
    "Question2 : Differentiate between a class and an object. Explain the significance of constructors in a class and how they are used to initialize object properties. Provide a simple code snippet in a programming language of your choice to illustrate the creation of a class with a constructor.(3M)",
    "Question3 : Discuss the advantages and disadvantages of using inheritance versus composition in OOP. Provide a scenario where inheritance is a suitable choice and another scenario where composition would be more appropriate. Include code snippets or pseudo-code examples to support your explanation.(3M)",
    "Question4 : Explain the concept of polymorphism and how it can be achieved through method overloading and method overriding. Discuss the role of interfaces in achieving polymorphism. Provide an example in a programming language of your choice to demonstrate the implementation of interfaces and polymorphism.(3M)",
    "Question5 : Describe the importance of exception handling in object-oriented programming. Provide examples of common exceptions that might occur in OOP and how they can be effectively handled. Discuss the role of try-catch blocks and how they contribute to robust and reliable OOP code.(3M)"
  ];

  List<String> explanations = [
    'This answer very good',
    'This answer very detail',
    'This answer very nice',
    'This answer very good',
    'This answer very detail',
    'This answer very nice',
    'This answer very good',
    'This answer very good',
    'This answer very good',
    'This answer very detail',
  ];
  List<int> marks = [3, 1, 2, 1, 2];

  late Future<List<Question_Answer>> information;

  Future<List<Question_Answer>> fetchInformation() async {
    List<Question_Answer> infor = [];
    var url = 'http://localhost:3000/CSC3101_Exam2_Answer';

    final response = await http.get(Uri.parse(url));
    final urjson = json.decode(response.body);

    infor = List<Question_Answer>.from(
        urjson.map((jsondata) => Question_Answer.fromJson(jsondata)));

    return infor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 228, 0.5),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(105, 184, 165, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.keyboard_return),
          color: const Color.fromRGBO(255, 255, 255, 1.0),
          iconSize: 30.0,
        ),
        title: const Text(
          'Question Bank > Exam > Test 1 > Assessment',
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1.0),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/StudentHome'));
            },
            icon: const Icon(Icons.home_outlined),
            color: const Color.fromRGBO(255, 255, 255, 1.0),
            iconSize: 40.0,
          ),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: const Color.fromRGBO(105, 184, 165, 0.5),
                  width: 200.0,
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Subject',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1.0),
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CheckboxListTile(
                            title: const Text(
                              'CSC3101',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            value: isCheckedSubject[0],
                            onChanged: (bool? newValue) {
                              setState(() {
                                isCheckedSubject[0] = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CheckboxListTile(
                            title: const Text(
                              'CSC3200',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            value: isCheckedSubject[1],
                            onChanged: (bool? newValue) {
                              setState(() {
                                isCheckedSubject[1] = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CheckboxListTile(
                            title: const Text(
                              'SSE3201',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            value: isCheckedSubject[2],
                            onChanged: (bool? newValue) {
                              setState(() {
                                isCheckedSubject[2] = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CheckboxListTile(
                            title: const Text(
                              'SSE3301',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            value: isCheckedSubject[3],
                            onChanged: (bool? newValue) {
                              setState(() {
                                isCheckedSubject[3] = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
              height: 900.0,
              width: 1050.0,
              child: FutureBuilder<List<Question_Answer>>(
                  future: information,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.data == null ||
                        snapshot.data!.isEmpty) {
                      return const Text('No data available.');
                    } else {
                      var answers111 = [snapshot.data![0].answer1, snapshot.data![0].answer2, snapshot.data![0].answer3,
                        snapshot.data![0].answer4, snapshot.data![0].answer5];
                      return ListView.separated(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        questions[index],
                                        style: const TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (index == 0)
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          40.0, 20.0, 40.0, 20.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: const Text(
                                        '9/15',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'ANSWER: ${answers111[index]}',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Mark Q${index + 1}: ",
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 10.0, 20.0, 10.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Text(
                                        marks[index].toString(),
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(50.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(3),
                                        child: Stack(
                                          children: <Widget>[
                                            Positioned.fill(
                                              child: Container(
                                                decoration:
                                                    const BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      105, 184, 165, 100),
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                foregroundColor: Colors.black,
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                textStyle: const TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  isExplanationVisibleList[
                                                          index] =
                                                      !isExplanationVisibleList[
                                                          index];
                                                });
                                              },
                                              child: const Text(
                                                'Explanation',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: isExplanationVisibleList[index],
                                child: Text(
                                  'EXPLANATION: ${explanations[index]}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: 50.0),
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

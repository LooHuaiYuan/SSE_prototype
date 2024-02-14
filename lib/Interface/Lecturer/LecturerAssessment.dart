import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../Data_Model/Lecturer/Question_Answer.dart';
import '../../Data_Model/Student/Exam_Question111.dart';

class LecturerAssessment extends StatefulWidget {
  @override
  _LecturerAssessment createState() => _LecturerAssessment();
}

class _LecturerAssessment extends State<LecturerAssessment> {
  List<bool?> isCheckedSubject = [true, false, false, false];

  List<TextEditingController> markControllers = [];

  void initializeControllers(
      List<TextEditingController> listTextField, int numberOfControllers) {
    for (int i = 0; i < numberOfControllers; i++) {
      listTextField.add(TextEditingController());
    }
  }

  late Future<List<Question_Answer>> information_answer;

  Future<List<Question_Answer>> fetchInformationAnswer() async {
    List<Question_Answer> infor = [];
    var url = 'http://localhost:3000/CSC3101_Exam2_Answer';

    final response = await http.get(Uri.parse(url));
    final urjson = json.decode(response.body);

    infor = List<Question_Answer>.from(
        urjson.map((jsondata) => Question_Answer.fromJson(jsondata)));

    return infor;
  }

  Future<http.Response> returnMark(List<String> mark) {
    return http.post(
      Uri.parse('http://localhost:3000/CSC3101_Exam2_Mark'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': '1',
        'mark1': mark[0],
        'mark2': mark[1],
        'mark3': mark[2],
        'mark4': mark[3],
        'mark5': mark[4],
      }),
    );
  }

  List<String> questions = [
    "Question1 : Define encapsulation, inheritance, and polymorphism in the context of object-oriented programming. Provide an example for each concept and explain how they contribute to code organization and reusability.(3M)",
    "Question2 : Differentiate between a class and an object. Explain the significance of constructors in a class and how they are used to initialize object properties. Provide a simple code snippet in a programming language of your choice to illustrate the creation of a class with a constructor.(3M)",
    "Question3 : Discuss the advantages and disadvantages of using inheritance versus composition in OOP. Provide a scenario where inheritance is a suitable choice and another scenario where composition would be more appropriate. Include code snippets or pseudo-code examples to support your explanation.(3M)",
    "Question4 : Explain the concept of polymorphism and how it can be achieved through method overloading and method overriding. Discuss the role of interfaces in achieving polymorphism. Provide an example in a programming language of your choice to demonstrate the implementation of interfaces and polymorphism.(3M)",
    "Question5 : Describe the importance of exception handling in object-oriented programming. Provide examples of common exceptions that might occur in OOP and how they can be effectively handled. Discuss the role of try-catch blocks and how they contribute to robust and reliable OOP code.(3M)"
  ];

  @override
  void initState() {
    super.initState();
    information_answer = fetchInformationAnswer();
  }

  @override
  Widget build(BuildContext context) {
    initializeControllers(markControllers, 5);
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
              Navigator.popUntil(context, ModalRoute.withName('/LecturerHome'));
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
                          'Student Name',
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
                              'Jackson',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
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
                              'Lily',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
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
                              'Jacob',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
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
                              'Mandy',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
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
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CheckboxListTile(
                            title: const Text(
                              'Mary',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 900.0,
                width: 1050.0,
                child: FutureBuilder<List<Question_Answer>>(
                  future: information_answer,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.data == null ||
                        snapshot.data!.isEmpty) {
                      return const Text('No data available.');
                    } else {
                      print(snapshot.data);
                      var answers111 = [snapshot.data![0].answer1, snapshot.data![0].answer2, snapshot.data![0].answer3,
                        snapshot.data![0].answer4, snapshot.data![0].answer5];
                      print(answers111);
                      return ListView.separated(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      questions[index],
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                  if (index == 0)
                                    const SizedBox(
                                      width: 100.0,
                                      child: TextField(
                                        maxLines: 2,
                                        minLines: 1,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: '/15',
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              Text(
                                'ANSWER: ${answers111[index]}',
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Mark Q${index + 1}: ",
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    SizedBox(
                                      width: 75.0,
                                      child: TextField(
                                        controller: markControllers[index],
                                        maxLines: 2,
                                        minLines: 1,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: 50.0),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(105, 184, 165, 1),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.all(8.0),
                      textStyle: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        List<String> marks = [];
                        for(int i = 0; i<5 ; i++){
                          marks.add(markControllers[i].text);
                        }
                        returnMark(marks);
                      });
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'RETURN',
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
    );
  }
}

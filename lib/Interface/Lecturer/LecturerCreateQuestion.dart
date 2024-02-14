import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';
import '../../Data_Model/Student/Student_Information.dart';
import 'package:http/http.dart' as http;

class LecturerCreateQuestion extends StatefulWidget {
  const LecturerCreateQuestion({super.key});

  @override
  State<LecturerCreateQuestion> createState() => _LecturerCreateQuestionState();
}

class _LecturerCreateQuestionState extends State<LecturerCreateQuestion> {

  List<bool?> isCheckedSubject = [true, false, false, false];
  List<String> subjects = ['CSC3101', 'CSC3200', 'SSE3201', 'SSE3301'];

  List<String> passYear2018 = [
    'Question 1: Explain the importance of software architecture in the development process. Highlight key principles and benefits.',
    'Question 2: Compare and contrast the differences between monolithic and microservices architectures. Provide examples of scenarios suitable for each.',
    'Question 3: Discuss the role of design patterns in software development. Provide examples of commonly used design patterns and their applications.',
    'Question 4: Define the term "scalability" in the context of software architecture. Explain strategies and best practices for designing scalable systems.',
    'Question 5: Explore the concept of "modularity" in software design. How does modularity contribute to maintainability, reusability, and ease of testing?',
  ];

  List<String> passYear2020 = [
    'Question 1: Describe the characteristics of a good software architecture. How does it contribute to the success of a software project?',
    'Question 2: Discuss the concept of "layered architecture." Provide examples and explain how it promotes separation of concerns and maintainability.',
    'Question 3: Explain the role of the Model-View-Controller (MVC) pattern in software design. Illustrate its application in building user interfaces.',
    'Question 4: Explore the principles of Domain-Driven Design (DDD). How does DDD guide the development of complex software systems?',
    'Question 5: Define the term "architectural trade-offs." Provide examples and discuss how architects make decisions to balance conflicting requirements.',
  ];

  List<String> counting = ['1', '2', '3', '4', '5'];

  String dropdownValue1 = 'Arial';
  int dropdownValue2 = 11;
  String dropdownValue3 = '10 mins';
  List<String> fontFamily = ['Arial', 'Times New Roman', 'Helvetica', 'Calibri', 'Georgia'];
  List<int> numbers = [11 ,12, 13, 14, 15];
  List<String> minutesList = ['10 mins', '20 mins', '30 mins', '40 mins', '50 mins', '60 mins'];

  List<TextEditingController> questionControllers = [];
  List<TextEditingController> explanationControllers = [];

  void initializeControllers(List<TextEditingController> listTextField, int numberOfControllers) {
    for (int i = 0; i < numberOfControllers; i++) {
      listTextField.add(TextEditingController());
    }
  }

  Future<http.Response> createQuestion(List<String> questions, List<String> explanation) {
    return http.post(
      Uri.parse('http://localhost:3000/CSC3101_Exam2'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': '2',
        'question1': questions[0],
        'question2': questions[1],
        'question3': questions[2],
        'question4': questions[3],
        'question5': questions[4],
        'explanation1': explanation[0],
        'explanation2': explanation[1],
        'explanation3': explanation[2],
        'explanation4': explanation[3],
        'explanation5': explanation[4],
      }),
    );
  }


  @override
  Widget build(BuildContext context) {
    initializeControllers(questionControllers, 5);
    initializeControllers(explanationControllers, 5);

    return Scaffold(
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
          'Question Bank > Exam > Create Question',
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
        children: [
          Container(
            color: const Color.fromRGBO(105, 184, 165, 0.5),
            width: 200.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Container(
                  width: 200.0,
                  height: 300.0,
                  child: ListView.separated(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CheckboxListTile(
                            title: Text(
                              subjects[index],
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            value: isCheckedSubject[index],
                            onChanged: (bool? newValue){
                              setState(() {
                                isCheckedSubject[index] = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          )
                      );
                    }, separatorBuilder: (BuildContext context, int index) { return const SizedBox(height : 10.0); },
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  color: const Color.fromRGBO(0, 0, 0, 1.0),
                  iconSize: 35.0,
                ),
                const Divider(height: 20.0, thickness: 1, color: Colors.black),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(105, 184, 165, 1.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Pass Year Question 2018',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                        child: Container(
                          height: 300.0,
                          width: 540.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(0, 215, 125, 0.2),
                          ),
                          child:
                              ListView.separated(
                                  itemBuilder: (context, index){
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        passYear2018[index],
                                        style: const TextStyle(fontSize: 20.0),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (BuildContext context, int index) { return const SizedBox(height : 10.0); },
                                  itemCount: 5),
                          )
                        ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(105, 184, 165, 1.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Pass Year Question 2020',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                          child: Container(
                            height: 300.0,
                            width: 540.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(0, 215, 125, 0.2),
                            ),
                            child:
                            ListView.separated(
                                itemBuilder: (context, index){
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      passYear2020[index],
                                      style: const TextStyle(fontSize: 20.0),
                                    ),
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) { return const SizedBox(height : 10.0); },
                                itemCount: 5),
                          )
                      ),
                    ],
                  ),
                  const SizedBox(width: 15.0,),
                  Container(
                    width: 200.0,
                    height: 150.0,
                    decoration:BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.07),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.all(8.0),
                            textStyle: const TextStyle(fontSize: 15,),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Upload Pass Year',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Divider(height: 20.0, thickness: 1, color: Colors.black),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.all(8.0),
                            textStyle: const TextStyle(fontSize: 15,),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Retrieved from Question Bank',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Divider(height: 20.0, thickness: 1, color: Colors.black),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.all(8.0),
                            textStyle: const TextStyle(fontSize: 15,),
                          ),
                          onPressed: () {
                            setState(() {
                              List<String> questions = [];
                              List<String> explanation = [];
                              for(int i = 0; i<5 ; i++){
                                questions.add(questionControllers[i].text);
                                explanation.add(explanationControllers[i].text);
                              }
                              createQuestion(questions, explanation);
                              Navigator.pop(context);
                            });
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 40.0, 10.0, 0),
                child: Container(
                  height: 50.0,
                  width: 1200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(105, 184, 165, 1.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromRGBO(240, 240, 228, 1.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: DropdownButton<String>(
                              value: dropdownValue1,
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownValue1 = value!;
                                });
                            },
                              items: fontFamily.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              borderRadius: BorderRadius.circular(12),
                              dropdownColor: const Color.fromRGBO(240, 240, 228, 1.0),
                              underline: const SizedBox(),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, right: 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromRGBO(240, 240, 228, 1.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: DropdownButton<int>(
                              value: dropdownValue2,
                              onChanged: (int? value) {
                                setState(() {
                                  dropdownValue2 = value!;
                                });
                              },
                              items: numbers.map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                              borderRadius: BorderRadius.circular(12),
                              dropdownColor: const Color.fromRGBO(240, 240, 228, 1.0),
                              underline: const SizedBox(),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 27.0,
                        width: 210.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromRGBO(240, 240, 228, 1.0),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Text('Durations :' ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color.fromRGBO(217, 217, 217, 0.5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: DropdownButton<String>(
                                    value: dropdownValue3,
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropdownValue3 = value!;
                                      });
                                    },
                                    items: minutesList.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    borderRadius: BorderRadius.circular(12),
                                    dropdownColor: const Color.fromRGBO(240, 240, 228, 1.0),
                                    underline: const SizedBox(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 685,),
                      IconButton(
                        icon: const Icon(Icons.expand),
                        onPressed: () { },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 0, 10.0, 20.0),
                child: Container(
                  height: 300.0,
                  width: 1200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(0, 215, 125, 0.2),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 300.0,
                          width: 1150.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color.fromRGBO(240, 240, 228, 0.7),
                            ),
                            child: ListView.separated(
                              itemCount: 5,
                              itemBuilder: (context, index){
                                return  Container(
                                  height: 250.0,
                                  width: 800.0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              'Question ${counting[index]} : ',
                                              style: const TextStyle(fontWeight: FontWeight.bold),),
                                          ),
                                          SizedBox(
                                            width: 800.0,
                                            height: 60.0,
                                            child: TextField(
                                              controller: questionControllers[index],
                                              style: const TextStyle(height: 1.25,),
                                              decoration: const InputDecoration(
                                                border: UnderlineInputBorder(),
                                                filled: true,
                                                fillColor: Color.fromRGBO(217, 217, 217, 0.5),
                                                hintText: 'Type something ...',
                                              ),
                                              maxLines: 3,
                                              minLines: 1,
                                                                                      ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.image),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10.0,),
                                      const TextField(
                                        style: TextStyle(height: 1.25,),
                                        decoration:InputDecoration(
                                          border: UnderlineInputBorder(),
                                          filled: true,
                                          fillColor: Color.fromRGBO(217, 217, 217, 0.5),
                                          hintText: 'Answer',
                                        ),
                                        maxLines: 3,
                                        minLines: 1,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.paste_outlined),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.delete),
                                          ),
                                        ],
                                      ),
                                      const Divider(height: 5.0, thickness: 0.5, color: Colors.black),
                                      Text(
                                        'Explanation',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 5.0,),
                                      SizedBox(
                                        height: 60.0,
                                          width: 700.0,
                                          child: TextField(
                                            controller: explanationControllers[index],
                                        style: const TextStyle(height: 1.25,),
                                        decoration: const InputDecoration(
                                          border: UnderlineInputBorder(),
                                          filled: true,
                                          fillColor: Color.fromRGBO(217, 217, 217, 0.5),
                                          hintText: 'Type something ...',
                                        ),
                                            maxLines: 3,
                                            minLines: 1,
                                      )),
                                    ],
                                  ),
                                );
                              }, separatorBuilder: (BuildContext context, int index) {
                                return const Column(
                                  children: [
                                    SizedBox(height: 10.0,),
                                    Divider(height: 20.0, thickness: 5.0, color: Colors.black,),
                                    SizedBox(height: 10.0,),
                                  ],
                                );
                                },
                            ),
                                ),
                            ),
                        ],
                        ),
                      ),
                      )
                    ],
                  ),
                      ],
                ),
              );
  }
}


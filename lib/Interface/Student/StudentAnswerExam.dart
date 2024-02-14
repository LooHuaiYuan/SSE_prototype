import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sse_prototype/Data_Model/Student/Exam_Question.dart';

class StudentAnswerExam extends StatefulWidget{
  @override
  _StudentAnswerExam createState() => _StudentAnswerExam();
}

class _StudentAnswerExam extends State<StudentAnswerExam> {
  List<bool?> isCheckedSubject = [true, false, false, false];

  List<TextEditingController> answerControllers = [];

  void initializeControllers(List<TextEditingController> listTextField, int numberOfControllers) {
    for (int i = 0; i < numberOfControllers; i++) {
      listTextField.add(TextEditingController());
    }
  }

  late Future<List<Exam_Question>> information;

  Future<List<Exam_Question>> fetchInformation() async {

    List<Exam_Question> infor = [];
    var url = 'http://localhost:3000/CSC3101_Exam1';

    final response = await http.get(Uri.parse(url));
    final urjson = json.decode(response.body);

    infor = List<Exam_Question>.from(urjson.map(
            (jsondata) => Exam_Question.fromJson(jsondata)));

    return infor;
  }

  @override
  void initState(){
    super.initState();
    information = fetchInformation();
  }

  Future<http.Response> createQuestion(List<String> answer) {

    return http.post(
      Uri.parse('http://localhost:3000/CSC3101_Exam2_Answer'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "id" : "1",
        "answer1": "${answer[0]}",
        "answer2": "${answer[1]}",
        "answer3": "${answer[2]}",
        "answer4": "${answer[3]}",
        "answer5": "${answer[4]}"
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    initializeControllers(answerControllers, 5);
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
          'Question Bank > Exam > Test 1',
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
                            onChanged: (bool? newValue){
                              setState(() {
                                isCheckedSubject[0] = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          )
                      ),
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
                            onChanged: (bool? newValue){
                              setState(() {
                                isCheckedSubject[1] = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          )
                      ),
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
                            onChanged: (bool? newValue){
                              setState(() {
                                isCheckedSubject[2] = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          )
                      ),
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
                            onChanged: (bool? newValue){
                              setState(() {
                                isCheckedSubject[3] = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 900.0,
              width: 1050.0,
              child: FutureBuilder<List<Exam_Question>>(
                future: information,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Text('No data available.');
                  } else {
                    return ListView.separated(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        var number = index + 1 ;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Question $number : ${snapshot.data![index].question}',
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                                if (index == 0)
                                  SizedBox(
                                    width: 100.0,
                                    child: TextField(
                                      maxLines: 2,
                                      minLines: 1,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: '/15',
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 40.0),
                            TextField(
                              controller: answerControllers[index],
                              maxLines: 5,
                              minLines: 1,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Answer',
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
            )
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
                      textStyle: const TextStyle(fontSize: 15,),
                    ),
                    onPressed: () {
                      setState(() {
                        List<String> questions = [];
                        List<String> explanation = [];
                          for(int i = 0; i<5 ; i++){
                          questions.add(answerControllers[i].text);
                          }
                        createQuestion(questions);
                        });
                      Navigator.pop(context);
                      },
                    child: const Text(
                      'Submit',
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




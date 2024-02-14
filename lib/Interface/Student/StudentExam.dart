import 'package:flutter/material.dart';

class StudentExam extends StatefulWidget{
  @override
  _StudentExam createState()=> _StudentExam();
}

class _StudentExam extends State<StudentExam> {
  List<bool?> isCheckedDifficultyLevel = [true, false, false];
  List<bool?> isCheckedSubject = [true, false, false, false];
  List<String> difficultyLevel = [
    'Easy', 'Medium', 'Difficult'
  ];

  @override
  Widget build(BuildContext context) {
    var isChecked; //
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
        title: const Text('Question Bank > Exam',
          style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1.0),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,),),
        actions: <Widget>[
          IconButton(onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/StudentHome'));
          }, icon: const Icon(Icons.home),
            color: const Color.fromRGBO(255, 255, 255, 1.0),
            iconSize: 40.0,),
        ],),

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
                        padding: EdgeInsets.all(13.0),
                        child: Text(
                          'Subject',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1.0),
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,),
                        ),),
                      Padding(
                          padding: const EdgeInsets.all(3.0),
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
                          padding: const EdgeInsets.all(3.0),
                          child: CheckboxListTile(
                            title: const Text(
                              'CSC3200', style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                            ),),
                            value: isCheckedSubject[1],
                            onChanged: (bool? newValue) {
                              setState(() {
                                isCheckedSubject[1] = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          )),
                      Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CheckboxListTile(
                            title: const Text(
                              'SSE3201', style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                            ),),
                            value: isCheckedSubject[2],
                            onChanged: (bool? newValue) {
                              setState(() {
                                isCheckedSubject[2] = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          )),
                      Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CheckboxListTile(
                            title: const Text(
                              'SSE3301', style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                            ),),
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
                ),),
            ],
          ),
          Transform.translate(offset: Offset(140.0, -25.0),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width :1100.0,
                  height: 600.0,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 215, 125, 0.3),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),

                  child: Column(
                    children: <Widget>[const Padding(
                      padding: EdgeInsets.fromLTRB(20, 40, 850, 0),
                      child: Text('TOPICS:',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0),
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,

                        ),),),
                      SizedBox(width: 80),

                      buildTopicRow('Topic 1'),
                      buildTopicRow('Topic 2'),
                      buildTopicRow('Topic 3'),
                      buildTopicRow('Topic 4'),
                    ],
                  ),
                )
            ),),

        ],
      ),

    );
  }

  Widget buildTopicRow (String topic){
    return Transform.translate(
        offset: Offset(10.0, 50.0),
        child: Container(
            width: 1000.0,
            height: 70.0,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              // Optional: Add rounded corners
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Topic Name
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 50.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      topic,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Colors.black,
                  thickness: 1.0,
                  width: 20.0,
                ),
                // Create Button
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/StudentAnswerExam');
                    },
                    child: Text(
                      'ANSWER',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue, // Underline color
                      ),
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Colors.black,
                  thickness: 1.0,
                  width: 20.0,
                ),
                // View Button
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/StudentAssessment');
                    },
                    child: Text(
                      'MARK',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red, // Underline color
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ),
        );
    }
}

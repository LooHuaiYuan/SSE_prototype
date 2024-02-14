import 'package:flutter/material.dart';

class StudentQuestionBank extends StatefulWidget {
  const StudentQuestionBank({super.key});

  @override
  State<StudentQuestionBank> createState() => _StudentQuestionBankState();
}

class _StudentQuestionBankState extends State<StudentQuestionBank> {
  @override
  Widget build(BuildContext context) {
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
          'Question Bank',
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
            height: 1000.0,
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
                          color: Color.fromRGBO(0, 0, 0, 1.0),
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () { }
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
                        Navigator.popAndPushNamed(context, '/StudentPerformance');
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
          Center(
            child: Row(
              children: [
                const SizedBox(width: 325.0,),
                Container(
                  height: 450.0,
                  width: 675.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2.0,
                        color: const Color.fromRGBO(105, 184, 165, 1.0)
                    ),
                    color: const Color.fromRGBO(0, 215, 125, 0.3),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/StudentExam');
                              } ,
                              icon: const ImageIcon(
                                AssetImage('images/exam.png'),
                                size: 300.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30.0,),
                          const Text(
                            'Exam',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const VerticalDivider(width: 2.0, color: Color.fromRGBO(105, 184, 165, 1.0)),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0, left: 12.0, bottom: 12.0),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/StudentExercise');
                              } ,
                              icon: const ImageIcon(
                                AssetImage('images/exercise.png'),
                                size: 300.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30.0,),
                          const Text(
                            'Exercise',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

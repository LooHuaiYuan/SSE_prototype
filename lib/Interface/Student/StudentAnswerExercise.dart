import 'package:flutter/material.dart';

class StudentAnswerExercise extends StatefulWidget{
  @override
  _StudentAnswerExercise createState() => _StudentAnswerExercise();
}

class _StudentAnswerExercise extends State<StudentAnswerExercise> {

  List<bool?> isCheckedDifficultyLevel = [true, false, false];
  List<bool?> isCheckedSubject = [true, false, false, false];
  List<bool> tipsPressed = [false, false, false, false, false, false, false, false, false, false];
  List<String> difficultyLevel = [
    'Easy', 'Medium', 'Difficult'
  ];
  List<String> questions = [
    "Question1 : Define encapsulation, inheritance, and polymorphism in the context of object-oriented programming. Provide an example for each concept and explain how they contribute to code organization and reusability.(3M)",
    "Question2 : Differentiate between a class and an object. Explain the significance of constructors in a class and how they are used to initialize object properties. Provide a simple code snippet in a programming language of your choice to illustrate the creation of a class with a constructor.(3M)",
    "Question3 : Discuss the advantages and disadvantages of using inheritance versus composition in OOP. Provide a scenario where inheritance is a suitable choice and another scenario where composition would be more appropriate. Include code snippets or pseudo-code examples to support your explanation.(3M)",
    "Question4 : Explain the concept of polymorphism and how it can be achieved through method overloading and method overriding. Discuss the role of interfaces in achieving polymorphism. Provide an example in a programming language of your choice to demonstrate the implementation of interfaces and polymorphism.(3M)",
    "Question5 : Describe the importance of exception handling in object-oriented programming. Provide examples of common exceptions that might occur in OOP and how they can be effectively handled. Discuss the role of try-catch blocks and how they contribute to robust and reliable OOP code.(3M)"
  ];

  List<String> tips = [
    'Essential functionalities, clarity.',
    'Stakeholder techniques, engagement.',
    'Logical vs. physical design, examples.',
    'Components, quality, stakeholder focus.',
    'Verification vs. validation.',
    'Importance of software engineering, process steps.',
    'Data flow diagrams, visualize processes.',
    'Benefits of verification and validation.',
    'Software quality, key factors.',
    'Software reliability, system performance.',
  ];

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
          'Question Bank > Exercise > Topic 1',
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
                        'Difficulty Level',
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
                            'Easy',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          value: isCheckedDifficultyLevel[0],
                          onChanged: (bool? newValue){
                            setState(() {
                              isCheckedDifficultyLevel[0] = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CheckboxListTile(
                          title: const Text(
                            'Medium',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          value: isCheckedDifficultyLevel[1],
                          onChanged: (bool? newValue){
                            setState(() {
                              isCheckedDifficultyLevel[1] = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CheckboxListTile(
                          title: const Text(
                            'Difficult',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          value: isCheckedDifficultyLevel[2],
                          onChanged: (bool? newValue){
                            setState(() {
                              isCheckedDifficultyLevel[2] = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        )
                    ),
                    const Divider(height: 20.0, thickness: 1, color: Colors.black),
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
            child: Container(
              height: 800.0,
              width: 1100.0,
              child: ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index){
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text(
                              questions[index],
                              style: const TextStyle(
                                fontSize: 20.0,
                              ),
                            )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ClipRRect(
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
                                            tipsPressed[index] = tipsPressed[index] ? false : true;
                                          });
                                        },
                                        child: const Text(
                                          'Tips',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: tipsPressed[index],
                                  child: Text(
                                    tips[index],
                                    style: const TextStyle(fontSize: 10.0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 40.0),
                        const TextField(
                          maxLines: 5,
                          minLines: 1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Answer',
                          ),
                        ),
                      ],
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: 50.0); },
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
                      textStyle: const TextStyle(fontSize: 15,),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Finish',
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



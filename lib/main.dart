import 'dart:io';
import 'package:flutter/material.dart';
import 'Interface/Lecturer/LecturerAssessment.dart';
import 'Interface/Lecturer/LecturerCreateQuestion.dart';
import 'Interface/Lecturer/LecturerEditQuestion.dart';
import 'Interface/Lecturer/LecturerExam.dart';
import 'Interface/Lecturer/LecturerExercise.dart';
import 'Interface/Lecturer/LecturerHome.dart';
import 'Interface/Lecturer/LecturerPerformance.dart';
import 'Interface/Lecturer/LecturerQuestionbank.dart';
import 'Interface/Lecturer/Security.dart';
import 'Interface/Student/StudentAnswerExam.dart';
import 'Interface/Student/StudentAnswerExercise.dart';
import 'Interface/Student/StudentAssessment.dart';
import 'Interface/Student/StudentExam.dart';
import 'Interface/Student/StudentExercise.dart';
import 'Interface/Student/StudentHome.dart';
import 'Interface/Student/StudentPerformance.dart';
import 'Interface/Student/StudentQuestionBank.dart';
import 'Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>LoginScreen(),
        '/LecturerHome': (context) => LecturerHomePage(),
        '/LecturerQuestionBank': (context) => LecturerQuestionBank(),
        '/LecturerExam': (context) => LecturerExam(),
        '/LecturerExercise': (context) => LecturerExercise(),
        '/Security': (context) => Security(),
        '/LecturerAssessment': (context) => LecturerAssessment(),
        '/LecturerPerformance': (context) => LecturerPerformance(),
        '/LecturerCreateQuestion': (context) => LecturerCreateQuestion(),
        '/LecturerEditQuestion': (context) => LecturerEditQuestion(),
        '/StudentHome': (context) => StudentHomePage(),
        '/StudentQuestionBank': (context) => StudentQuestionBank(),
        '/StudentExam': (context) => StudentExam(),
        '/StudentExercise': (context) => StudentExercise(),
        '/StudentAssessment': (context) => StudentAssessment(),
        '/StudentPerformance': (context) => StudentPerformance(),
        '/StudentAnswerExam': (context) => StudentAnswerExam(),
        '/StudentAnswerExercise': (context) => StudentAnswerExercise(),
      },
    );
  }
}

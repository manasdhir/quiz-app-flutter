import "package:flutter/material.dart";
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/page.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAns = [];
  var activeScreen = "start";

  void switchScreen() {
    setState(() {
      activeScreen = "questions";
    });
  }

  void chooseAns(String answer) {
    selectedAns.add(answer);
    if (selectedAns.length == questions.length) {
      setState(() {
        activeScreen = "end";
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = PageLayout(switchScreen);

    if (activeScreen == "questions") {
      screenWidget = QuestionsScreen(onselectans: chooseAns);
    }
    if (activeScreen == "end") {
      screenWidget = ResultScreen(listchosenAns: selectedAns);
    }
    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.indigo, Colors.indigoAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: screenWidget,
      ),
    ));
  }
}

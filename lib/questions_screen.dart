import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onselectans});
  final void Function(String answer) onselectans;

  @override
  State<QuestionsScreen> createState() {
    return _QscreenState();
  }
}

class _QscreenState extends State<QuestionsScreen> {
  var quesno = 0;
  void answerques(String selectAns) {
    widget.onselectans(selectAns); //gives access to stateful class
    setState(() {
      quesno += 1;
    });
  }

  @override
  Widget build(context) {
    final currentques = questions[quesno];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentques.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 184, 235, 255),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentques.getshuffledanswers().map((abc) {
              return AnswerButton(
                  anstext: abc,
                  ontap: () {
                    answerques(abc);
                  });
            })
          ],
        ),
      ),
    );
  }
}

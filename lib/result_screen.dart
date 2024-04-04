import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.listchosenAns});
  final List<String> listchosenAns;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < listchosenAns.length; i++) {
      summary.add({
        "question_no": i,
        "question": questions[i].text,
        "correct_ans": questions[i].answers[0],
        "user_ans": listchosenAns[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((record) {
      return record["user_ans"] == record["correct_ans"];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                  "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly",
                  style: GoogleFonts.montserrat(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center),
              const SizedBox(height: 30),
              QuestionSummary(summaryData),
              TextButton(
                onPressed: () {},
                child: const Text("Restart Quiz!"),
              ),
            ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((record) {
            return Row(children: [
              Text(((record['question_no'] as int) + 1).toString()),
              Expanded(
                child: Column(children: [
                  Text(record["question"] as String),
                  const SizedBox(height: 5),
                  Text(record["correct_ans"] as String),
                  Text(record["user_ans"] as String)
                ]),
              )
            ]);
          }).toList(),
        ),
      ),
    );
  }
}

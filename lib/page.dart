import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
/*import 'package:quizapp/outline_button.dart';
import 'package:quizapp/set_img.dart';
import 'package:quizapp/styled_text.dart';*/

class PageLayout extends StatelessWidget {
  const PageLayout(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Container(
      alignment: const Alignment(0, -0.75),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/quiz-logo.png',
            height: 500,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 50),
          Text(
            "Learn Flutter the Fun way!",
            style: GoogleFonts.lato(color: Colors.white, fontSize: 28),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
            label: const Text(
              "Start Quiz",
              style: TextStyle(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}

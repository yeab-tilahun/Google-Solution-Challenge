// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print
import 'package:flutter/material.dart';
import 'package:studygini/pages/uploadpdf.dart';
import 'package:studygini/pages/askQuestion.dart';
import 'package:studygini/pages/summary.dart';
import 'package:studygini/pages/questionGen.dart';
import 'package:studygini/pages/youtube.dart';
import 'package:studygini/pages/answer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    UploadPDFPage(),
    AskQuestionPage(),
    TestSummarizationPage(),
    TestQuestionGenerationPage(),
    YouTubeSummaryPage(
      videoUrl: 'https://www.youtube.com/watch?v=u52TWx41oU4',
    ),
    AnswerPage(
      answer: 'damn right',
      question: 'Are we gonna win the hackhaton',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.file_upload,
              color: Colors.black,
            ),
            label: 'Upload PDF',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.question_answer,
              color: Colors.black,
            ),
            label: 'Ask Question',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.summarize,
              color: Colors.black,
            ),
            label: 'Summary',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.question_mark,
              color: Colors.black,
            ),
            label: 'Question Generator',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_file,
              color: Colors.black,
            ),
            label: 'YouTube Summary',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.question_answer,
              color: Colors.black,
            ),
            label: 'Answer',
          ),
        ],
      ),
    );
  }
}

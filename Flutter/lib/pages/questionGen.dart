import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TestQuestionGenerationPage extends StatefulWidget {
  @override
  _TestQuestionGenerationPageState createState() =>
      _TestQuestionGenerationPageState();
}

class _TestQuestionGenerationPageState
    extends State<TestQuestionGenerationPage> {
  final TextEditingController _textEditingController = TextEditingController();
  String _generatedQuestions = '';

  Future<void> _generateQuestions(String text) async {
    final apiUrl = Uri.parse('http://localhost:5000/generate_questions');

    final response = await http.post(
      apiUrl,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'text': text}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _generatedQuestions = data['generated_questions'];
      });
    } else {
      throw Exception('Failed to generate questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Question Generation'),
        backgroundColor: Color.fromRGBO(96, 125, 139, 1),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              // TODO: Add user profile page navigation
            },
            child: Container(
              width: 50,
              height: 50,
              child: CircleAvatar(
                backgroundImage: AssetImage('asset/sidePortriat.jpg'),
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter text here...',
                border: OutlineInputBorder(),
              ),
              maxLines: 10,
              minLines: 3,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await _generateQuestions(_textEditingController.text);
              },
              child: Text('Generate Questions'),
            ),
            SizedBox(height: 16),
            if (_generatedQuestions.isNotEmpty)
              Text(
                'Generated Questions:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            if (_generatedQuestions.isNotEmpty) SizedBox(height: 8),
            if (_generatedQuestions.isNotEmpty)
              Expanded(
                child: SingleChildScrollView(
                  child: Text(_generatedQuestions),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

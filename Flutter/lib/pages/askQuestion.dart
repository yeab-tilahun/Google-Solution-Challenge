import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AskQuestionPage extends StatefulWidget {
  @override
  _AskQuestionPageState createState() => _AskQuestionPageState();
}

class _AskQuestionPageState extends State<AskQuestionPage> {
  final TextEditingController _questionController = TextEditingController();
  String _answer = '';

  Future<void> _getAnswer() async {
    String question = _questionController.text;
    String url = 'http://your-api-url.com/get_answer';

    var response = await http.post(
      Uri.parse(url),
      body: {'question': question},
    );

    var data = jsonDecode(response.body);

    setState(() {
      _answer = data['answer'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(96, 125, 139, 1),
        title: Text('Ask a question'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              // showOptions(context);
            },
            child: Container(
              width: 50,
              height: 50,
              child: CircleAvatar(
                backgroundImage: AssetImage('asset/sidePortriat.jpg'),
                // backgroundImage: NetworkImage(user!.photoURL!),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _questionController,
              decoration: InputDecoration(
                labelText: 'Enter your question',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _getAnswer,
                child: Text('Get Answer'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(96, 125, 139, 1),
                )),
            SizedBox(height: 20),
            if (_answer.isNotEmpty)
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Answer: $_answer',
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'dart:convert';

class TestSummarizationPage extends StatefulWidget {
  @override
  _TestSummarizationPageState createState() => _TestSummarizationPageState();
}

class _TestSummarizationPageState extends State<TestSummarizationPage> {
  final TextEditingController _textEditingController = TextEditingController();
  String _summary = '';

  // void _summarizeText(String text) async {
  //   try {
  //     var url = Uri.parse('https://0cbc-149-34-244-156.eu.ngrok.io/question');
  //     var headers = {'Content-Type': 'application/json'};
  //     var body = jsonEncode({'question': text});
  //     var response = await http.post(url, headers: headers, body: body);
  //     if (response.statusCode == 200) {
  //       var responseBody = response.body;
  //       setState(() {
  //         _summary = responseBody;
  //       });
  //     } else {
  //       print('Request failed with status: ${response.statusCode}.');
  //     }
  //   } catch (e) {
  //     print('Error sending POST request: $e');
  //   }
  // }
  Future<http.Response> createAlbum(String title) {
    return http.post(
      Uri.parse('https://0cbc-149-34-244-156.eu.ngrok.io/question'),
      headers: <String, String>{
        // ContentType.json.toString(): 'application/json; charset=UTF-8',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(96, 125, 139, 1),
        title: Text('Text Summarization'),
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Enter your text here...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                _summarizeText(_textEditingController.text);
              },
              child: Text('Summarize Text'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(96, 125, 139, 1),
              )),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _summary,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

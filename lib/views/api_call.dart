import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:workout_app/cloud/cloud_plan.dart';
import 'package:workout_app/cloud/cloud_storage.dart';
import 'package:workout_app/targets.dart';

class ChatApi {
  static const String apiKey = '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';
  static const String baseUrl = 'https://openrouter.ai/api/v1';
  static const String model = 'deepseek/deepseek-r1:free';

  static Future<String> getChatCompletion(String message) async {
    final url = Uri.parse('$baseUrl/chat/completions');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
      'HTTP-Referer': '<YOUR_SITE_URL>', // Optional
      'X-Title': '<YOUR_SITE_NAME>',     // Optional
    };

    final body = jsonEncode({
      'model': model,
      'messages': [
        {'role': 'user', 'content': message}
      ]
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      throw Exception('Failed to fetch response: ${response.body}');
    }
  }
}


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  CloudNote? _note;
  late final FirebaseCloudStorage _notesService;
  late final TextEditingController _textController;
  late final currentUserId = FirebaseAuth.instance.currentUser?.uid;

  String response = 'Click Generate!';
  bool isLoading = false;

  late final String workout = response;

  @override
  void initState() {
    _notesService = FirebaseCloudStorage();
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }


  void fetchResponse() async {
    setState(() {
      isLoading = true;
      response = "Thinking...";
    });

    try {
      final result = await ChatApi.getChatCompletion('Make a sets and reps workout plan for $targets in the least amount of words');
      setState(() {
        response = result;
      });
    } catch (e) {
      setState(() {
        response = 'Error: ${e.toString()}';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 237, 205),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 204, 213, 174),
      ),
      body:
         
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
          children: [
            
            Container(
              
              width: 400,
              height: 400,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                border: Border.symmetric()
              ),
              child: Expanded(child: Center(
                child: Column(
                  children: [
                    Text(response)
                  ],
                ),
              ))
            ),
            Padding(padding: EdgeInsets.all(10)),
            Column(
              
              children: [
                
                ElevatedButton(
                      onPressed: isLoading ? null : () {
                        fetchResponse();
                        
                        },
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("Generate"),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        
                        ElevatedButton(
                          onPressed: () {
                            targets.clear();
                            Navigator.pushNamed(context, '/home');
                          }, 
                          child: 
                            const Text('Home')
                        ),
                        ElevatedButton(
                          onPressed: () async {                            
                            await _notesService.createNewNote(ownerUserId: currentUserId!, apiText: response);
                            targets.clear();
                            Navigator.pushNamed(context, '/home');
                          }, 
                          child: 
                            const Text('Save to Collection')
                        ),
                      ],
                    ),
              ],
            )
          ],
                ),
        )
      
    );
  }
}
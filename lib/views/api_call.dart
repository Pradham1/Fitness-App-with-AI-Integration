import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String response = 'Tap the button to ask your question!';
  bool isLoading = false;

  void fetchResponse() async {
    setState(() {
      isLoading = true;
      response = "Thinking...";
    });

    try {
      final result = await ChatApi.getChatCompletion("Hello");
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
      appBar: AppBar(title: const Text("Ask OpenRouter")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(response, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : fetchResponse,
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Hello'"),
            ),
            ElevatedButton(
              onPressed: () {
                print(targets);
              }, 
              child: 
                const Text('Print')
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

@RoutePage()
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const user = types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
    const bot = types.User(id: 'bot');

    return Scaffold(
      body: Chat(
        messages: [
          types.TextMessage(
            id: '2',
            text: 'Oui je veux bien',
            author: user,
            createdAt:
                DateTime.parse('2021-10-10 10:10:10').microsecondsSinceEpoch,
          ),
          const types.TextMessage(
            id: '1',
            text: "Hi, I'm Myra. How can I help you?",
            author: bot,
          ),
          types.TextMessage(
            id: '3',
            text: 'Choisissez votre langue',
            author: bot,
            createdAt:
                DateTime.parse('2021-10-09 10:10:10').microsecondsSinceEpoch,
          ),
          types.TextMessage(
            id: '4',
            text: 'Oui je veux bien',
            author: user,
            createdAt:
                DateTime.parse('2021-10-10 10:10:10').microsecondsSinceEpoch,
          ),
          const types.TextMessage(
            id: '5',
            text: "Hi, I'm Myra. How can I help you?",
            author: bot,
          ),
          types.TextMessage(
            id: '6',
            text: 'Choisissez votre langue',
            author: bot,
            createdAt:
                DateTime.parse('2021-10-09 10:10:10').microsecondsSinceEpoch,
          ),
          types.TextMessage(
            id: '7',
            text: 'Oui je veux bien',
            author: user,
            createdAt:
                DateTime.parse('2021-10-10 10:10:10').microsecondsSinceEpoch,
          ),
          const types.TextMessage(
            id: '8',
            text: "Hi, I'm Myra. How can I help you?",
            author: bot,
          ),
          types.TextMessage(
            id: '9',
            text: 'Choisissez votre langue',
            author: bot,
            createdAt:
                DateTime.parse('2021-10-09 10:10:10').microsecondsSinceEpoch,
          ),
          types.TextMessage(
            id: '10',
            text: 'Oui je veux bien',
            author: user,
            createdAt:
                DateTime.parse('2021-10-10 10:10:10').microsecondsSinceEpoch,
          ),
          const types.TextMessage(
            id: '11',
            text: "Hi, I'm Myra. How can I help you?",
            author: bot,
          ),
          types.TextMessage(
            id: '12',
            text: 'Choisissez votre langue',
            author: bot,
            createdAt:
                DateTime.parse('2021-10-09 10:10:10').microsecondsSinceEpoch,
          ),
        ],
        onSendPressed: (text) => print(text),
        user: user,
      ),
    );
  }
}

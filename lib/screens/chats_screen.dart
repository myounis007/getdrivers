import 'package:flutter/material.dart';

class Chat {
  final String name;
  final String message;
  final String time;

  Chat({
    required this.name,
    required this.message,
    required this.time,
  });
}

class ChatsScreen extends StatelessWidget {
  final List<Chat> chats = [
    Chat(name: 'John', message: 'Hi there!', time: '10:00 AM'),
    Chat(name: 'Alice', message: 'Hello!', time: '11:30 AM'),
    Chat(name: 'Bob', message: 'Hey!', time: '12:45 PM'),
    Chat(name: 'Emily', message: 'Hi!', time: '01:20 PM'),
    Chat(name: 'David', message: 'Hi, how are you?', time: '02:15 PM'),
    Chat(name: 'Emma', message: 'Hello', time: '03:00 PM'),
    Chat(name: 'Michael', message: 'Hey!', time: '04:30 PM'),
    Chat(name: 'Olivia', message: 'Hi!', time: '05:00 PM'),
  ];

  ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(chats[index].name[0]),
            ),
            title: Text(chats[index].name),
            subtitle: Text(chats[index].message),
            trailing: Text(chats[index].time),
            onTap: () {
              // Navigate to chat screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(chat: chats[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final Chat chat;

  const ChatScreen({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chat.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(chat.message),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

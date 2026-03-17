import 'package:flutter/material.dart';
import 'package:codesprint_app/bottom_nav.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  bool inChat = false;
  final TextEditingController _messageController = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {
      'sender': 'Sajani',
      'text': 'Hi! Can you come by around 3 PM today?',
      'isMe': false,
    },
    {
      'sender': 'You',
      'text': 'Sure! I`ll be there by 3 PM sharp.',
      'isMe': true,
    },
    {
      'sender': 'Sajani',
      'text': 'Great, thank you so much!',
      'isMe': false,
    },
  ];

  final List<Map<String, String>> contacts = [
    {'name': 'Sajani', 'lastMsg': 'Great, thank you so much!'},
    {'name': 'Manuga', 'lastMsg': 'Let me know when you arrive.'},
    {'name': 'Nikitha', 'lastMsg': 'Thanks you a lot!'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(inChat ? 'Chat with Sajani' : 'Messages'),
        backgroundColor: const Color.fromARGB(218, 32, 32, 117),
        foregroundColor: Colors.white,
        leading: inChat
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    inChat = false;
                  });
                },
              )
            : null,
      ),
      body: inChat ? _buildChatView() : _buildContactList(),
      bottomNavigationBar: BottomNavBar(currentIndex: 3),
    );
  }

  Widget _buildContactList() {
    return ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return Card(
          child: ListTile(
            title: Text(contact['name']!),
            subtitle: Text(contact['lastMsg']!),
            leading: CircleAvatar(
              child: Text(contact['name']![0]),
            ),
            onTap: contact['name'] == 'Sajani'
                ? () {
                    setState(() {
                      inChat = true;
                    });
                  }
                : null,
          ),
        );
      },
    );
  }

  Widget _buildChatView() {
    return Column(
      children: [
        // Chat messages
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final msg = messages[index];
              return Align(
                alignment: msg['isMe'] ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: msg['isMe']
                        ? const Color.fromARGB(255, 115, 133, 255)
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: msg['isMe']
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        msg['sender'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(msg['text']),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Row(
            children: [
              // Attachment button
              IconButton(
                icon: Icon(Icons.attach_file),
                onPressed: () {},
              ),
              
              // Message input field
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Type a message...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              
              // Send button
              IconButton(
                icon: Icon(Icons.send),
                color: const Color.fromARGB(218, 32, 32, 117),
                onPressed: () {
                  _messageController.clear();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
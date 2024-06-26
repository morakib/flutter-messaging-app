
import 'package:ab/pages/chat_page.dart';
import 'package:ab/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FakeHomePage extends StatelessWidget {
  
  final List<Map<String, String>> fakeUsers = [
    {'id': 'morakibnashit@gmail.com', 'name': 'morakib'},
    {'id': 'abc@gmail.com', 'name': 'Abdul bari '},
    //{'id': 'tes===', 'name': 'User 3'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fake Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: fakeUsers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(fakeUsers[index]['name']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    chatId: fakeUsers[index]['id']!,
                    userName: fakeUsers[index]['name']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  void signOut(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        actions: [
          IconButton(
            onPressed: () => signOut(context),
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: Container(
              child: ListView(
                reverse: true,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("N"),
                    ),
                    title: Text("Nome do Usuário"),
                    subtitle: Text("Oi, tudo bem?"),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Digite sua mensagem...",
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.send),
              )
            ],
          )
        ],
      ),
    );
  }
}


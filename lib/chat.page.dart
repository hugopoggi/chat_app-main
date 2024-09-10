import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  var user = (FirebaseAuth.instance).currentUser;

  void signOut(BuildContext context) {
    (FirebaseAuth.instance).signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user?.displayName ?? ''),
        actions: [
          IconButton(
            onPressed: () => signOut(context),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: Container(
              child: ListView(
                reverse: true,
                children: const [
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
                  padding: const EdgeInsets.all(4),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Digite sua mensagem...",
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send),
              )
            ],
          )
        ],
      ),
    );
  }
}

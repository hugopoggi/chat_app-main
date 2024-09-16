import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  var txtMessage = TextEditingController();

  var user = (FirebaseAuth.instance).currentUser;

  void signOut(BuildContext context) {
    (FirebaseAuth.instance).signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  void sendMessage() {
    var data = {
      "user_id": user!.uid,
      "name": user!.displayName,
      "message": txtMessage.text,
      "date": DateTime.now()
    };

    FirebaseFirestore.instance.collection('messages').add(data);

    txtMessage.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user?.displayName ?? ''),
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
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection("messages")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();

                    return ListView(
                      reverse: true,
                      children: snapshot.data!.docs
                          .map((doc) => ListTile(
                            key: Key(doc.id),
                            leading: CircleAvatar(),
                            title: Text(doc["nome"]),
                            subtitle: Text(doc["message"]),
                          ))
                          .toList(),
                    );
                  }),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: TextField(
                    controller: txtMessage,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Digite sua mensagem...",
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: sendMessage,
                icon: Icon(Icons.send),
              )
            ],
          )
        ],
      ),
    );
  }
}

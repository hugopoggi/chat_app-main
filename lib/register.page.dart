import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatelessWidget {
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();

  RegisterPage({super.key});

  void register(BuildContext context) {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: txtEmail.text, password: txtPassword.text);
    Navigator.of(context)
      ..pop()
      ..pushReplacementNamed('/chat');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: "Name",
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            TextField(
              controller: txtEmail,
              decoration: InputDecoration(
                hintText: "E-mail (required)",
                labelText: "E-mail",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            TextField(
              controller: txtPassword,
              decoration: InputDecoration(
                hintText: "Password",
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 6,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text("Register"),
                onPressed: () => register(context),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextButton(
              child: const Text("Back to login"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

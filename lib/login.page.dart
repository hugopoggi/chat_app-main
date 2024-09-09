import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();

  void login(BuildContext context) {
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: txtEmail.text, password: txtPassword.text);
    Navigator.pushReplacementNamed(context, '/chat');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: txtEmail,
              decoration: InputDecoration(
                hintText: "E-mail (required)",
                labelText: "E-mail",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
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
                child: const Text("Login"),
                onPressed: () => login(context),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextButton(
              child: const Text("New User"),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ],
        ),
      ),
    );
  }
}

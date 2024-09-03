import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    super.key,
  });

  void register(BuildContext context) {
    Navigator.pushNamed(context, '/chat');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
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
              decoration: InputDecoration(
                hintText: "Password",
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Register"),
                onPressed: () => register(context),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            TextButton(
              child: Text("Back to login"),
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

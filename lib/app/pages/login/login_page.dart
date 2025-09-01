import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

//Quando temos uma view que compreende uma tela inteira nos podemos chamar esta
// page de view

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('email'),
              ),
            ),

            SizedBox(height: 15),

            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('password'),
              ),
            ),

            SizedBox(height: 30),

            FloatingActionButton.extended(
              onPressed: () {
                Modular.to.pushReplacementNamed('/home');
              },
              isExtended: true,
              label: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

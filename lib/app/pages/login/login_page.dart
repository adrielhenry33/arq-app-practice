import 'package:arq_app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final appController = Modular.get<AppController>();

    return Scaffold(
      backgroundColor: appController.isDark ? Colors.white : Colors.black87,
      appBar: AppBar(
        backgroundColor: appController.isDark ? Colors.white : Colors.black87,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart,
                  size: 50,
                  color: Colors.deepOrangeAccent,
                  fill: 1.0,
                ),

                SizedBox(width: 8),

                Text(
                  'FakeStore',
                  style: GoogleFonts.montserrat(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: appController.isDark ? Colors.black87 : Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Image(image: AssetImage('images/login.jpg')),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined, size: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                label: Text(
                  'email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                contentPadding: EdgeInsets.all(16),
              ),
            ),

            SizedBox(height: 15),

            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline, size: 20),
                suffixIcon: Icon(Icons.visibility_off_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                label: Text(
                  'password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                contentPadding: EdgeInsets.all(16),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Modular.to.pushReplacementNamed('/home');
              },
              style: ElevatedButton.styleFrom(
                elevation: 2,
                backgroundColor: Colors.deepOrangeAccent,
                padding: EdgeInsets.all(16),
                textStyle: TextStyle(color: Colors.white),
                minimumSize: Size.fromHeight(55),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

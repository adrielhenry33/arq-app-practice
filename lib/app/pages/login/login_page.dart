import 'package:arq_app/app/controllers/app_controller.dart';
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
  bool _isVisiblePass = false;

  @override
  Widget build(BuildContext context) {
    final appController = Modular.get<AppController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: appController.isDark ? Colors.white : Colors.black87,
        appBar: AppBar(
          backgroundColor: appController.isDark ? Colors.white : Colors.black87,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                      color: appController.isDark
                          ? Colors.black87
                          : Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Image(image: AssetImage('images/login.jpg')),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined, size: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  label: Text(
                    'email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(16),
                ),
              ),

              SizedBox(height: 15),

              TextField(
                obscureText: !_isVisiblePass,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline, size: 20),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isVisiblePass = !_isVisiblePass;
                      });
                    },
                    icon: Icon(
                      _isVisiblePass
                          ? Icons.visibility
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  label: Text(
                    'password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
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

              SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {
                  Modular.to.pushNamed('/register');
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
                  'Criar conta ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),

              SizedBox(height: 15),

              TextButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: EdgeInsets.all(16),
                  textStyle: TextStyle(color: Colors.white),
                  minimumSize: Size.fromHeight(55),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  ),
                ),
                child: Text(
                  'Esqueceu sua senha? ',
                  style: TextStyle(
                    color: appController.isDark ? Colors.black87 : Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

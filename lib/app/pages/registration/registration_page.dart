import 'package:arq_app/app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    final appController = Modular.get<AppController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'FakeStore',

            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.vertical(
              top: Radius.circular(16),
            ),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.fromLTRB(30, 100, 30, 30),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.storefront,
                    color: Colors.deepOrangeAccent,
                    size: 100,
                  ),
                  SizedBox(height: 15),
                  Title(
                    color: appController.isDark ? Colors.black : Colors.white,
                    child: Text(
                      'Criar Conta',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, size: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      label: Text(
                        'Nome',
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
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline, size: 20),

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

                  SizedBox(height: 15),

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
                      'Cadastrar',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),

                  SizedBox(height: 15),

                  TextButton(
                    onPressed: () {
                      Modular.to.pop();
                    },
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
                      'Ja possui uma conta? Faça login',
                      style: TextStyle(
                        color: appController.isDark
                            ? Colors.black87
                            : Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

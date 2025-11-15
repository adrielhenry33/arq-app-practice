import 'package:arq_app/app/viewmodels/registrarion_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final controller = Modular.get<RegistrarionViewmodel>();

  void showErrorDialog() {
    if (!mounted) return;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Erro ao cadastrar usuário'),
          content: Text(controller.exceptionMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.canvasColor;

    return SafeArea(
      child: Scaffold(
        backgroundColor: color,
        appBar: AppBar(
          toolbarHeight: 80,
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

          elevation: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
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
                      color: color,
                      child: Text(
                        'Crie sua Conta',
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
                      obscureText: controller.isVisible,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline, size: 20),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              controller.isVisible = !controller.isVisible;
                            });
                          },
                          icon: !controller.isVisible
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
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

                    SizedBox(height: 15),

                    ElevatedButton(
                      onPressed: () async {
                        final result = await controller.signIn();
                        if (result) {
                          Modular.to.pushReplacementNamed('/home');
                        } else {
                          showErrorDialog();
                        }
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

                    GestureDetector(
                      onTap: () {
                        Modular.to.pushReplacementNamed('/');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Ja é membro?'),
                          SizedBox(width: 5),
                          Text(
                            'Faça login',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

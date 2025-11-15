import 'dart:io';

import 'package:arq_app/app/viewmodels/login_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isVisiblePass = false;
  final viewmodel = Modular.get<LoginViewmodel>();
  final _key = GlobalKey<FormState>();

  @override
  void dispose() {
    viewmodel.emailController.dispose();
    viewmodel.senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDarkMode = theme.brightness == Brightness.dark;

    final String loginImage = isDarkMode
        ? 'images/login_dark.png'
        : 'images/login_light.png';

    return SafeArea(
      child: Scaffold(
        backgroundColor: colors.surface,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Image(image: AssetImage(loginImage)),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Campo Obrigatório!";
                      }
                      return null;
                    },
                    controller: viewmodel.emailController,
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
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Campo Obrigatório!";
                      }
                      return null;
                    },
                    obscureText: !_isVisiblePass,
                    controller: viewmodel.senhaController,
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

                  SizedBox(height: 5),

                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Esqueceu sua senha? ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 5),

                  ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        final response = await viewmodel.logUser();
                        if (response) {
                          Modular.to.pushReplacementNamed('/home');
                        } else {
                          if (context.mounted) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                if (Platform.isAndroid) {
                                  return AlertDialog(
                                    title: Text('Erro ao Logar'),
                                    content: Text(viewmodel.errorMessage),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                } else {
                                  return CupertinoAlertDialog(
                                    title: Text('Erro ao Logar'),
                                    content: Text(viewmodel.errorMessage),
                                    actions: [
                                      CupertinoDialogAction(
                                        isDefaultAction: true,
                                        child: Text('OK'),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  );
                                }
                              },
                            );
                          }
                        }
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
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),

                  SizedBox(height: 10),

                  GestureDetector(
                    onTap: () {
                      Modular.to.pushNamed('/register');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Ainda não é membro?'),
                        SizedBox(width: 5),
                        Text(
                          'Cadastre-se',
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
    );
  }
}

import 'package:arq_app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

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
        appBar: AppBar(
          title: Text(
            'FakeStore',
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: appController.isDark ? Colors.black : Colors.white,
              ),
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
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}

import 'package:arq_app/app/components/custom_switch_widget.dart';
import 'package:arq_app/app/models/store_model.dart';
import 'package:arq_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Injeções pelo metodo tradicionar para pequenas aplicações
  final homeController = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.store),
        onPressed: () {
          homeController.getStore();
        }, 
      ),
      body: Column(
        children: [
          CustomSwitchWidget(),
          ValueListenableBuilder<StoreModel?>(
            valueListenable: homeController.store,
            builder: (context, model, child) {
              if (model == null) {
                return Center(child: CircularProgressIndicator());
              }
              return Text(model.title);
            },
          ),
        ],
      ),
    );
  }
}

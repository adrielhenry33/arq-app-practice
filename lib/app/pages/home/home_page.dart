import 'package:arq_app/app/repository/store_implementation_repository.dart';
import 'package:arq_app/app/services/client_http_service.dart';
import 'package:arq_app/app/components/custom_switch_widget.dart';
import 'package:arq_app/app/models/store_model.dart';
import 'package:arq_app/app/pages/home/controllers/home_controller.dart';
import 'package:arq_app/app/viewmodels/apistore_viewmodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController(
    ApistoreViewmodel(
      StoreRepositoryImplementation(
        ClientHttpServiceImplementation()
      ),
    ),
  );

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
          ValueListenableBuilder<StoreModel>(
            valueListenable: homeController.store,
            builder: (context, model, child) {
              if (model.title == null) {
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

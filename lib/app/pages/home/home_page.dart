import 'package:arq_app/app/components/custom_switch_widget.dart';
import 'package:arq_app/app/controllers/home_controller.dart';
import 'package:arq_app/app/models/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Injeções pelo metodo tradicional para pequenas aplicações
  final homeController = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Produtos",style: GoogleFonts.montserrat(color: Colors.white)),
          backgroundColor: Colors.deepOrangeAccent,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.vertical(
              top: Radius.circular(16),
            ),
          ),
          actions: [CustomSwitchWidget()],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.store, color: Colors.deepOrangeAccent,),
          onPressed: () {
            homeController.getStore();
          },
        ),
        
        body: ValueListenableBuilder<List<StoreModel?>>(
          valueListenable: homeController.store,
          builder: (context, store, child) {
            if (store.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: store.length,
              itemBuilder: (context, index) {
                final produtos = store[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Image.network(produtos!.image),
                    title: Text(produtos.title, style: GoogleFonts.montserrat(),),
                    subtitle: Text(produtos.category),
                    trailing: Text('\$${produtos.price.toStringAsFixed(2)}'),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

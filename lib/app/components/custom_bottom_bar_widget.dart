import 'package:flutter/material.dart';

class CustomBottomBarWidget extends StatefulWidget {
  const CustomBottomBarWidget({super.key});

  @override
  State<CustomBottomBarWidget> createState() => _CustomBottomBarWidgetState();
}

class _CustomBottomBarWidgetState extends State<CustomBottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.deepOrangeAccent,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

             IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, color: Colors.white, size: 30,),
              color: Colors.white,
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
                ),
              ),
          ),
        ],
      ),
    );
  }
}

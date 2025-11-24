import 'package:arq_app/app/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel viewmodel = Modular.get<HomeViewModel>();
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final height = size.height * 0.28;
    final double sizeUp = 100.0;
    final color = ColorScheme.of(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              height: height,
              child: Container(
                height: 200,
                decoration: BoxDecoration(color: Colors.deepOrangeAccent),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 30,
                      vertical: 55,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'F',
                              style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'FakeStore',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'MontSerrat',
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: height - sizeUp,
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: color.surfaceBright,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _controller,

                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],

                            hint: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Search',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.deepPurpleAccent,
                                size: 30,
                              ),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.deepPurpleAccent,
                                size: 30,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),

                        GridView.count(
                          childAspectRatio: 0.75,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          primary: false,
                          crossAxisCount: 2,
                          padding: EdgeInsets.only(top: 10, bottom: 15),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: [
                            Container(
                              height: 500,
                              width: 130,
                              decoration: BoxDecoration(
                                color: Color(0xFFfdf0e9),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Eletrônicos',
                                      style: TextStyle(fontFamily: 'Roboto'),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'MacBook Pro',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'MontSerrat',
                                      ),
                                    ),
                                    Image(
                                      image: AssetImage('images/macbook.jpg'),
                                      height: 150,
                                      
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 500,
                              width: 130,
                              decoration: BoxDecoration(
                                color: Color(0xFFe7f3eb),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 8.0,
                                ),
                                child: Column(children: [Text('Eletrônicos')]),
                              ),
                            ),
                            Container(
                              height: 500,
                              width: 130,
                              decoration: BoxDecoration(
                                color: Color(0xFFf8f9e4),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Column(children: [Text('Eletrônicos')]),
                            ),
                            Container(
                              height: 500,
                              width: 130,
                              decoration: BoxDecoration(
                                color: Color(0xFFefeff0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

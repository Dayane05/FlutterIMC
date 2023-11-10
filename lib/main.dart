import 'package:calculadora_imc/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
          centerTitle: true,
          backgroundColor:  Color.fromARGB(255, 3, 12, 63),
        ),

        drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 120,
              child: DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 3, 12, 63),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: 
                        Image.network(
                          'https://avatars.githubusercontent.com/u/105259264?s=400&u=6c804cd91b379e3b99372f6bba4e2d092c768add&v=4',
                          width: 60,
                          height: 60,
                        ),
                        
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text('Dayane Sivil Moreira', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),),
                          RichText(
                            text: TextSpan(
                              text: 'RA: 1431432312008',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ),
            )
          ],
        ),
      ),

        body: IMCCalculator(),
      ),
    );
  }
}
import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mixbox/Widget/drawer.dart';
import 'page/notepage.dart';
import 'theme.dart';
import 'package:intl/intl.dart';
import 'Widget/drawer.dart';
import 'Widget/clock.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: noteTest());
    
  }
}

class home extends StatefulWidget {
  const home({super.key, required this.title});
  final String title;

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  //current time 
  DateTime currentTime = DateTime.now();
  //String time 
  @override
  void initState () {
    super.initState();
    
  }
  
  @override
  Widget build(BuildContext context) { 
      return Scaffold(
        drawerDragStartBehavior: DragStartBehavior.down,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(
              builder: (context) {
              return GestureDetector(
                child:
                Image.asset(
                  'assets/logo1.png',
                  width: 30,
                  height: 30,
                ),
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
              );
              },
            ),
          ),
          title: Text(widget.title),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 23,
            color: Colors.black,
          ),
        ),
        
        drawer: myDrawer() ,
        backgroundColor: Color.fromRGBO(224, 224, 226, 1),
        body: Builder(
          builder: (context) {
            return GestureDetector(
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 15){
                  Scaffold.of(context).openDrawer();
                }
              },
              child: ListView(
                
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0 , 0, 8.0, 0),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Text.rich(
                          TextSpan(
                              text: 'Hi, ',
                              style: GoogleFonts.kanit(
                                      textStyle : h1
                                    ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '\nJadesalit',
                                    style: GoogleFonts.kanit(
                                      textStyle : h1
                                    )
                                    
                                    )
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context , MaterialPageRoute(builder: (context) => noteTest()));
                      },
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.211),
                          borderRadius: BorderRadius.circular(25)
                        ),
                        child:Column(
                          children: [
                          Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: (
                              Text('Note',
                              style: GoogleFonts.kanit(
                                textStyle: h1.merge(TextStyle(
                                  letterSpacing: 40
                                ))
                              ) ,
                              )
                            ),
                          ),
                        ),
                        ],
                        )
                      ),
                    ),
                  ),
                  clockWid(),
                ],
              ),
            );
          }
        ));
  }
}

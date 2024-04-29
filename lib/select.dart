import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mixbox/square.dart';
import 'page/notepage.dart';
import 'theme.dart';
import 'package:intl/intl.dart';

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
  //current time 
  DateTime currentTime = DateTime.now();
  //String time 
  @override
  void initState () {
    super.initState();
    currentTime = DateTime.now();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateTime.now();
      });
     });
  }
  
  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('hh:mm:ss').format(currentTime); 
    Timer.periodic(Duration(seconds: 1), (timer) {
      
        if(formattedTime == DateFormat('hh:mm').format(currentTime)) {
      setState(() {
        formattedTime = DateFormat('hh mm').format(currentTime);
        return;
      });
    } if(formattedTime == DateFormat('hh mm').format(currentTime)) {
      setState(() {
        formattedTime = DateFormat('hh:mm').format(currentTime);
        return;
      });
    }

     });
    
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset(
              'assets/logo1.png',
              width: 40,
              height: 40,
            ),
            onPressed: () {},
          ),
          title: Text(widget.title),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 23,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color.fromRGBO(180, 180, 184, 1),
        body: ListView(
          
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
                  
                  child: Padding(
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
                ),
              ),
              
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: Colors.white,

                ),
                height: 200,
                width: double.infinity,
                child: Center(
                  child: Text(formattedTime ,
                  style: GoogleFonts.pixelifySans(
                    textStyle: h1.merge(TextStyle(letterSpacing: 40))
                  ),)),
              ),
            ),
            
          ],
        ));
  }
}

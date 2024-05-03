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
  String name = 'Jadesalit';
  //current time
  DateTime currentTime = DateTime.now();
  //String time
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  late TextEditingController controller;

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
                  child: Image.asset(
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
        drawer: myDrawer(),
        backgroundColor: Color.fromRGBO(224, 224, 226, 1),
        body: Builder(builder: (context) {
          return GestureDetector(
            onHorizontalDragUpdate: (details) {
              if (details.delta.dx > 15) {
                Scaffold.of(context).openDrawer();
              }
            },
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 200,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  'Hello,\n$name',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 10),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(25),
                                child: Container(
                                    child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                        ),
                                        onPressed: () async {
                                          final name =
                                              await changeName(context);
                                          if (name == null || name.isEmpty)
                                            return;

                                          setState(() => this.name = name);
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                        label: Text(''))),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                clockWid(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => noteTest()));
                    },
                    child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 68, 68, 68),
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: (Text(
                                  'Note',
                                  style: GoogleFonts.kanit(
                                      textStyle: h1.merge(TextStyle(
                                          letterSpacing: 40,
                                          color: Colors.white))),
                                )),
                              ),
                            ),
                            Container(
                                child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ))
                          ],
                        )),
                  ),
                ),
              ],
            ),
          );
        }));
  }

  Future<String?> changeName(BuildContext context) => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            content: TextField(
              autofocus: true, //auto keyboard
              decoration: InputDecoration(
                  hintText: 'Enter your name', hoverColor: Colors.black),
              controller: controller,
            ),
            actions: [
              TextButton(
                  onPressed: () => submit(context), // Pass context here
                  child: Text('Submit'))
            ],
          ));

  void submit(BuildContext context) {
    Navigator.of(context).pop(controller.text);
  }
}

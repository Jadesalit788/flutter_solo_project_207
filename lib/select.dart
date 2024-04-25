import 'package:flutter/material.dart';
import 'package:mixbox/square.dart';
import 'page/notepage.dart';

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
  @override
  Widget build(BuildContext context) {
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
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xEEF5FFFF),
                        Color(0xFFB4D4FF),
                        Color(0xFF176B87)
                      ],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    )),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text.rich(
                    TextSpan(
                        text: 'Hi, ',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: '\nUsername',
                              style: TextStyle(
                                fontSize: 25,
                              ))
                        ]),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: 200,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.blue,
              ),
            ),
            MySquare()
          ],
        ));
  }
}

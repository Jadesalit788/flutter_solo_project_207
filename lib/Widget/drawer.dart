import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mixbox/page/credit.dart';
import 'package:mixbox/page/notepage.dart';
import 'package:mixbox/select.dart';
import 'package:mixbox/theme.dart';

class MySquare extends StatelessWidget {
  const MySquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Colors.blue,
      child: Column(
        children: [Text('hello')],
      ),
    );
  }
}

class myDrawer extends StatelessWidget {
  const myDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 150),
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: Center(
                  child: Text('MEMO',
                      style: GoogleFonts.kanit(
                          textStyle: h1.merge(TextStyle(
                        color: Colors.white,
                      )))),
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Handle item 1 tap
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => home(
                              title: 'Home',
                            )));
              },
            ),
            ListTile(
              title: Text('Note'),
              onTap: () {
                // Handle item 2 tap
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => noteTest()));
              },
            ),
            ListTile(
              title: Text('Credit'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreditPage()));
                // Handle item 3 tap
              },
            ),
            // Add more ListTiles for additional menu items
          ],
        ),
      ),
    );
  }
}

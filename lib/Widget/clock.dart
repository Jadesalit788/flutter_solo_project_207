import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mixbox/theme.dart';

class clockWid extends StatefulWidget {
  const clockWid({Key? key});

  @override
  State<clockWid> createState() => _clockWidState();
}

class _clockWidState extends State<clockWid> {
  DateTime currentTime = DateTime.now();
  DateFormat formattedTime = DateFormat('hh:mm');
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
                        color: Colors.white,
                      ),
                      width: double.infinity,
                      child: Center(
                        child: Text(formattedTime.format(currentTime),
                        style: GoogleFonts.pixelifySans(
                          textStyle: h1.merge(TextStyle(letterSpacing: 40))
                        ),
                        )),
                    ),
                  );
  }
}
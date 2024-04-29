import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mixbox/theme.dart';

class clockWid extends StatefulWidget {
  const clockWid({Key ? key});

  @override
  State<clockWid> createState() => _clockWidState();
}

class _clockWidState extends State<clockWid> {
  DateTime currentTime = DateTime.now();
  DateFormat formattedTime = DateFormat('hh:mm');
  String clockBG = 'assets/clockNight.png';
  @override
  void initState () {
    super.initState();
    currentTime = DateTime.now();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateTime.now();
        updateBG();
      });
     });
     updateBG();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
              height: 300,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(clockBG , fit: BoxFit.cover , ))
            ),
          ),
          Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.zero,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(DateFormat('HH:mm').format(currentTime),
                              style: GoogleFonts.pixelifySans(
                                textStyle: h1.merge(TextStyle(letterSpacing: 40))
                              ),
                              )),
                          ),
          ),
                      ),
        ],
        
      ),
    );
  }

  //change background when the time change from night to day 
  void updateBG () {
    DateTime currentTime = DateTime.now();
    int currenttime = currentTime.hour;
    if (currenttime >= 6 && currenttime < 18) {
      setState(() {
        clockBG = 'assets/clockDay.jpg';
        return;
      });
    } else{
      setState(() {
        clockBG = 'assets/clockNight.png';
      });
  }

  
  }
}

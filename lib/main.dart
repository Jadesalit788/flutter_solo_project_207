import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mixbox/models/note_data.dart';
import 'page/notepage.dart';
import 'package:provider/provider.dart';
import 'select.dart';

void main() async {
  //initialize hive
  await Hive.initFlutter();

  //open a hive box
  await Hive.openBox('note_database');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteData(),
      builder: ((context, child) => const MaterialApp(
          debugShowCheckedModeBanner: false, home: noteTest())),
    );
  }
}

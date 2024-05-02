import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mixbox/Widget/myAppbar.dart';

final _formKey = GlobalKey<FormState>();

class user extends StatefulWidget {
  const user({super.key});

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppbar(title: 'Edit Profile'),
        body: Container(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Name:',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  formBox(
                    hint: 'The name can\'t be left out',
                  ),
                  formBox(
                    hint: 'The name can\'t be left out',
                  ),
                  formBox(
                    hint: 'The name can\'t be left out',
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('hello world')));
                        }
                      },
                      child: Text('Submit'))
                ],
              )),
        ));
  }
}

class formBox extends StatelessWidget {
  final String hint;
  const formBox({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: TextFormField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(23))),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "$hint";
            }
            return null;
          },
        ),
      ),
    );
  }
}

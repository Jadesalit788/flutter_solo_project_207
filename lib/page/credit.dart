import 'package:flutter/material.dart';
import 'package:mixbox/Widget/drawer.dart';
import 'package:mixbox/Widget/myAppbar.dart';
import 'package:mixbox/theme.dart';

class CreditPage extends StatelessWidget {
  const CreditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(title: 'Profile'),
      drawer: myDrawer(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Container(
                //ProfilePicture and Name
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color.fromARGB(255, 109, 87, 87),
                                  offset: const Offset(5.0, 5.0),
                                  blurRadius: 10.0)
                            ]),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              'assets/profilePic.jpg',
                            )),
                      ),
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Center(
                            child: Box(
                                title: 'Name:',
                                detail: 'jadesalit Suriyanimitsuk')),
                        Box(title: 'Age:', detail: '21')
                      ],
                    )),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Box(
                    title: "Education",
                    detail:
                        'KMUTT\n\nBachelor of Science \n\nFaculty of Education industial and Technology \n\nApplied computer-science - Multimedia'),
              )
            ],
          )
        ],
      ),
    );
  }
}

class Box extends StatelessWidget {
  final String title;
  final String detail;
  const Box({super.key, required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 5, 168, 119),
                  offset: const Offset(5.0, 5.0),
                  blurRadius: 10.0)
            ],
            color: const Color.fromARGB(200, 209, 209, 209),
            borderRadius: BorderRadius.circular(20)),
        width: 200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text.rich(TextSpan(children: [
            TextSpan(text: '$title \n', style: h2),
            TextSpan(text: this.detail, style: contentText)
          ])),
        ),
      ),
    );
  }
}

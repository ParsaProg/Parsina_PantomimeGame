import 'package:flutter/material.dart';

class Gamescreen extends StatefulWidget {
  String named;
  Gamescreen({super.key, required this.named});

  @override
  State<Gamescreen> createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(6, 5, 36, 1.0),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 143,
                  height: 54,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.timer_sharp,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        " 5.00",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromRGBO(4, 5, 22, 1.0),
                  ),
                ),
              ],
            ),
            Spacer(),
            Center(
              child: Text(
                widget.named,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      //پارسا جانم اینجا لینک صفحه امتیازات رو بزار
                    },
                    child: Container(
                      width: 80,
                      height: 75,
                      child: Center(
                        child: Text(
                          "غلط",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(186, 0, 0, 1.0),
                          Color.fromRGBO(242, 145, 0, 1.0),
                        ]),
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 80,
                    height: 75,
                    child: Center(
                      child: Text(
                        "خطا",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(209, 64, 64, 1.0),
                        Color.fromRGBO(137, 0, 99, 1.0)
                      ]),
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      //پارسا جانم اینجا لینک صفحه امتیازات رو بزار
                    },
                    child: Container(
                      width: 80,
                      height: 75,
                      child: Center(
                        child: Text(
                          "درست",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color.fromRGBO(30, 137, 60, 1.0),
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

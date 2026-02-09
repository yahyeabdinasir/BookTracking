import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyHome();
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),

                      child: TextField(
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(20),
                        //   border: Border.all(color: Theme.of(context).primaryColor),
                        decoration: InputDecoration(
                          label: Text("Search for a book"),
                          hintText: "enter a book",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          suffix: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              print("hello ");
                            },
                          ),

                          // filled: true,
                          // fillColor: Colors.red
                        ),
                        //  TextButton(onPressed: () {},
                        //   child: Icon(Icons.search),
                        // )
                        // ),
                      ),
                    ),
                  ),
                  //
                  // Icon(Icons.search),
                  // Column(
                  //   children: [
                  //     Row(
                  //
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
          ],
        ));
    // },
  }
}

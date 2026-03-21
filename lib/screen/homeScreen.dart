import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:read_tracking/models/books.dart';
import 'package:read_tracking/screen/GridViewWidgetFile.dart';
import 'package:read_tracking/screen/bookDetails.dart';
import 'package:read_tracking/service/googleApi.dart';
import 'package:read_tracking/utils/bookargumentsddetails.dart';

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
  Googleapi Network = Googleapi();
  List<Books> data = [];

  // initialisin the controller  text for the editable text  of the user
  TextEditingController _TextContorller = TextEditingController();

  void SearchBook(String Query) async {
    try {
      List<Books>? _result = await Network.SearchBooks(Query);
      print(_result);
      //  ui update  that means the data was a null and now we strore the resrult from the api that is how it works
      setState(() {
        data = _result ?? [];
      });

      for (var eachitem in data) {
        print("this is the  from the home screen  ${eachitem.authors}");
      }
    } catch (e) {
      print("something wrong with this  ${e} ");
    }
  }

  @override
  void initState() {
    super.initState();

    _TextContorller.addListener(() {
      print('this is going user type ${_TextContorller.text}');
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("❌ Controller waa la dispose gareeyay");
    _TextContorller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),

            child: TextField(
              // this used to get the text from the user
              controller: _TextContorller,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(20),
              //   border: Border.all(color: Theme.of(context).primaryColor),
              decoration: InputDecoration(
                fillColor: Colors.white,

                label: Text("Search for a book"),
                hintText: "enter a book",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffix: IconButton(
                  icon: Icon(Icons.search),

                  onPressed: () {
                    // callin the api then passin the user input to the api
                    SearchBook(_TextContorller.text);
                  },
                ),
              ),
              onSubmitted: (Query) {
                SearchBook(Query);
              },
            ),
          ),
          GridViewWidget(data: data),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:read_tracking/models/books.dart';
import 'package:read_tracking/service/googleApi.dart';


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


  void SearchBook(String Query) async {
    try {
      List<Books>? result = await Network.SearchBooks(Query);


      setState(() {
        data = result ?? [];
      });

      for (var eachitem in data!) {
        print("this is the  from the home screen  ${eachitem.authors}");
      }
    }
    catch (e) {
      print("something wrong with this  ${e} ");
    }
  }

  // prerendering before the ui building
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   SearchBook("android");
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

             Padding(
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
                      print("hello there");
                    },
                  ),
                ),
                onSubmitted: (query) => SearchBook(query),
              ),
             ),
          Expanded(
              child: Container(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        print( "this is the context ${context}");
                        final book = data[index];
                        print("this is the books , ${book}");

                        return ListTile(

                          title: Text(book.title),
                          subtitle: Text(
                              book.authors?.join(", ") ?? "No author"),
                        );
                      }

                  )

              ))
        ],
      ),
    );

  }
}

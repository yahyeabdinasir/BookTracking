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
  TextEditingController _TextContorller = TextEditingController();

  void SearchBook(String Query) async {
    try {
      List<Books>? _result = await Network.SearchBooks(Query);
      print(_result);

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

  // @override
  // void initState() {
  //   SearchBook("flutter");
  //   // TODO: implement initState
  //
  //   super.initState();
  // }

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
              controller: _TextContorller,
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
                    SearchBook(_TextContorller.text);
                  },
                ),
              ),
              onSubmitted: (Query) {
                SearchBook(Query);
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                // print("this is the context ${context}");
                Books book = data[index];
                print("this is the books as below index , ${book}");
                final imageUrl = book.thumbmail.trim();

                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),

                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: imageUrl.isNotEmpty
                            ? Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child, progress) {
                                  if (progress == null) return child;
                                  return const Center(
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(Icons.broken_image, size: 40),
                                  );
                                },
                              )
                            : const Center(
                                child: Icon(Icons.image_not_supported, size: 40),
                              ),
                      ),
                      Text(book.title),
                      Text(book.authors.isNotEmpty ? book.authors.join(" & ") : "No author"),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

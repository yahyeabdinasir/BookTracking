import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:read_tracking/db/BookDb.dart';
import 'package:read_tracking/models/books.dart';
import 'package:read_tracking/service/googleApi.dart';
import 'package:read_tracking/utils/bookargumentsddetails.dart';

class Safefile extends StatefulWidget {
  const Safefile({super.key});

  @override
  State<Safefile> createState() => _SafefileState();
}

class _SafefileState extends State<Safefile> {
  @override
  Widget build(BuildContext context) {
    // var network  = Googleapi();

    // var network  = Googleapi();

    //  this is the how to read data from the another page
    // final args = ModalRoute.of(context)!.settings.arguments as  BookDetailsArguments;
    //   args.bookItems;

    // void SearchBook(book)async{
    //  List<Books>? result =  await network.SearchBooks(book);
    //  print('this is the result from the save file ${result}');
    //
    //

    // }
    // initState(){
    //   SearchBook("flutter");
    // }
    return Scaffold(
      body: FutureBuilder(
        future: BookDataBase.instance.FetchBooks(),
        builder: (context, snapchat) => snapchat.hasData
            ? ListView.builder(
                itemCount: snapchat.data!.length,
                itemBuilder: (context, index) {
                  print("this is the curent index from the save file  $index");
                  Books books = snapchat.data![index];
                  print("Fetched books: ${snapchat.data![index]}");

                  return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/detailScreen'  ,
                      arguments: BookDetailsArguments(bookItems: books)
                      );
                    },
                    child: Card(
                      color: Theme.of(context).secondaryHeaderColor,
                      shape: Border.all(color: Colors.grey.shade300, width: 8.0),

                      child: ListTile(
                        title: Text(books.title, style: TextStyle(fontSize: 20)),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            await BookDataBase.instance
                                .deleteBook(books.id)
                                .then(
                                  (value) => {
                                    print(
                                      "this is the icon that has been delted  $value",
                                    ),
                                    setState(() {}),
                                  },
                                );
                          },
                        ),
                        leading: Image.network(
                          width: 60,

                          books.imageLinks['thumbnail']!,
                          fit: BoxFit.fill,
                        ),
                        subtitle: Column(
                          children: [
                            Center(
                              child: Text(
                                books.authors.join(" &"),
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            ElevatedButton.icon(
                              onPressed: () async {
                                await BookDataBase.instance
                                    .ToggleFavorite(books.id, books.isFavorite)
                                    .then(
                                      (onValue) => print(
                                        "this is the value of the favorite $onValue",
                                      ),
                                    );
                              },
                              icon: Icon(Icons.favorite),
                              label: Text(" add favorite"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

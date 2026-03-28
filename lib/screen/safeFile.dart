import 'package:flutter/material.dart';
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
          builder: (context, snapchat) =>
          snapchat.hasData ?
          ListView.builder(
            itemCount: snapchat.data!.length,
            itemBuilder: (context, index) {
              print("this is the curent index from the save file  $index");
              Books books = snapchat.data![index];
              print("Fetched books: ${snapchat.data}");
              return Card(
                child:listTtitle

                title: Text(books.title),
              );
            }  )

            :const Center(child: CircularProgressIndicator())),

);
  }
}



import 'package:flutter/material.dart';
import 'package:read_tracking/models/books.dart';
import 'package:read_tracking/utils/bookargumentsddetails.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute
        .of(context)
        ?.settings
        .arguments as BookDetailsArguments;
    final Books book = args.bookItems;

    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (book.thumbmail.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(30.0),


                child: Image.network(book.thumbmail, fit: BoxFit.fill),
              ),
            Padding(

              padding: EdgeInsetsGeometry.all(10),

              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(book.title.trim(),
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 12,),
                    Text(book.authors.isNotEmpty
                        ? book.authors.join(" & ")
                        : "no author",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),

                    ),
                  ],
                ),
              ),

            ),

            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.pinkAccent,
                        size: 50,
                        fontWeight: FontWeight.bold,

                      ),
                      SizedBox(width: 30,),

                      Icon(Icons.save, color: Colors.pinkAccent, size: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Column(
                  children: [
                    Text("Description" , style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),

                  Text(book.description,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineLarge,
                  ),

                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}

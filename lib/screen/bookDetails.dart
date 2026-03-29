import 'package:flutter/material.dart';
import 'package:google_books_api/src/models/book.dart';
import 'package:read_tracking/db/BookDb.dart';
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
        ModalRoute.of(context)?.settings.arguments as BookDetailsArguments;
    final Books book = args.bookItems;

    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (book.imageLinks['thumbnail']!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(30.0),

                child: Image.network(
                  book.imageLinks['thumbnail']!,
                  fit: BoxFit.fill,
                ),
              ),
            Padding(
              padding: EdgeInsetsGeometry.all(10),

              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      book.title.trim(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      book.authors.isNotEmpty
                          ? book.authors.join(" & ")
                          : "no author",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            // children: <Widget>[
            // Padding(
            //   padding: EdgeInsetsGeometry.all(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.favorite),
                  label: Text(
                    "Favorite",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  onPressed: () async {
                    await BookDataBase.instance
                    //  toggle if the book is 0 to the 1 for the gesture detector
                    .ToggleFavorite(book.id, !book.isFavorite);
                    // .then((value) => print("book value $value"));
                  },
                ),

                //     try {
                //       await BookDataBase.instance.FetchBooks().then(
                //           (value) => {
                //             for (var bookitem in value){
                //               print ('this is the books that fetches saved books ${bookitem}')
                //           }
                //
                //       }
                //     );
                //
                //     } catch (e) {
                //       print(e);
                //
                //   //   }
                //   },
                // ),
                SizedBox(width: 40),

                ElevatedButton.icon(
                  icon: Icon(Icons.save),
                  label: Text(
                    "Save",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  onPressed: () async {
                    // insert the book via clicking save
                    try {
                      int bookInt = await BookDataBase.instance.Insert(book);
                      print('book saved into the databse ${bookInt}');
                      SnackBar snackbar = SnackBar(
                        content: Text("book saved successfully $bookInt"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    } catch (e) {
                      print("there is error ${e}");
                    }

                  },


                ),
              ],
              // ),
              // ),
              // ],
            ),

            SizedBox(height: 7),
            Text(
              "Description",
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            Container(
              // color: Theme.of(context).colorScheme.secondary,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              child: Text(
                book.description,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

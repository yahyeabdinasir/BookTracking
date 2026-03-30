import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:read_tracking/models/books.dart';
import 'package:read_tracking/utils/bookargumentsddetails.dart';
class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key, required this.data});

  final List<Books> data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          // mainAxisSpacing: 2
        ),
        itemBuilder: (context, index) {
          // print("this is the context ${context}");
          Books book = data[index];
          print("this is the books as below index , ${book}");
          // final imageUrl = book.thumbmail.trim();

          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceBright,
              borderRadius: BorderRadiusDirectional.circular(10),
            ),

            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    //  navigate to the details screen throght passing the route of the screen
                    //   Navigator.push(context, MaterialPageRoute(
                    //       builder: (context) => DetailsScreen()
                    //   ),);

                    // Navigator.push(context, the name of the route from the main dart )
                    Navigator.pushNamed(
                      context,
                      '/detailScreen',
                      arguments: BookDetailsArguments(bookItems: book , isFromSaveScreen: false),
                    );

                    print("hello there this si the gesture");
                  },

                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      child: SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: Image.network(book.imageLinks['thumbnail']!, fit: BoxFit.cover ,
                        scale: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                  Flexible(
                  // padding: const EdgeInsets.all(8.0),
                  child: Text(
                    book.title,
                    style: Theme.of(context).textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(10),
                   Flexible(
                    // padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 20,
                        child: Text(
                          book.authors.isNotEmpty
                              ? book.authors.join(" & ")
                              : "No author",
                          style: Theme.of(context).textTheme.titleMedium,
                          //  so this is the properties that we use to make clip and fit the text when there is the overflow of the text
                          //  so that is how we can use them  so the elipse makes shorter the larget text along with the ..
                          //  while the clip attribute also make them fit  the entire  text without overflow
                          //  and also the visible and fade attribute  they put the top of it each text without the overflow
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,

                        // ),
                                          ),
                      ),
                    ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

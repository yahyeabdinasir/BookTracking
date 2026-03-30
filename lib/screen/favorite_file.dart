import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:read_tracking/db/BookDb.dart';
import 'package:read_tracking/models/books.dart';

class FavoriteFile extends StatefulWidget {
  const FavoriteFile({super.key});

  @override
  State<FavoriteFile> createState() => _FavoriteFileState();
}

class _FavoriteFileState extends State<FavoriteFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Books>>(
        future: BookDataBase.instance.ReadFavoriteBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Icon(Icons.error_outline);
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<Books> favoriteBooks = snapshot.data!;
            return ListView.builder(
              itemCount: favoriteBooks.length,
              itemBuilder: (context, index) {
                if (kDebugMode) {
                  print("this is the curent index from the save file  $index");
                }
                Books books = favoriteBooks[index];
                return Card(
                  child: ListTile(
                    title: Text(books.authors.join(" & ")),
                    leading: Image.network(
                      width: 60,

                      books.imageLinks['thumbnail']!,
                      fit: BoxFit.fill,
                    ),
                    trailing: Icon(Icons.favorite , color: Colors.redAccent,),


                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

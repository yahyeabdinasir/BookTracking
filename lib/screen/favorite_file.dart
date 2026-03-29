import 'package:flutter/material.dart';
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
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                print("this is the curent index from the save file  $index");
                Books facoriteBooks = snapshot.data![index];
                return Card(
                  child: ListTile(
                    title: Text(facoriteBooks.title),
                    leading: Image.network(
                      width: 60,

                      facoriteBooks.imageLinks['thumbnail']!,
                      fit: BoxFit.fill,
                    ),
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

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
     final args = ModalRoute.of(context)?.settings.arguments as BookDetailsArguments;
     final Books book = args.bookItems;

    return  Scaffold(
      appBar: AppBar(
        title: Text(book.title),
         ),

    );
  }
}

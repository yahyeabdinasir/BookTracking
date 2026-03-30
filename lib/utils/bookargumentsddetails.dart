import 'package:read_tracking/models/books.dart';

class BookDetailsArguments {
   final Books bookItems;
   final bool  isFromSaveScreen;


   //  the constructor always is inside of the
   BookDetailsArguments({required this.bookItems , required this.isFromSaveScreen });

}


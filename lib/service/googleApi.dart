import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:read_tracking/models/books.dart';

class Googleapi {

  static const String _baseUrl = 'https://www.googleapis.com/books/v1/volumes';


  // Future<List<Books?>> SearchBooks(String Query) async {
  Future<List<Books>?> SearchBooks(String Query) async {
    var url = Uri.parse("$_baseUrl?q=$Query");
    var response = await http.get(url);
    print(response.statusCode);


    if (response.statusCode == 200) {
      var  data = jsonDecode(response.body);
      print("this si the data   , ${data['totalItems']}");
      if (data["items"] != null) {
        final items = data['items'] as List<dynamic>;
        List<Books> books = items.map((books) => Books.fromjson(books as Map<String , dynamic>)).toList();
        print("this si the data  from if   , ${data}");
        return books;
      }
      // print("this si the data  from if   , ${data}");

      else{
        return [];
      }
    }
    else {
      throw Exception(" network failed to load ") ;
    }
  }

}


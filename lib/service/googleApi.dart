import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:read_tracking/models/books.dart';

class Googleapi {

  static const String _baseUrl = 'https://www.googleapis.com/books/v1/volumes';


  Future<List<Books?>> SearchBooks(String Query) async {
    
    var url = Uri.parse("$_baseUrl?q=Query");
    var response = await http.get(url);
    print(response.statusCode);


  if (response.statusCode == 200) {
  final data = jsonDecode(response.body);
  if (data["items"] != null && data["items"] is List ){
    List<Books> books = (data['items'] as List<dynamic>).map((books) => Books.fromjson( books as  Map<String , dynamic>)).toList();
    return books;

  }
  print("this si the data   , ${data}");

  }
  throw Exception('Failed to load books');
  }

  }





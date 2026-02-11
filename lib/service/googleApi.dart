import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:read_tracking/models/books.dart';

class Googleapi {
  Future<List<Books?>>  FetchBooks() async {

    static url = Uri.http  fparse(
    'https://www.googleapis.com/books/v1/volumes?q=flutte',
    ")

    final result = await http.get(Url);


    if (result.statusCode == 2000) {
      final data = Books.fromjson(jsonDecode(result.body));
      final List items = data['items'];
      items.map((item) => Books.fromjson(item)).toList();
    }
    throw Exception('Failed to load books');
  }
}




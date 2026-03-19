class Books {
  final String id;
  final String title;
  final List<String> authors;
  final String description;
  final String thumbmail;

  Books({
    required this.id,
    required this.title,
    required this.authors,
    required this.thumbmail,
    required this.description,
  });

  factory Books.fromjson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] ?? {};
    final imageLinks = volumeInfo['imageLinks'] as Map<String, dynamic>?;

    return Books(
      id: json['id'] ?? '',
      title: volumeInfo['title'] ?? "no title",
      authors: (volumeInfo['authors'] as List<dynamic>?)
              ?.map((toElement) => toElement.toString())
              .toList() ??
          [],
      description: volumeInfo['description'] ?? '',
      // Google Books returns `imageLinks.thumbnail` (and sometimes `smallThumbnail`).
      // Your previous code used a misspelled key (`thubnail`) which results in an empty URL.
      thumbmail: (imageLinks?['thumbnail'] ?? imageLinks?['smallThumbnail'] ?? '')
          .toString(),
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'title': title,
      'authors': authors,
      'description': description,
      'thumbnail': thumbmail,
    };
  }
  @override
  String toString(){
    return this.title;
  }
}




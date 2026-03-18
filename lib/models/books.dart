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

    return Books(
      id: json['id'] ?? '',
      title: volumeInfo['title'] ?? "no title",
      authors:
          (volumeInfo['authors'] as List<dynamic>?)
              ?.map((toElement) => toElement.toString())
              .toList() ??
          [],
      description: volumeInfo['description'] ?? '',
      thumbmail: volumeInfo['imageLinks']?['thubnail'] ?? '',
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'title': title,
      'authors': authors,
      'description': description,
      'thubnail': thumbmail,
    };
  }
  @override
  String toString(){
    return this.title;
  }
}




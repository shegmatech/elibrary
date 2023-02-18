import 'dart:convert';

class BookModel {
  String title;
  String author;
  String price;
  String content;
  bool isRequested;
  BookModel({
    required this.title,
    required this.author,
    required this.price,
    required this.content,
    required this.isRequested,
  });
  

  BookModel copyWith({
    String? title,
    String? author,
    String? price,
    String? content,
    bool? isRequested,
  }) {
    return BookModel(
      title: title ?? this.title,
      author: author ?? this.author,
      price: price ?? this.price,
      content: content ?? this.content,
      isRequested: isRequested ?? this.isRequested,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'price': price,
      'content': content,
      'isRequested': isRequested,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      price: map['price'] ?? '',
      content: map['content'] ?? '',
      isRequested: map['isRequested'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) => BookModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookModel(title: $title, author: $author, price: $price, content: $content, isRequested: $isRequested)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BookModel &&
      other.title == title &&
      other.author == author &&
      other.price == price &&
      other.content == content &&
      other.isRequested == isRequested;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      author.hashCode ^
      price.hashCode ^
      content.hashCode ^
      isRequested.hashCode;
  }
}

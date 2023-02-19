import 'dart:convert';

class BookModel {
  String title;
  String author;
  String admin;
  String price;
  String content;
  bool isRequested;
  bool isApproved;
  String imgurl;
  BookModel({
    required this.title,
    required this.author,
    required this.admin,
    required this.price,
    required this.content,
    required this.isRequested,
    required this.isApproved,
    required this.imgurl,
  });
  

  BookModel copyWith({
    String? title,
    String? author,
    String? admin,
    String? price,
    String? content,
    bool? isRequested,
    bool? isApproved,
    String? imgurl,
  }) {
    return BookModel(
      title: title ?? this.title,
      author: author ?? this.author,
      admin: admin ?? this.admin,
      price: price ?? this.price,
      content: content ?? this.content,
      isRequested: isRequested ?? this.isRequested,
      isApproved: isApproved ?? this.isApproved,
      imgurl: imgurl ?? this.imgurl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'admin': admin,
      'price': price,
      'content': content,
      'isRequested': isRequested,
      'isApproved': isApproved,
      'imgurl': imgurl,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      admin: map['admin'] ?? '',
      price: map['price'] ?? '',
      content: map['content'] ?? '',
      isRequested: map['isRequested'] ?? false,
      isApproved: map['isApproved'] ?? false,
      imgurl: map['imgurl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) => BookModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookModel(title: $title, author: $author, admin: $admin, price: $price, content: $content, isRequested: $isRequested, isApproved: $isApproved, imgurl: $imgurl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BookModel &&
      other.title == title &&
      other.author == author &&
      other.admin == admin &&
      other.price == price &&
      other.content == content &&
      other.isRequested == isRequested &&
      other.isApproved == isApproved &&
      other.imgurl == imgurl;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      author.hashCode ^
      admin.hashCode ^
      price.hashCode ^
      content.hashCode ^
      isRequested.hashCode ^
      isApproved.hashCode ^
      imgurl.hashCode;
  }
}

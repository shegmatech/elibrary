import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:elibrary/infrastructure/auth/models/book_model.dart';

class UserModel {
  String firstName;
  String lastName;
  String email;
  List<BookModel> books;
  int accessLevel;
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.books,
    required this.accessLevel,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    List<BookModel>? books,
    int? accessLevel,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      books: books ?? this.books,
      accessLevel: accessLevel ?? this.accessLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'books': books.map((x) => x.toMap()).toList(),
      'accessLevel': accessLevel,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      books: List<BookModel>.from(map['books']?.map((x) => BookModel.fromMap(x))),
      accessLevel: map['accessLevel']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, email: $email, books: $books, accessLevel: $accessLevel)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      listEquals(other.books, books) &&
      other.accessLevel == accessLevel;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      books.hashCode ^
      accessLevel.hashCode;
  }
}

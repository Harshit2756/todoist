import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  TodoModel({
    this.docId,
    required this.isDone,
    required this.category,
    required this.title,
    required this.endTime,
    required this.endDate,
    required this.startTime,
    required this.startDate,
    required this.description,
  });
  String? docId;
  final bool isDone;
  final String category;
  final String title;
  final String endDate;
  final String endTime;
  final String startTime;
  final String startDate;
  final String description;

  Map<String, dynamic> toMap() {
    return {
      'isDone': isDone,
      'category': category,
      'title': title,
      'endDate': endDate,
      'endTime': endTime,
      'startTime': startTime,
      'startDate': startDate,
      'description': description,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      isDone: map['isDone'] ?? false,
      category: map['category'] ?? '',
      title: map['title'] ?? '',
      endDate: map['endDate'] ?? '',
      endTime: map['endTime'] ?? '',
      startTime: map['startTime'] ?? '',
      startDate: map['startDate'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source));

  factory TodoModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return TodoModel(
      docId: snapshot.id,
      isDone: snapshot.data()!['isDone'] ?? false,
      category: snapshot.data()!['category'] ?? '',
      title: snapshot.data()!['title'] ?? '',
      endDate: snapshot.data()!['endDate'] ?? '',
      endTime: snapshot.data()!['endTime'] ?? '',
      startTime: snapshot.data()!['startTime'] ?? '',
      startDate: snapshot.data()!['startDate'] ?? '',
      description: snapshot.data()!['description'] ?? '',
    );
  }
}

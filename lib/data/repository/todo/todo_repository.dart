import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todoist/data/repository/authentication/authentication_repository.dart';

import '../../../features/todo/model/todo_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class TodoRepository extends GetxController {
  static TodoRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance.collection('Users');

  /// Create a new todo to the user todo list collection
  Future<void> addNewTask(TodoModel todo) async {
    try {
      var uuid = const Uuid().v4();
      _db
          .doc(AuthenticatorRepository.instance.authUser!.uid)
          .collection('TodoList')
          .doc(uuid)
          .set(todo.toMap());
    } on FirebaseException catch (e) {
      throw HFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw HPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again later';
    }
  }

  /// Delete a todo
  Future<void> deleteTask(String docId) async {
    try {
      _db
          .doc(AuthenticatorRepository.instance.authUser!.uid)
          .collection('TodoList')
          .doc(docId)
          .delete();
    } on FirebaseException catch (e) {
      throw HFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw HPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again later';
    }
  }

  /// Get all todos of the user
  Stream<List<TodoModel>> getAllTodos() {
    return _db
        .doc(AuthenticatorRepository.instance.authUser!.uid)
        .collection('TodoList')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => TodoModel.fromSnapshot(doc)).toList());
  }

  /// Change the status of a todo
  Future<void> changeStatus(String docId, bool status) async {
    try {
      _db
          .doc(AuthenticatorRepository.instance.authUser!.uid)
          .collection('TodoList')
          .doc(docId)
          .update({'isDone': status});
    } on FirebaseException catch (e) {
      throw HFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw HPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again later';
    }
  }

  /// Get all todos by startdate

  /// Get all todos by Enddate

  /// Get all upcoming todos

  /// Get all overdue todos

  /// Get all completed todos
}

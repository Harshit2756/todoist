import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/widgets/popups/loaders.dart';
import '../../../data/repository/todo/todo_repository.dart';
import '../model/todo_model.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  final _todo = Get.put(TodoRepository());
  final RxList<TodoModel> todos = <TodoModel>[].obs;
  User? get authUser => _auth.currentUser;
  final isLoading = false.obs;

  String today = DateFormat('EEEE, d MMMM').format(DateTime.now());

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  /// Fetch all todos
  void fetchTodos() {
    try {
      isLoading(true);
      _todo.getAllTodos().listen((event) {
        todos.assignAll(event);
      });
    } catch (e) {
      HLoarders.errorSnackBar(title: 'Oh Snap!', message: 'Can\'t fetch todos');
    } finally {
      isLoading(false);
    }
  }

  /// Delete a todo
  void deleteTask(String docId) {
    try {
      isLoading(true);
      _todo.deleteTask(docId);
    } catch (e) {
      HLoarders.errorSnackBar(title: 'Oh Snap!', message: 'Can\'t delete todo');
    } finally {
      isLoading(false);
    }
  }

  /// Change the status of a todo
  void changeStatus(String docId, bool status) {
    try {
      isLoading(true);
      _todo.changeStatus(docId, status);
    } catch (e) {
      HLoarders.errorSnackBar(
          title: 'Oh Snap!', message: 'Can\'t change todo status');
    } finally {
      isLoading(false);
    }
  }
}

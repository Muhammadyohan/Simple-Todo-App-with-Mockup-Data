import 'package:flutter_todo_app_gpt/models/todo_model.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> load();
  Future<List<TodoModel>> loadWithoutDelay();
  Future<List<TodoModel>> search(String key);
  Future<void> add({required String name, required int cycleDays});
  Future<void> delete({required int id,});
  Future<void> update(TodoModel updatedItem);
  Future<void> action({required int id, required DateTime lastTime});
}
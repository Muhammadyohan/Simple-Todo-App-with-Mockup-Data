import 'package:flutter_todo_app_gpt/models/repositories/todo_repository.dart';
import 'package:flutter_todo_app_gpt/models/todo_model.dart';

class TodoMockRepository extends TodoRepository {
  List<TodoModel> todoList = [
    const TodoModel(1, 'ซักผ้า', 7, null),
    const TodoModel(2, 'ถูบ้าน', 10, null),
    const TodoModel(3, 'เปลี่ยนผ้าปูที่นอน', 14, null),
    const TodoModel(4, 'โทรหาแม่', 3, null),
  ];

  int lastId = 4;

  @override
  Future<List<TodoModel>> load() async {
    await Future.delayed(const Duration(seconds: 1));
    return todoList;
  }

  @override
  Future<List<TodoModel>> loadWithoutDelay() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return todoList;
  }

  @override
  Future<void> add({required String name, required int cycleDays}) async {
    await Future.delayed(const Duration(seconds: 0));
    int id = lastId + 1;
    lastId++;
    TodoModel newElement = TodoModel(id, name, cycleDays, null);
    todoList.add(newElement);
  }

  @override
  Future<void> delete({required int id}) async {
    await Future.delayed(const Duration(seconds: 0));
    todoList.removeWhere((item) => item.id == id);
  }

  @override
  Future<void> update(TodoModel updatedItem) async {
    await Future.delayed(const Duration(seconds: 0));
    final index = todoList.indexWhere((item) => item.id == updatedItem.id);
    todoList[index] = updatedItem;
  }

  @override
  Future<void> action({required int id, required DateTime lastTime}) async {
    await Future.delayed(const Duration(seconds: 0));
    final index = todoList.indexWhere((item) => item.id == id);
    todoList[index] = TodoModel(
        id, todoList[index].name, todoList[index].cycleDays, lastTime);
  }

  @override
  Future<List<TodoModel>> search(String key) async {
    await Future.delayed(const Duration(seconds: 0));
    final filteredItems = todoList
        .where((item) => item.name.toLowerCase().contains(key.toLowerCase()))
        .toList();
    return filteredItems;
  }
}

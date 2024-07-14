import 'package:flutter_todo_app_gpt/models/todo_model.dart';

sealed class TodoEvent {}

class LoadEvent extends TodoEvent {}

class SearchEvent extends TodoEvent {
  final String key;
  SearchEvent(this.key);
}

class SearchClearEvent extends TodoEvent {}

class AddEvent extends TodoEvent {
  final String name;
  final int cycleDays;
  AddEvent({required this.name, required this.cycleDays});
}

class DeleteEvent extends TodoEvent {
  final int id;
  DeleteEvent({required this.id});
}

class EditEvent extends TodoEvent {
  final TodoModel updatedItem;

  EditEvent({required this.updatedItem});
}

class TodoActionEvent extends TodoEvent {
  final int id;
  final DateTime lastTime;
  TodoActionEvent({required this.id, required this.lastTime});
}

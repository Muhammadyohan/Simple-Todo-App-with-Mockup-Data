import 'package:flutter_todo_app_gpt/models/todo_model.dart';

sealed class TodoState {
  final List<TodoModel> items;
  TodoState({required this.items});
}

const List<TodoModel> empty = [];

class LoadingState extends TodoState {
  LoadingState() : super(items: empty);
}

class LoadingWithoutDelayState extends TodoState {
  LoadingWithoutDelayState() : super(items: empty);
}

class ReadyState extends TodoState {
  ReadyState({required super.items});
}

class SearchState extends TodoState {
  SearchState({required super.items});
}
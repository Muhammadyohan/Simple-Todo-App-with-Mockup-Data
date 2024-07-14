import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final int id;
  final String name;
  final int cycleDays;
  final DateTime? lastTime;

  const TodoModel(this.id, this.name, this.cycleDays, this.lastTime);

  @override
  List<Object?> get props => [id, lastTime];
} 
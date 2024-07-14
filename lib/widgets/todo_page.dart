import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app_gpt/bloc/bloc.dart';
import 'package:flutter_todo_app_gpt/widgets/widgets.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
          return state is LoadingState || state is LoadingWithoutDelayState
              ? const SizedBox(
                  height: 550,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                )
              : const TodoList();
        }),
        const TodoAdd(),
      ],
    );
  }
}

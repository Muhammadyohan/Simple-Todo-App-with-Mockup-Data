import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app_gpt/bloc/bloc.dart';
import 'package:flutter_todo_app_gpt/models/repositories/todo_mock_repository.dart';
import 'package:flutter_todo_app_gpt/widgets/todo_page.dart';
import 'package:flutter_todo_app_gpt/widgets/todo_search_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoBloc>(create: (context) {
          final bloc = TodoBloc(repository: TodoMockRepository());
          bloc.add(LoadEvent());
          return bloc;
        })
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: Color.fromARGB(255, 136, 91, 212),
          ),
        ),
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 106, 56, 192),
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: const Text(
              'Todo App',
              style: TextStyle(
                color: Color.fromARGB(255, 52, 3, 138),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 172, 130, 243),
                  Color.fromARGB(255, 99, 44, 194)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  TodoSearchBar(),
                  TodoPage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

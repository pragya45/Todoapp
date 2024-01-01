import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/features/todo/domain/entity/task.dart';
import 'package:todoapp/features/todo/presentation/providers/task_provider.dart';
import 'package:todoapp/features/todo/presentation/view/task_list.dart';

class Todo extends ConsumerWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> tasks = ref.watch(taskListNotifierProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('To-Do App'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Completed'),
              Tab(text: 'Incomplete'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TaskList(tasks: tasks),
            TaskList(tasks: tasks.where((t) => t.isCompleted).toList()),
            TaskList(tasks: tasks.where((t) => !t.isCompleted).toList()),
          ],
        ),
      ),
    );
  }
}

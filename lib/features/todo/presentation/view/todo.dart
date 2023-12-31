import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/features/todo/domain/entity/task.dart';
import 'package:todoapp/features/todo/presentation/providers/task_provider.dart';

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
          centerTitle: true,
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
            TaskList(tasks: tasks), // All Tasks
            TaskList(
                tasks: tasks
                    .where((t) => t.isCompleted)
                    .toList()), // Completed Tasks
            TaskList(
                tasks: tasks
                    .where((t) => !t.isCompleted)
                    .toList()), // Incomplete Tasks
          ],
        ),
      ),
    );
  }
}

class TaskList extends ConsumerWidget {
  final List<Task> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          title: Text(task.title),
          leading: Radio(
            value: task.isCompleted,
            groupValue: true,
            onChanged: (bool? value) {
              ref
                  .read(taskListNotifierProvider.notifier)
                  .toggleTaskStatus(task.id);
            },
          ),
          trailing: Icon(
            task.isCompleted ? Icons.check : Icons.close,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/features/todo/domain/entity/task.dart';
import 'package:todoapp/features/todo/presentation/providers/task_provider.dart';

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
          leading: Checkbox(
            value: task.isCompleted,
            onChanged: (bool? newValue) {
              ref
                  .read(taskListNotifierProvider.notifier)
                  .toggleTaskStatus(task.id);
            },
          ),
        );
      },
    );
  }
}

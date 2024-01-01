import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/features/todo/data/repository/task_repository_iml.dart';
import 'package:todoapp/features/todo/domain/entity/task.dart';
import 'package:todoapp/features/todo/domain/repository/task_repository.dart';
import 'package:todoapp/features/todo/presentation/notifiers/task_list_notifer.dart';

import '../../domain/usecases/get_tasks.dart';

final taskListNotifierProvider =
    StateNotifierProvider<TaskListNotifier, List<Task>>((ref) {
  return TaskListNotifier()
    ..initializeTasks(); // Initialize tasks when the provider is first created
});

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return TaskRepositoryImpl();
});

final getTasksProvider = FutureProvider<List<Task>>((ref) async {
  final taskRepository = ref.read(taskRepositoryProvider);
  return await GetTasks(taskRepository).call();
});

import 'package:todoapp/features/todo/domain/entity/task.dart';
import 'package:todoapp/features/todo/domain/repository/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  // This is a mock list of tasks
  final List<Task> _tasks = [
    Task(id: '1', title: 'Task 1', isCompleted: false),
    // Add more tasks
  ];

  @override
  Future<List<Task>> getTasks() async {
    return _tasks;
  }
}

import 'package:todoapp/features/todo/domain/entity/task.dart';
import 'package:todoapp/features/todo/domain/repository/task_repository.dart';

class GetTasks {
  final TaskRepository repository;

  GetTasks(this.repository);

  Future<List<Task>> call() async {
    return await repository.getTasks();
  }
}

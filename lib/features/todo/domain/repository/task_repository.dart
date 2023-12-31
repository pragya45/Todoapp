import 'package:todoapp/features/todo/domain/entity/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();
}

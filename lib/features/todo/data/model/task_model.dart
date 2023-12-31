import 'package:todoapp/features/todo/domain/entity/task.dart';

class TaskModel extends Task {
  TaskModel(
      {required String id, required String title, bool isCompleted = false})
      : super(id: id, title: title, isCompleted: isCompleted);
}

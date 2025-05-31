import 'package:flutter/foundation.dart';
import '../model/task.dart';
import '../repository/task_repository.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskRepository _repository = TaskRepository();
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  TaskViewModel() {
    loadTasks();
  }

  Future<void> loadTasks() async {
    _tasks = await _repository.loadTasks();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    _tasks.add(task);
    await _repository.saveTasks(_tasks);
    notifyListeners();
  }

  Future<void> toggleTaskCompletion(int index) async {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    await _repository.saveTasks(_tasks);
    notifyListeners();
  }
  Future<void> deleteTask(String id) async {
    _tasks.removeWhere((task) => task.id == id);
    await _repository.saveTasks(_tasks);
    notifyListeners();
  }

  void toggleTaskStatus(String id) {
  final taskIndex = _tasks.indexWhere((task) => task.id == id);
  if (taskIndex != -1) {
    _tasks[taskIndex].isCompleted = !_tasks[taskIndex].isCompleted;
    _repository.saveTasks(_tasks);
    notifyListeners(); 
  }
}

}

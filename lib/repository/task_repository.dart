import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../model/task.dart';

class TaskRepository {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _taskFile async {
    final path = await _localPath;
    return File('$path/tasks.json');
  }

  Future<List<Task>> loadTasks() async {
    try {
      final file = await _taskFile;

      if (await file.exists()) {
        final contents = await file.readAsString();
        final List<dynamic> jsonData = jsonDecode(contents);
        return jsonData.map((e) => Task.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<void> saveTasks(List<Task> tasks) async {
    final file = await _taskFile;
    final List<Map<String, dynamic>> jsonList =
        tasks.map((task) => task.toJson()).toList();

    await file.writeAsString(jsonEncode(jsonList));
  }
}

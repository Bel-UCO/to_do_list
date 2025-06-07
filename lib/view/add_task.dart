import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/task.dart';
import '../view_model/task_view_model.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _controller = TextEditingController();

  late TaskViewModel taskViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    taskViewModel = Provider.of<TaskViewModel>(context);
  }

  void _saveTask() {
    final title = _controller.text.trim();

    final newTask = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      isCompleted: false,
    );

    taskViewModel.addTask(newTask).then((_) {
      if (taskViewModel.errorMessage == null) {
        Navigator.pop(context);
      } else {
        setState(() {}); // agar UI refresh untuk tampilkan error
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Task title',
                errorText: taskViewModel.errorMessage,
              ),
              onChanged: (_) => taskViewModel.clearError(),
              onSubmitted: (_) => _saveTask(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveTask,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

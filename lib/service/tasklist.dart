import 'package:flutter/material.dart';

import '../models/task.dart';
import 'database_service.dart';

class Tasklist with ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();

  List<Task> _taskList = [];
  String _id = "";
  String _taskName = "";
  int _int = 1;

  get taskList => _taskList;
  get taskName => _taskName;

  void changeTaskName(String taskName) {
    _taskName = taskName;
    notifyListeners();
  }

  Future<void> fetchTaskList() async {
    _taskList = await _databaseService.taskList();
    notifyListeners();
  }

  Future<void> addTask() async {
    await _databaseService.insertTask(
      Task(name: _taskName, status: 0),
    );
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    // print("Delete Task ${task.name}");
    await _databaseService.deleteTask(task.name);
    fetchTaskList();
    notifyListeners();
  }

  Future<void> updateTask(int id, String name) async {
    await _databaseService.updateTask(
      Task(id: id, name: name, status: 0),
    );
    fetchTaskList();
    notifyListeners();
  }
}

/*
  Created by: Claizel Coubeili Cepe
  Date: updated April 26, 2023
  Description: Sample todo app with Firebase 
*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../api/firebase_todo_api.dart';

import '../models/todo_model.dart';

class TodoListProvider with ChangeNotifier {

  late FirebaseTodoAPI firebaseService;
  late Stream<QuerySnapshot> _todosStream;

TodoListProvider() {
  firebaseService = FirebaseTodoAPI();
  fetchTodos();
}

Stream<QuerySnapshot> get todos => _todosStream;

fetchTodos() {
  _todosStream = firebaseService.getAllTodos();
  notifyListeners();
}


  // void addTodo(Todo item) {
  //   _todoList.add(item);
  //   notifyListeners();
  // }

  void addTodo(Todo item) async {
    String message = await firebaseService.addTodo(item.toJson(item));
    print(message);
    notifyListeners();
  }

  void editTodo(int index, String newTitle) {
    // _todoList[index].title = newTitle;
    notifyListeners();
  }

  void deleteTodo(String title) {
    // for (int i = 0; i < _todoList.length; i++) {
    //   if (_todoList[i].title == title) {
    //     _todoList.remove(_todoList[i]);
    //   }
    // }
    notifyListeners();
  }

  void toggleStatus(int index, bool status) {
    // _todoList[index].completed = status;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class ToDoActions extends StatelessWidget {
  final ToDoItem todo;
  final whenChanged;
  final whenDeleted;

  const ToDoActions({
    Key? key,
    required this.todo,
    required this.whenChanged,
    required this.whenDeleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          whenChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading: Icon(
            todo.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.lightGreen),
        title: Text(
          todo.itemName!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              whenDeleted(todo.itemName);
            },
          ),
        ),
      ),
    );
  }
}

class ToDoItem {
  String? itemName;
  bool isCompleted;

  ToDoItem({
    required this.itemName,
    this.isCompleted = false,
  });

  static List<ToDoItem> todolist() {
    return [
      ToDoItem(itemName: 'Make ToDo app', isCompleted: true),
    ];
  }
}

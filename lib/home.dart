import 'package:flutter/material.dart';
import 'todoactions.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final todosList = ToDoItem.todolist();
  List<ToDoItem> todoList = [];
  final textboxController = TextEditingController();

  @override
  void initState() {
    todoList = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: Text(
                          'Your Tasks',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      for (ToDoItem todo2 in todoList.reversed)
                        ToDoActions(
                          todo: todo2,
                          whenChanged: handleChange,
                          whenDeleted: deleteElement,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: textboxController,
                    decoration: InputDecoration(
                        hintText: 'Add new task', border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                //creates the add button
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  onPressed: () {
                    addTask(textboxController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void handleChange(ToDoItem todo) {
    setState(() {
      todo.isCompleted = !todo.isCompleted;
    });
  }

  void deleteElement(String id) {
    setState(() {
      todosList.removeWhere((item) => item.itemName == id);
    });
  }

  void addTask(String toDo) {
    setState(() {
      todosList.add(ToDoItem(
        itemName: toDo,
      ));
    });
    textboxController.clear();
  }
}

import 'package:flutter/material.dart';
import 'package:todo/model/model.dart';
import 'package:todo/todo_item/todo_item.dart';

class TodoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodoPage();
  }
}

class _TodoPage extends State<TodoPage> {
  List<TodoModel> models = [
    TodoModel(title: 'Lunch', desc: 'Hello, have are you', done: true),
    TodoModel(title: 'Lunch', desc: 'Hello, have are you', done: false),
    TodoModel(title: 'Lunch', desc: 'Hello, have are you', done: true),
    TodoModel(title: 'Lunch', desc: 'Hello, have are you', done: false),
    TodoModel(title: 'Lunch', desc: 'Hello, have are you', done: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container( 
              padding: EdgeInsets.all(10),
               width: double.infinity,
               height: 50,
               decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.black),
               ),
               child:  TextField(
                  decoration: InputDecoration(
                      suffix: Icon(Icons.search), hintText: 'Поиск...'),
                ),
              
            ),
            Expanded(
              child: ListView.builder(
                itemCount: models.length,
                itemBuilder: (context, index) {
                  return TodoItemWidget(todoModel: models[index], onDelelete: (){
                  setState(() {
                    models.removeAt(index);
                  });
                  });
                },
              ),
            )
          ],
        ),
        
      ),
      floatingActionButton: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(Icons.add,),
      ),
    );
  }
}


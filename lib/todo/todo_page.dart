import 'package:flutter/material.dart';
import 'package:todo/model/model.dart';
import 'package:todo/widget/add_buttom_sheet.dart';
import 'package:todo/widget/todo_item.dart';

class TodoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodoPage();
  }
}

class _TodoPage extends State<TodoPage> {
  List<TodoModel> todos = [];
  List<TodoModel> searchedTodo = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black),
                 ),
                 child:  TextField(
                  onChanged: (text){
                  setState(() {
                    searchedTodo=todos.where((todo){
                      return todo.title.contains(text);
                    }).toList();
                  });
                  },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                        suffix: Icon(Icons.search,), hintText: 'Поиск...'),
                  ),
                
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: searchedTodo.length,
                  itemBuilder: (context, index) {
                    return TodoItemWidget(todoModel: searchedTodo[index], onDelelete: (){
                    setState(() {
                      searchedTodo.removeAt(index);
                    });
                    }, onEdit: () {
                      AddButtomSheet(context,(todo){
                        setState(() {
                          searchedTodo[index]= todo;
                        });
                      }, todoModel: searchedTodo[index]);
                    },);
                  },
                ),
              )
            ],
          ),
          
        ),
        floatingActionButton: InkWell(onTap: () {
          AddButtomSheet(context, (todo){
            setState(() {
              todos.insert(0, todo);
              searchedTodo.insert(0, todo);
            });
          });
        },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(Icons.add, color: Colors.white,),
          ),
        ),
      ),
    );
  }
}


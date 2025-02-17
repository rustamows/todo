import 'package:flutter/material.dart';
import 'package:todo/model/model.dart';

class AddButtomSheet {
  AddButtomSheet(BuildContext context, Function(TodoModel) add, {TodoModel? todoModel}){
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descEditingController = TextEditingController();
    if (todoModel!=null) {
      titleEditingController.text = todoModel.title;
      descEditingController.text = todoModel.desc;
    }
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
           padding: EdgeInsets.fromLTRB(17, 27, 17, 36),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  todoModel==null? 'Добавить задачу':'Изменить задачу',
                  style:  TextStyle( fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Название'),
                      controller: titleEditingController,
                    ),
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Описание'),
                      controller: descEditingController,
                      maxLines: 5,
                    ),
                  ),
                ),
                
                InkWell(
                  onTap: () {
                    if (titleEditingController.text.isEmpty) {
                    return;
                  }
                  TodoModel todoModel = TodoModel(
                      title: titleEditingController.text,
                      desc: descEditingController.text);
                  add(todoModel);
                  Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: Text(
                      todoModel==null? 'Добавить': 'Изменить',
                      style: TextStyle( color: Colors.white,
                          fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';

import 'package:todo/model/model.dart';
import 'package:todo/widget/add_buttom_sheet.dart';

class TodoItemWidget extends StatefulWidget {
  final TodoModel todoModel;
  const TodoItemWidget({
    Key? key,
    required this.todoModel,
    required this.onDelelete,
    required this.onEdit,
  });
  final Function() onDelelete;
  final Function() onEdit;

  @override
  State<StatefulWidget> createState() {
    return _TodoItemWidget();
  }
}

class _TodoItemWidget extends State<TodoItemWidget> {
  List<TodoModel> models = [];
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue, width: 2)),
        padding: EdgeInsets.all(15),
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Expanded(
                  child: Text(
                widget.todoModel.title,
                style: TextStyle(color: Colors.black),
              )),
              Checkbox(
                  checkColor: Colors.blue,
                  fillColor: WidgetStatePropertyAll(Colors.white),
                  value: widget.todoModel.done,
                  onChanged: (v) {
                    setState(() {
                      widget.todoModel.done = v!;
                    });
                  }),
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                              height: 170,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14)),
                              child: Expanded(
                                  child: Column(
                                children: [
                                  Text(
                                    'Внимание',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Вы действительно хотите',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('удалить?',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            border: Border.all(
                                                color: Colors.red, width: 2),
                                          ),
                                          child: Text('Отменить'),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                          widget.onDelelete();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            border: Border.all(
                                                color: Colors.green, width: 2),
                                          ),
                                          child: Text('Удалить'),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                            ),
                          ),
                        );
                      });
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              IconButton(
                  onPressed: widget.onEdit,
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ))
            ]),
            Text(widget.todoModel.desc),
          ],
        ));
  }
}

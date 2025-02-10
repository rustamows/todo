import 'package:flutter/material.dart';

import 'package:todo/model/model.dart';

class TodoItemWidget extends StatefulWidget {
  final TodoModel todoModel;
  const TodoItemWidget({
    Key? key,
    required this.todoModel,
    required this.onDelelete,
  });
  final Function() onDelelete;

  @override
  State<StatefulWidget> createState() {
    return _TodoItemWidget();
  }
}

class _TodoItemWidget extends State<TodoItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.todoModel.title),
                Row(
                  children: [
                    Checkbox(
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
                                    height: 200,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(14)),
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
                                                width: 100,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(16),
                                                    border: Border.all(
                                                        color: Colors.red,
                                                        width: 2),
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
                                                width: 100,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(16),
                                                    border: Border.all(
                                                        color: Colors.green,
                                                        width: 2),
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
                      icon: Icon(Icons.delete),
                    ),
                    Icon(Icons.delete)
                  ],
                )
              ],
            ),
            Text(widget.todoModel.desc),
          ],
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white10, borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue, width: 2)),
      ),
    );
  }
}

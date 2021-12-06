import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_application/main.dart';
import 'package:todo_application/ui/home/database/modal/Todo.dart';

class TodoItem extends StatelessWidget {
  Todo todo;
  Function onDeleteAction,onItemCheck,onItemPressed;
  TodoItem(this.todo,this.onDeleteAction,this.onItemCheck,this.onItemPressed);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){onItemPressed(todo,context);},
      child: Container(
        margin: EdgeInsets.symmetric(vertical:4,horizontal: 12),
        child: Slidable(
          closeOnScroll: true,
          actionExtentRatio: .3,
          child: Container(
            decoration: BoxDecoration(
              color: MyThemeData.colorWhite,
              borderRadius: BorderRadius.circular(12)
            ),
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: todo.isDone?Colors.green:MyThemeData.primaryColor,
                  ),
                  width: 4,
                  height: 80,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(todo.title,style:
                          TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color:todo.isDone?Colors.green: MyThemeData.primaryColor),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(todo.dateTime.toString(),textAlign: TextAlign.center,)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    onItemCheck(todo);
                  },
                  child:todo.isDone?
                  Container(
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('Done !',style: TextStyle(fontSize: 22,color: Colors.green,fontWeight: FontWeight.bold),))
                  :Container(
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: MyThemeData.primaryColor,
                      ),
                    child: Icon(Icons.check,color: Colors.white,),
                  ),
                )
              ],
            ),
          ),
          actionPane: SlidableScrollActionPane(),
          actions: [

            IconSlideAction(
              onTap: (){
                onDeleteAction(todo);
              },
              color: Colors.transparent,
              iconWidget: Container(
                width: double.infinity,
                height: double.infinity,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12)
                      ,bottomLeft: Radius.circular(12))
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete,color: Colors.white,),
                      Text('delete',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

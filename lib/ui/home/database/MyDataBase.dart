import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_application/ui/home/database/modal/Todo.dart';
void initDataBase()async{
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
}
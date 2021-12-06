import 'package:flutter/material.dart';
import 'package:todo_application/ui/home/AddTodo/AddTodoBottomSheet.dart';
import 'package:todo_application/ui/home/list/TodoListFragment.dart';
import 'package:todo_application/ui/home/settings/SettingsFragment.dart';

class HomeScreen extends StatefulWidget {
  static final ROUTE_NAME ='home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,),
        onPressed: (){
          openAddTodo();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        toolbarHeight: 120,
        title: Text('Route Todo List'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (int position){
            setState(() {
              selectedIndex=position;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
                icon: Icon(Icons.list)
            ),
            BottomNavigationBarItem(
              label: 'Settings',
                icon: Icon(Icons.settings)
            ),
          ],
        ),
      ),
      body: getSelectedWidget(),
    );
  }
  void openAddTodo(){
    showModalBottomSheet(context: context, builder: (builder){
        return AddTodoBottomSheet();
      },
    isScrollControlled: true
    );
  }
  Widget getSelectedWidget(){
    if(selectedIndex==0)
      return TodoListFragment();
    return SettingsFragment();
  }
}

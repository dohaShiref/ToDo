import 'package:flutter/material.dart';
import 'package:todo_application/Home/to_do_list.dart';
import 'package:todo_application/Home/to_do_setting_tab.dart';
import 'package:todo_application/MyThemeData.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: my_theme_data.LightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text('ToDo App'),
        centerTitle: false,
      ),
      floatingActionButton: FloatingActionButton(
        shape: const StadiumBorder(side: BorderSide(color: Colors.white, width: 2)),
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: BottomNavigationBar(
          onTap: (index) {
            currentTabIndex = index;
            setState(() {});
          },
          currentIndex: currentTabIndex,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(label: '', icon: Icon(Icons.list)),
            BottomNavigationBarItem(label: '', icon: Icon(Icons.settings))
          ],
        ),
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
      ),
      body: tabs[currentTabIndex],
    );
  }
  List<Widget>tabs=[
    ToDoListTab(),
    ToDoSettingTab()
  ];
}

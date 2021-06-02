import 'package:flutte_things_todo/screens/item_list.dart';
import 'package:flutte_things_todo/screens/task_screen.dart';
import 'package:flutte_things_todo/widgets/custom_drawer.dart';
import 'package:flutte_things_todo/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7646FF),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: CustomSearchBar(),
        ),
        title: _customTitle(text: 'Things', text2: 'Todo'),
        leading: _customLeadingIcon(),
        actions: [_customRightIconButton(context)],
      ),
      drawer: CustomDrawer(),
      body: ItemList(),
    );
  }

  Widget _customTitle({String text, String text2}) => Row(
        children: [
          Text(text),
          Text(
            text2,
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          Icon(Icons.run_circle_outlined),
        ],
      );
  Widget _customLeadingIcon() => Builder(
        builder: (BuildContext context) {
          return IconButton(
              icon: Icon(Icons.format_align_left_sharp, size: 30),
              onPressed: () => Scaffold.of(context).openDrawer());
        },
      );
  Widget _customRightIconButton(context) => IconButton(
      icon: Icon(
        Icons.add,
        size: 30,
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TaskScreen(
                      appTitle: 'Add Task',
                    )));
      });
}

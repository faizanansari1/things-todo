import 'package:flutte_things_todo/models/user_list.dart';
import 'package:flutte_things_todo/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key key, this.appTitle}) : super(key: key);

  final String appTitle;
  @override
  _TaskScreenState createState() => _TaskScreenState(this.appTitle);
}

class _TaskScreenState extends State<TaskScreen> {
  String appTitle;
  final format = DateFormat("yyyy-MM-dd HH:mm");
  _TaskScreenState(this.appTitle);
  bool orange = false, blue = false, red = false, green = false;

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priorityController = TextEditingController();
  final _getDatePicker = TextEditingController();
  final _isCompleted = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF7646FF),
          title: Text(appTitle),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _addFormKey,
              child: Column(
                children: [
                  _taskName(),
                  _description(),
                  _category(),
                  _datePicker(context),
                  _priority(),
                  SizedBox(height: 120),
                  _addButton(),
                ],
              )),
        ));
  }

  Widget _taskName() => Container(
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.grey[300])),
        ),
        padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: _nameController,
          style: TextStyle(fontSize: 16.00),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Task Name',
          ),
        ),
      );

  Widget _description() => Container(
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.grey[300])),
        ),
        padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: _descriptionController,
          style: TextStyle(fontSize: 16.00),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Description',
          ),
        ),
      );

  Widget _category() => Container(
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.grey[300])),
        ),
        padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: _categoryController,
          style: TextStyle(fontSize: 16.00),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Category',
          ),
        ),
      );

  Widget _datePicker(context) => Container(
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.grey[300])),
        ),
        padding: EdgeInsets.all(10),
        child: DateTimeField(
          decoration: InputDecoration(
              hintText: 'Pick Date & Time', border: InputBorder.none),
          format: format,
          controller: _getDatePicker,
          onShowPicker: (context, currentValue) async {
            final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              return DateTimeField.combine(date, time);
            } else {
              return currentValue;
            }
          },
        ),
      );

  Widget _priority() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey[300])),
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16, left: 10),
              child: Text(
                'Priority',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              // color: Colors.amber,
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey[300])),
            ),
            width: double.infinity,
            child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16, left: 10),
                child: Row(
                  children: [
                    IconButton(
                        icon: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: red
                                  ? Color(0xFFFC5565).withOpacity(0.4)
                                  : Colors.white,
                              border: Border.all(
                                  width: 1,
                                  color: Colors.white.withOpacity(0.7)),
                            ),
                            child: Icon(Icons.stop_circle,
                                color: Color(0xFFFC5565))),
                        onPressed: () => {
                              setState(() {
                                red = !red;
                                print(red);
                              })
                            }),
                    IconButton(
                        icon: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: orange
                                  ? Color(0xFFFA9B4A).withOpacity(0.4)
                                  : Colors.white,
                              border: Border.all(
                                  width: 1,
                                  color: Colors.white.withOpacity(0.7)),
                            ),
                            child: Icon(Icons.stop_circle,
                                color: Color(0xFFFA9B4A))),
                        onPressed: () {
                          setState(() {
                            orange = !orange;
                          });
                        }),
                    IconButton(
                        icon: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: blue
                                  ? Color(0xFF58BBF7).withOpacity(0.4)
                                  : Colors.white,
                              border: Border.all(
                                  width: 1,
                                  color: Colors.white.withOpacity(0.7)),
                            ),
                            child: Icon(Icons.stop_circle,
                                color: Color(0xFF58BBF7))),
                        onPressed: () {
                          setState(() {
                            blue = !blue;
                          });
                        }),
                    IconButton(
                        icon: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: green
                                  ? Color(0xFF4CCB41).withOpacity(0.4)
                                  : Colors.white,
                              border: Border.all(
                                  width: 1,
                                  color: Colors.white.withOpacity(0.7)),
                            ),
                            child: Icon(Icons.stop_circle,
                                color: Color(0xFF4CCB41))),
                        onPressed: () {
                          setState(() {
                            green = !green;
                          });
                        }),
                  ],
                )),
          ),
        ],
      );

  Widget _addButton() => Container(
        width: double.infinity,
        child: ElevatedButton(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'ADD',
              style: TextStyle(fontSize: 20.00),
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFF7646FF)),
          ),
          onPressed: () {
            if (_addFormKey.currentState.validate()) {
              _addFormKey.currentState.save();
              api.createUserList(UserList(
                id: '12',
                title: _nameController.text,
                description: _descriptionController.text,
                category: _categoryController.text,
                priority: int.parse(_priorityController.text),
                isCompleted: _isCompleted,
                timestamp: _getDatePicker.text,
              ));
            }
          },
        ),
      );
}

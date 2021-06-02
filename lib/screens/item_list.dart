import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _customBoxShadow = BoxDecoration(color: Colors.white,
        // borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 3,
            color: Colors.grey.withOpacity(0.3),
          ),
        ]);
    final list = [1, 2, 3, 4];
    return Container(
      color: Colors.grey[200],
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: _customBoxShadow,
                height: 216,
                child: _customSlidableTiles(list: list)),
            // Container(
            //     decoration: _customBoxShadow,
            //     height: 222,
            //     child: _customSlidableTiles(list: list)),
            // SizedBox(height: 20),
            // Container(
            //     decoration: _customBoxShadow,
            //     height: 222,
            //     child: _customSlidableTiles(list: list)),
            // SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _customSlidableTiles({List list}) => Expanded(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) => Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('04:00',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF172735))),
                    Text('PM',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF172735)))
                  ],
                ),
                title: Text('Meating with client'),
                subtitle: Text('Office'),
                trailing: Container(
                  width: 70,
                  child: Row(
                    children: [
                      SizedBox(
                        child: SmoothStarRating(
                          starCount: 1,
                          size: 25,
                          color: Colors.yellow,
                          borderColor: Colors.grey,
                          allowHalfRating: false,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.stop_circle,
                          color: index == 0
                              ? Color(0xFF58BBF7)
                              : index == 1
                                  ? Color(0xFF0FFFA9B4A)
                                  : Color(0xFF4CCB41)),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              GestureDetector(
                child: Container(
                  height: double.infinity,
                  color: Color(0xFF4CCB41),
                  child: Center(
                    child: Text('Done',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
                onTap: () {},
              )
            ],
            secondaryActions: [
              GestureDetector(
                child: Container(
                  height: double.infinity,
                  color: Color(0xFFFC5565),
                  child: Center(
                    child: Text('Remove',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
                onTap: () {},
              )
            ],
          ),
        ),
      );
}

import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 15,
        left: 15,
        right: 15,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 0,
                  color: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
            child: _searchField()),
      ),
    );
  }

  Widget _searchField() => TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(
            15,
          ),
          hintText: 'Search Task',
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
        ),
      );
}

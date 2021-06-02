import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutte_things_todo/screens/login_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _customHeader(),
          _customItem(icon: Icons.add, text: 'New Task', onTap: null),
          _customItem(
              icon: Icons.login,
              text: 'Logout',
              onTap: () {
                auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }),
        ],
      ),
    );
  }

  Widget _customHeader() => DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Container(
          color: Color(0xFF7646FF),
          child: Center(
              child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Colors.white.withOpacity(0.7)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 8,
                      color: Color(0xFF465FFF33),
                      // offset: Offset(0, 0),
                    ),
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://lh3.googleusercontent.com/a-/AOh14GgPj2Wh88CRKYyDYPWboclm3nxUlWz6aFJ66ojG3Xw=s40'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Ishaq Hassan',
                style: TextStyle(color: Colors.white, fontSize: 22.00),
              )
            ],
          )),
        ),
      );

  Widget _customItem({IconData icon, String text, GestureTapCallback onTap}) =>
      ListTile(
        title: Row(
          children: [
            Icon(
              icon,
              size: 26,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        onTap: onTap,
      );
}

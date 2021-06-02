import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutte_things_todo/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: logoWidget(),
              ),
              SizedBox(height: 40),
              formWidget(context),
              SizedBox(height: 50),
              socialMediaWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget logoWidget() => Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              bottom: 45,
              child: Text(
                'THINGS',
                style: TextStyle(
                  color: Color(0xFF172735),
                  fontSize: 50.00,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'TOD',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xFF172735),
                    fontSize: 56.00,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Icon(
                  Icons.run_circle_outlined,
                  size: 50.00,
                  color: Color(0xFF6035D0),
                ),
              ],
            ),
          ],
        ),
      );

  Widget formWidget(context) => Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(0.5),
                  // offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(fontSize: 20.00),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.person_outline,
                        size: 30.00,
                        color: Colors.grey,
                      ),
                      hintText: 'Username',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                  ),
                ),
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1.0, color: Colors.grey[300]))),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(fontSize: 20.00),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.lock_outlined,
                        size: 30.00,
                        color: Colors.grey,
                      ),
                      hintText: 'Password',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20.00),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF6035D0)),
                  ),
                  onPressed: () => _signIn(_email, _password)),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(left: 20, right: 20),
          //   child: SizedBox(
          //     width: double.infinity,
          //     child: ElevatedButton(
          //       child: Padding(
          //         padding: const EdgeInsets.all(15.0),
          //         child: Text(
          //           'Sign Up',
          //           style: TextStyle(fontSize: 20.00),
          //         ),
          //       ),
          //       style: ButtonStyle(
          //         backgroundColor: MaterialStateProperty.all(Color(0xFF6035D0)),
          //       ),
          //       onPressed: () {
          //         auth.createUserWithEmailAndPassword(
          //             email: _email, password: _password);
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => HomeScreen()));
          //       },
          //     ),
          //   ),
          // ),
        ],
      );

  Widget socialMediaWidget() => Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 110,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1.0, color: Colors.grey[300]))),
                ),
                Text(
                  'OR',
                  style: TextStyle(fontSize: 20.00, color: Colors.grey[300]),
                ),
                Container(
                  width: 110,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1.0, color: Colors.grey[300]))),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              'login using social media',
              style: TextStyle(color: Colors.grey[500], fontSize: 18.00),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'G',
                style: TextStyle(fontSize: 30),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
              ),
            )
          ],
        ),
      );

  _signIn(String _email, String _password) async {
    try {
      await auth.signInWithEmailAndPassword(email: _email, password: _password);
      //success
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (error) {
      print('FIRREBASE EROOR:: $error');
      Fluttertoast.showToast(
          msg: error.message,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue);
    }
  }
}

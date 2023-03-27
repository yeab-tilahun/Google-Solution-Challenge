// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:studygini/pages/AuthService.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

void showOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              // Navigate to profile screen
              Navigator.pushNamed(context, '/profile');
              // runApp(ProfilePage());
              // Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Perform logout action
              AuthService().signOut();
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

class _profileState extends State<profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Profile'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              showOptions(context);
            },
            child: Container(
              width: 50,
              height: 50,
              child: CircleAvatar(
                backgroundImage: NetworkImage(user!.photoURL!),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(user!.photoURL!),
                radius: 60,
              ),
            ),
            // SizedBox(
            //   height: 15,
            // ),
            // Center(
            //   child: Icon(
            //     Icons.settings,
            //     color: Colors.black,
            //   ),
            // ),
            Divider(
              height: 50,
              color: Colors.grey[800],
            ),
            Container(
              height: 250,
              width: 500,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.blueGrey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "NAME",
                    style: TextStyle(
                        color: Colors.teal[100],
                        letterSpacing: 2,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.displayName!,
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                        color: Colors.teal[100],
                        letterSpacing: 2,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.email!,
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "ID",
                    style: TextStyle(
                        color: Colors.teal[100],
                        letterSpacing: 2,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(user.uid,
                      style: TextStyle(
                          color: Colors.white, letterSpacing: 1, fontSize: 15)),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        elevation: 8.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              iconSize: 40.0,
              icon: Icon(
                Icons.near_me,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            SizedBox(width: 32.0),
            SizedBox(width: 32.0),
            IconButton(
              iconSize: 40.0,
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/NotificationPage');
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, '/addIssue');
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    ));
  }
}

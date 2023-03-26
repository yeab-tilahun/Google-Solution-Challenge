// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print
import 'package:flutter/material.dart';
// import 'package:issuetracker/PAGES/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:studygini/pages/AuthService.dart';

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

class NotificationPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(96, 125, 139, 1),
        title: Text('Issues Near You'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              showOptions(context);
            },
            child: Container(
              width: 50,
              height: 50,
              child: CircleAvatar(
                // backgroundImage: AssetImage('asset/sidePortriat.jpg'),
                backgroundImage: NetworkImage(user!.photoURL!),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL!),
            ),
            title: Text('The issue you reported has been resolved'),
            subtitle: Text('Thank you for reporting the issue!'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              //
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL!),
            ),
            title: Text('The issue you reported has been resolved'),
            subtitle: Text('Thank you for reporting the issue!'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              //
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL!),
            ),
            title: Text('The issue you reported has been resolved'),
            subtitle: Text('Thank you for reporting the issue!'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // TODO: Open Sarah's blog post
            },
          ),
        ],
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
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skincare/pages/komponen/body.dart';
import 'package:flutter_skincare/pages/mainhome.dart';
import 'package:flutter_skincare/pages/login_page.dart';
import 'package:flutter_skincare/pages/sign_in.dart';
import 'komponen/body.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
          )
        ],
      ),
      body: Body(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://www.wowkeren.com/display/images/photo/2020/08/19/00325787.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("MAIN MENU"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Rekomendasi"),
              onTap: () {
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (_) => HomePage());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: Icon(Icons.create_new_folder_rounded),
              title: Text("Custom"),
              onTap: () {
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (_) => MainHome());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log Out"),
              onTap: () {
                signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil( //utk mengambil kembali kemudian di push
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }), ModalRoute.withName('/')
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
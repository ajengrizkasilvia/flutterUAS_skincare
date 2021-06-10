import 'package:flutter/material.dart';
import 'package:flutter_skincare/Kategori/homeKat.dart';
import 'package:flutter_skincare/pages/home_page.dart';
import 'package:flutter_skincare/pages/login_page.dart';
import 'package:flutter_skincare/pages/sign_in.dart';
import 'produk_page.dart';
import 'kategori_page.dart';


class MainHome extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }), ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
      
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink[100],
            title: Text("SOLCARE"),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Product",
                  ),
                Tab(
                  text : "Kategori"
                ),
              ],
            ),
          ),
              body: 
              TabBarView(
                children: [
                  Home(),
                  HomeKat(),
                ],
              ),
          ),
        ),
    );
  }
}
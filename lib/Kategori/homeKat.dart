import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'AddScreen.dart';
import 'itemKatList.dart';

//pendukung program asinkron
class HomeKat extends StatefulWidget {
  @override
  HomeKatState createState() => HomeKatState();
}

class HomeKatState extends State<HomeKat> {
  @override
  CollectionReference _kategori =
      FirebaseFirestore.instance.collection('KategoriSkincare');
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CustomColors.firebaseNavy,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: CustomColors.firebaseNavy,
        // title: AppBarTitle(),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        backgroundColor: Colors.blue[300],
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: ItemListKategori(),
        ),
      ),
    );
  }
}

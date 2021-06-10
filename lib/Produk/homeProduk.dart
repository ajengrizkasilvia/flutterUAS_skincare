import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_skincare/Produk/addScreenProduk.dart';
import 'itemProdukList.dart';

//pendukung program asinkron
class HomeProduk extends StatefulWidget {
  @override
  HomeProdukState createState() => HomeProdukState();
}

class HomeProdukState extends State<HomeProduk> {
  @override
  CollectionReference _produk =
      FirebaseFirestore.instance.collection('ProdukSkincare');
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
              builder: (context) => AddScreenProduk(),
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
          child: ItemListProduk(),
        ),
      ),
    );
  }
}

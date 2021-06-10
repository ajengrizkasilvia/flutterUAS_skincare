import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_skincare/pages/entryformProduk.dart';
import 'package:flutter_skincare/database/item.dart';


//pendukung program asinkron
class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  CollectionReference _produk =
      FirebaseFirestore.instance.collection('Produk');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.white, Colors.white10],
          ),
        ),
        child: Column(children: [
          Expanded(
            child: ListView(
                children: [
                  // TODO 2 VIEW, update , and delete DATA HERE
                  /// hanya get sekali saja jika menggunakan FutureBuilder
                  /*
                  FutureBuilder<QuerySnapshot>(
                    future: _pengguna.get(),
                    builder: (buildContext, snapshot) {
                      return Column(
                        children: snapshot.data!.docs
                            .map((e) =>
                                ItemCard(e.data()['name'], e.data()['age']))
                            .toList(),
                      );
                    },
                  ),
                  */

                  // get secara realtime jikga menggunakan stream builder
                  StreamBuilder<QuerySnapshot>(
                    // contoh penggunaan srteam
                    // _pengguna.orderBy('age', descending: true).snapshots()
                    // _pengguna.where('age', isLessThan: 30).snapshots()
                    stream:
                        _produk.orderBy('nama', descending: true).snapshots(),
                    builder: (buildContext, snapshot) {
                      return Column(
                        children: snapshot.data.docs
                            .map((e) => ItemProduk(
                                  e.data()['nama'],
                                  e.data()['brand'],
                                  e.data()['harga'],
                                  e.data()['kode'],
                                  e.data()['kategori'],
                                  onUpdate: () {
                                    _produk
                                        .doc(e.id)
                                        .update({"nama": e.data()['nama'] + 1});
                                  },
                                  onDelete: () {
                                    _produk.doc(e.id).delete();
                                  },
                                ),
                              )
                            .toList(),
                      );
                    },
                  ),
                  SizedBox(
                    height: 150,
                  )
                ],
              ),
            ),
          
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(children: <Widget>[
              Expanded(
                child: RaisedButton(
                    color: Colors.blue[200],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Add',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    onPressed: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return EntryForm();
                          },
                        ),
                      );
                    }),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}

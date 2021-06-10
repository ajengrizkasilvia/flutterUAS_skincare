import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_skincare/pages/entryformKategori.dart';
import 'package:flutter_skincare/database/kategori.dart';

//pendukung program asinkron
class Home2 extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home2> {
  CollectionReference _kategori =
      FirebaseFirestore.instance.collection('Kategori');
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
                  stream: _kategori
                      .orderBy('kategori', descending: false)
                      .snapshots(),
                  builder: (buildContext, snapshot) {
                    return Column(
                      children: snapshot.data.docs
                          .map(
                            (e) => Kategori(
                              e.data()['kategori'],
                              e.data()['tipewajah'],
                              onUpdate: () {
                                _kategori.doc(e.id).update({
                                  "kategori": e.data()['kategori'] + 1
                                });
                              },
                              onDelete: () {
                                _kategori.doc(e.id).delete();
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
                            return EntryFormKategori();
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

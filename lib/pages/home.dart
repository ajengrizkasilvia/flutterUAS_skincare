import 'package:flutter/material.dart';
import 'package:flutter_skincare/pages/entryform.dart';

//pendukung program asinkron
class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
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
            child: Text(
              "",
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(children: <Widget>[
              Expanded(
                child: RaisedButton(
                    color: Colors.blueGrey,
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

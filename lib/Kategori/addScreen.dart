import 'package:flutter/material.dart';
import 'addKategori.dart';


class AddScreen extends StatelessWidget {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
      },
      child: Scaffold(
        // backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
           elevation: 0,
           backgroundColor: Colors.pink[100],
           title: Text('Tambah Data Kategori'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddKategori(
              kategoriFocusNode: _titleFocusNode,
              tipewajahFocusNode: _descriptionFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
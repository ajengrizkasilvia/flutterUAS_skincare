import 'package:flutter/material.dart';
import 'package:flutter_skincare/database/dbKategori.dart';
import 'editItemKat.dart';

class EditScreenKategori extends StatefulWidget {
  final String currentKategori;
  final String currentTipewajah;
  final String documentId;

  EditScreenKategori({
    this.currentKategori,
    this.currentTipewajah,
    this.documentId,
  });

  @override
  _EditScreenKategoriState createState() => _EditScreenKategoriState();
}

class _EditScreenKategoriState extends State<EditScreenKategori> {
  final FocusNode _kategoriFocusNode = FocusNode();

  final FocusNode _tipewajahFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _kategoriFocusNode.unfocus();
        _tipewajahFocusNode.unfocus();
      },
      child: Scaffold(
        // backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
          elevation: 0,
          // backgroundColor: CustomColors.firebaseNavy,
          // title: AppBarTitle(),
          actions: [
            _isDeleting
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.redAccent,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                      size: 32,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });

                      await DatabaseKategori.deleteItem(
                        docId: widget.documentId,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).pop();
                    },
                  ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: EditItemForm(
              documentId: widget.documentId,
              kategoriFocusNode: _kategoriFocusNode,
              tipewajahFocusNode: _tipewajahFocusNode,
              currentKategori: widget.currentKategori,
              currentTipewajah: widget.currentTipewajah,
            ),
          ),
        ),
      ),
    );
  }
}
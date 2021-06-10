import 'package:flutter/material.dart';
import 'package:flutter_skincare/database/dbKategori.dart';
import 'editItemProduk.dart';

class EditScreenProduk extends StatefulWidget {
  final String currentKode;
  final String currentNama;
  final String currentBrand;
  final int currentHarga;
  final String currentKategori;
  final String documentId;

  EditScreenProduk({
    this.currentKode,
    this.currentNama,
    this.currentBrand,
    this.currentHarga,
    this.currentKategori,
    this.documentId,
  });

  @override
  _EditScreenProdukState createState() => _EditScreenProdukState();
}

class _EditScreenProdukState extends State<EditScreenProduk> {
  final FocusNode _kodeFocusNode = FocusNode();
  final FocusNode _namaFocusNode = FocusNode();
  final FocusNode _brandFocusNode = FocusNode();
  final FocusNode _hargaFocusNode = FocusNode();
  final FocusNode _kategoriFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _kodeFocusNode.unfocus();
        _namaFocusNode.unfocus();
        _brandFocusNode.unfocus();
        _hargaFocusNode.unfocus();
        _kategoriFocusNode.unfocus();
      },
      child: Scaffold(
        // backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.pink[100],
          title: Text('Edit Form Produk'),
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
              kodeFocusNode: _kodeFocusNode,
              namaFocusNode: _namaFocusNode,
              brandFocusNode: _brandFocusNode,
              hargaFocusNode: _hargaFocusNode,
              kategoriFocusNode: _kategoriFocusNode,
              currentKode: widget.currentKode,
              currentNama: widget.currentNama,
              currentBrand: widget.currentBrand,
              currentHarga: widget.currentHarga,
              currentKategori: widget.currentKategori,
            ),
          ),
        ),
      ),
    );
  }
}
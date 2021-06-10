import 'package:flutter/material.dart';
import 'addProduk.dart';


class AddScreenProduk extends StatelessWidget {
  final FocusNode _kdFocusNode = FocusNode();
  final FocusNode _nmFocusNode = FocusNode();
  final FocusNode _brndFocusNode = FocusNode();
  final FocusNode _hrgFocusNode = FocusNode();
  final FocusNode _ktgFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _kdFocusNode.unfocus();
        _nmFocusNode.unfocus();
        _brndFocusNode.unfocus();
        _hrgFocusNode.unfocus();
        _ktgFocusNode.unfocus();
      },
      child: Scaffold(
        // backgroundColor: CustomColors.firebaseNavy,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: CustomColors.firebaseNavy,
        //   title: AppBarTitle(),
        // ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddProduk(
              kodeFocusNode: _kdFocusNode,
              namaFocusNode: _nmFocusNode,
              brandFocusNode: _brndFocusNode,
              hargaFocusNode: _hrgFocusNode,
              kategoriFocusNode: _ktgFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
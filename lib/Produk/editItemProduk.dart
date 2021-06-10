import 'package:flutter/material.dart';
import 'package:flutter_skincare/database/dbKategori.dart';
import 'package:flutter_skincare/database/dbProduk.dart';
import 'customFormFieldProduk.dart';

class EditItemForm extends StatefulWidget {
  final FocusNode kodeFocusNode;
  final FocusNode namaFocusNode;
  final FocusNode brandFocusNode;
  final FocusNode hargaFocusNode;
  final FocusNode kategoriFocusNode;
  final String currentKode;
  final String currentNama;
  final String currentBrand;
  final String currentHarga;
  final String currentKategori;
  final String documentId;

  const EditItemForm({
    this.kodeFocusNode,
    this.namaFocusNode,
    this.brandFocusNode,
    this.hargaFocusNode,
    this.kategoriFocusNode,
    this.currentKode,
    this.currentNama,
    this.currentBrand,
    this.currentHarga,
    this.currentKategori,
    this.documentId,
  });

  @override
  _EditItemFormState createState() => _EditItemFormState();
}

class _EditItemFormState extends State<EditItemForm> {
  final _editItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  TextEditingController _kodeController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _brandController = TextEditingController();
  TextEditingController _hargaController = TextEditingController();
  TextEditingController _kategoriController = TextEditingController();

  @override
  void initState() {
    _kodeController = TextEditingController(
      text: widget.currentKode,
    );
    _namaController = TextEditingController(
      text: widget.currentNama,
    );
    _brandController = TextEditingController(
      text: widget.currentBrand,
    );
    _hargaController= TextEditingController(
      text: widget.currentHarga,
    );
    _kategoriController = TextEditingController(
      text: widget.currentKategori,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _editItemFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.0),
                Text(
                  'Kode',
                  style: TextStyle(
                    // color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _kodeController,
                  focusNode: widget.kategoriFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  // validator: (value) => Validator.validateField(
                  //   value: value,
                  // ),
                  label: 'Kode',
                  hint: 'Enter Kode',
                ),
                SizedBox(height: 24.0),
                Text(
                  'Nama Produk',
                  style: TextStyle(
                    // color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _namaController,
                  focusNode: widget.namaFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  // validator: (value) => Validator.validateField(
                  //   value: value,
                  // ),
                  label: 'Nama Produk',
                  hint: 'Enter Nama Produk',
                ),
                SizedBox(height: 24.0),
                Text(
                  'Brand',
                  style: TextStyle(
                    // color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _brandController,
                  focusNode: widget.brandFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  // validator: (value) => Validator.validateField(
                  //   value: value,
                  // ),
                  label: 'Brand',
                  hint: 'Enter Brand',
                ),
                SizedBox(height: 24.0),
                Text(
                  'Harga',
                  style: TextStyle(
                    // color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _hargaController,
                  focusNode: widget.hargaFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  // validator: (value) => Validator.validateField(
                  //   value: value,
                  // ),
                  label: 'Harga',
                  hint: 'Enter Harga',
                ),
                SizedBox(height: 24.0),
                Text(
                  'Kategori',
                  style: TextStyle(
                    // color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _kategoriController,
                  focusNode: widget.kategoriFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  // validator: (value) => Validator.validateField(
                  //   value: value,
                  // ),
                  label: 'Kategori',
                  hint: 'Enter Kategori',
                ),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    // valueColor: AlwaysStoppedAnimation<Color>(
                    //   CustomColors.firebaseOrange,
                    // ),
                  ),
                )
              : Container(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      // backgroundColor: MaterialStateProperty.all(
                      //   CustomColors.firebaseOrange,
                      // ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      widget.kodeFocusNode.unfocus();
                      widget.namaFocusNode.unfocus();
                      widget.brandFocusNode.unfocus();
                      widget.hargaFocusNode.unfocus();
                      widget.kategoriFocusNode.unfocus();

                      if (_editItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await DatabaseProduk.updateItem(
                          docId: widget.documentId,
                          kode: _kodeController.text,
                          nama: _namaController.text,
                          brand: _brandController.text,
                          harga: _hargaController.text,
                          kategori: _kategoriController.text,
                        );

                        setState(() {
                          _isProcessing = false;
                        });

                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Text(
                        'UPDATE PRODUK',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          // color: CustomColors.firebaseGrey,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
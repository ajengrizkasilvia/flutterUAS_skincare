import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skincare/database/dbKategori.dart';
import 'package:flutter_skincare/database/dbProduk.dart';
import 'customFormFieldProduk.dart';

//EDIT FORM PRODUK
class EditItemForm extends StatefulWidget {
  final FocusNode kodeFocusNode;
  final FocusNode namaFocusNode;
  final FocusNode brandFocusNode;
  final FocusNode hargaFocusNode;
  final FocusNode kategoriFocusNode;
  final String currentKode;
  final String currentNama;
  final String currentBrand;
  final int currentHarga;
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
  var selectedCurrency;

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
      text: widget.currentHarga.toString(),
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
                SizedBox(height: 16.0),
                Text(
                  'Kode',
                  style: TextStyle(
                    // color: CustomColors.firebaseGrey,
                    fontSize: 16.0,
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
                SizedBox(height: 16.0),
                Text(
                  'Nama Produk',
                  style: TextStyle(
                    // color: CustomColors.firebaseGrey,
                    fontSize: 16.0,
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
                SizedBox(height: 16.0),
                Text(
                  'Brand',
                  style: TextStyle(
                    // color: CustomColors.firebaseGrey,
                    fontSize: 16.0,
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
                SizedBox(height: 16.0),
                Text(
                  'Harga',
                  style: TextStyle(
                    // color: CustomColors.firebaseGrey,
                    fontSize: 16.0,
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
                // 
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: DatabaseKategori.readItems(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          const Text("Loading.....");
                        else {
                          List<DropdownMenuItem> currencyItems = [];
                          for (int i = 0; i < snapshot.data.docs.length; i++) {
                            var snap = snapshot.data.docs[i].data();
                            String nama = snap['kategori'];
                            currencyItems.add(
                              DropdownMenuItem(
                                child: Text(
                                  nama,
                                  style: TextStyle(color: Colors.blue),
                                ),
                                value: "${nama}",
                              ),
                            );
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(width: 50.0),
                              DropdownButton(
                                items: currencyItems,
                                onChanged: (currencyValue) {
                                  final snackBar = SnackBar(
                                    content: Text(
                                      'Selected Currency value is $currencyValue',
                                      style:
                                          TextStyle(color: Colors.blue),
                                    ),
                                  );
                                  Scaffold.of(context).showSnackBar(snackBar);
                                  setState(() {
                                    selectedCurrency = currencyValue;
                                  });
                                },
                                value: selectedCurrency,
                                isExpanded: false,
                                hint: new Text(
                                  "Pilih Kategori *type",
                                  style: TextStyle(color: Colors.pink),
                                ),
                              ),
                            ],
                          );
                        }
                      }),
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
                          harga: int.parse(_hargaController.text),
                          kategori: selectedCurrency,
                        );

                        setState(() {
                          _isProcessing = false;
                        });

                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 12.0, bottom: 14.0),
                      child: Text(
                        'UPDATE PRODUK',
                        style: TextStyle(
                          fontSize: 20,
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
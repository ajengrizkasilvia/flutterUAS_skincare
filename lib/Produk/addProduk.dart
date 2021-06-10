import 'package:flutter/material.dart';
import 'package:flutter_skincare/database/dbProduk.dart';
import 'customFormFieldProduk.dart';

//FORM ADD PRODUK
class AddProduk extends StatefulWidget {
  final FocusNode kodeFocusNode;
  final FocusNode namaFocusNode;
  final FocusNode brandFocusNode;
  final FocusNode hargaFocusNode;
  final FocusNode kategoriFocusNode;

  const AddProduk({
    this.kodeFocusNode,
    this.namaFocusNode,
    this.brandFocusNode,
    this.hargaFocusNode,
    this.kategoriFocusNode,
  });

  @override
  _AddKategoriState createState() => _AddKategoriState();
}

class _AddKategoriState extends State<AddProduk> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _kategoriController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
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
                // Kode Barang
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: _kodeController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Kode Produk',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),
                // nama
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: _namaController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Nama Produk',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),
                // brand
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: _brandController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Brand Produk',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),
                // harga
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: _hargaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Harga Produk',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),
                // kategori
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: _kategoriController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Kategori Produk',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (value) {
                      //
                    },
                  ),
                ),
                // SizedBox(height: 18.0),
                // Text(
                //   'Kode',
                //   style: TextStyle(
                //     fontSize: 18.0,
                //     letterSpacing: 1,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(height: 8.0),
                // CustomFormField(
                //   isLabelEnabled: false,
                //   controller: _kodeController,
                //   focusNode: widget.kodeFocusNode,
                //   keyboardType: TextInputType.text,
                //   inputAction: TextInputAction.next,
                //   label: 'Kode',
                //   hint: 'Enter Kode',
                // ),
                // SizedBox(height: 18.0),
                // Text(
                //   'Nama Produk',
                //   style: TextStyle(
                //     fontSize: 18.0,
                //     letterSpacing: 1,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(height: 8.0),
                // CustomFormField(
                //   isLabelEnabled: false,
                //   controller: _namaController,
                //   focusNode: widget.namaFocusNode,
                //   keyboardType: TextInputType.text,
                //   inputAction: TextInputAction.next,
                //   label: 'Nama',
                //   hint: 'Enter Nama Produk',
                // ),
                // SizedBox(height: 18.0),
                // Text(
                //   'Brand',
                //   style: TextStyle(
                //     fontSize: 18.0,
                //     letterSpacing: 1,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(height: 8.0),
                // CustomFormField(
                //   isLabelEnabled: false,
                //   controller: _brandController,
                //   focusNode: widget.brandFocusNode,
                //   keyboardType: TextInputType.text,
                //   inputAction: TextInputAction.next,
                //   label: 'Brand',
                //   hint: 'Enter Brand Produk',
                // ),
                // SizedBox(height: 18.0),
                // Text(
                //   'Harga',
                //   style: TextStyle(
                //     fontSize: 18.0,
                //     letterSpacing: 1,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(height: 8.0),
                // CustomFormField(
                //   isLabelEnabled: false,
                //   controller: _hargaController,
                //   focusNode: widget.hargaFocusNode,
                //   keyboardType: TextInputType.text,
                //   inputAction: TextInputAction.next,
                //   label: 'Harga',
                //   hint: 'Enter Harga',
                // ),
                // SizedBox(height: 18.0),
                // Text(
                //   'Kategori',
                //   style: TextStyle(
                //     fontSize: 18.0,
                //     letterSpacing: 1,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(height: 8.0),
                // CustomFormField(
                //   isLabelEnabled: false,
                //   controller: _kategoriController,
                //   focusNode: widget.kategoriFocusNode,
                //   keyboardType: TextInputType.text,
                //   inputAction: TextInputAction.next,
                //   label: 'Kategori',
                //   hint: 'Enter Kategori',
                // ),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                )
              : Container(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ButtonStyle(
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

                      if (_addItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await DatabaseProduk.addItem(
                          kode: _kodeController.text,
                          nama: _namaController.text,
                          brand: _brandController.text,
                          harga: int.parse(_hargaController.text),
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
                        'Add Produk',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
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
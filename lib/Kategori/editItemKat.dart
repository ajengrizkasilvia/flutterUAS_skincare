import 'package:flutter/material.dart';
import 'package:flutter_skincare/database/dbKategori.dart';
import 'customFormFieldKat.dart';


//FORM EDIT KATEGORI
class EditItemForm extends StatefulWidget {
  final FocusNode kategoriFocusNode;
  final FocusNode tipewajahFocusNode;
  final String currentKategori;
  final String currentTipewajah;
  final String documentId;

  const EditItemForm({
    this.kategoriFocusNode,
    this.tipewajahFocusNode,
    this.currentKategori,
    this.currentTipewajah,
    this.documentId,
  });

  @override
  _EditItemFormState createState() => _EditItemFormState();
}

class _EditItemFormState extends State<EditItemForm> {
  final _editItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  TextEditingController _kategoriController = TextEditingController();
  TextEditingController _tipewajahController  = TextEditingController();

  @override
  void initState() {
    _kategoriController = TextEditingController(
      text: widget.currentKategori,
    );

    _tipewajahController = TextEditingController(
      text: widget.currentTipewajah.toString(),
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
                  inputAction: TextInputAction.next,
                  // validator: (value) => Validator.validateField(
                  //   value: value,
                  // ),
                  label: 'Kategori',
                  hint: 'Enter Kategori',
                ),
                SizedBox(height: 24.0),
                Text(
                  'Tipe Wajah',
                  style: TextStyle(
                    // color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  maxLines: 10,
                  isLabelEnabled: false,
                  controller: _tipewajahController,
                  focusNode: widget.tipewajahFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  // validator: (value) => Validator.validateField(
                  //   value: value,
                  // ),
                  label: 'Tipe Wajah',
                  hint: 'Enter Tipe Wajah',
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
                      widget.kategoriFocusNode.unfocus();
                      widget.tipewajahFocusNode.unfocus();

                      if (_editItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await DatabaseKategori.updateItem(
                          docId: widget.documentId,
                          kategori: _kategoriController.text,
                          tipewajah: _tipewajahController.text,
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
                        'UPDATE ITEM',
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
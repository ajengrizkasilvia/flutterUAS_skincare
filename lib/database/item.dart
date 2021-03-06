import 'package:flutter/material.dart';

class ItemProduk extends StatelessWidget {
  final String nama;
  final String brand;
  final double harga;
  final String kode;
  final String kategori;
  //// Pointer to Update Function
  final Function onUpdate;
  //// Pointer to Delete Function
  final Function onDelete;

  ItemProduk(this.nama, this.brand, this.harga, this.kode, this.kategori, { this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue.shade900)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(nama,
                        style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                        ),
              ),
              Text(
                brand,
                style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
              ),
              Text(
                "$harga",
                style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
              ),
              Text(
                kode,
                style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
              ),
              Text(
                kategori,
                style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 60,
                child: RaisedButton(
                    shape: CircleBorder(),
                    color: Colors.green[900],
                    child: Center(
                        child: Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      // if (onUpdate != null) onUpdate!();
                      onUpdate();
                    }),
              ),
              SizedBox(
                height: 40,
                width: 60,
                child: RaisedButton(
                    shape: CircleBorder(),
                    color: Colors.red[900],
                    child: Center(
                        child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      // if (onDelete != null) onDelete!();
                      onDelete();
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
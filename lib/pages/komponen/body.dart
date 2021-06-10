import 'package:flutter/material.dart';
import 'package:flutter_skincare/pages/komponen/featurredSkincare.dart';
import 'package:flutter_skincare/pages/komponen/sunscreen.dart';

import 'header.dart';
import 'lipBalm.dart';
import 'rekomenSkincare.dart';
import 'pembersihWajah.dart';
import 'pelembabWajah.dart';
import 'title.dart';
import 'toner.dart';
import 'sunscreen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling 
    return SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Header(size: size),
          TittleWithCustomeUnderlined(title: "Rekomended Product by Solcare"),
          RecommendedSkincares(),
          TittleWithCustomeUnderlined(title: "Featured Skincare by Solcare"),
          FeaturedSolcare(),
          // TittleWithCustomeUnderlined(title: "Sabun Muka & Pembersih Wajah"),
          // PembersihWajah(),
          // TittleWithCustomeUnderlined(title: "Toner"),
          // Toner(),
          // TittleWithCustomeUnderlined(title: "Pelembab Wajah"),
          // PelembabWajah(),
          // TittleWithCustomeUnderlined(title: "Lip Balm"),
          // LipBalm(),
          // TittleWithCustomeUnderlined(title: "Tabir Surya"),
          // SunScreen(),
        ],
      ),
    );
  }
}





import 'package:flutter/material.dart';

import '../../constants.dart';



class FeaturedSolcare extends StatelessWidget {
  const FeaturedSolcare({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FeatureCard(
            image: "assets/images/paketofc.jpg",
          ),
          FeatureCard(
            image: "assets/images/paketderma.jpg",
          ),
          FeatureCard(
            image: "assets/images/paketacne.jpg",
          ),
          FeatureCard(
            image: "assets/images/paketpencerah.jpg",
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    Key key,
    this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 1,
          bottom: kDefaultPadding / 1,
        ),
        width: size.width * 0.8,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}

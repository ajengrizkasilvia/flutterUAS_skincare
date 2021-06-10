import 'package:flutter/material.dart';

import '../../constants.dart';

class PelembabWajah extends StatelessWidget {
  const PelembabWajah({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PelembabCard(
            image: "assets/images/moisAzarine.jpg",
            title: "C White & Night",
            brand: "azarine",
          ),
          PelembabCard(
            image: "assets/images/moisWardah.jpg",
            title: "Perfect Bright",
            brand: "wardah",
          ),
          PelembabCard(
          image: "assets/images/moisCetapil.jpg",
          title: "Cream Face",
          brand: "cetaphil",
          ),
          PelembabCard(
          image: "assets/images/moisEmina.jpg",
          title: "Bright Stuff",
          brand: "emina",
          ),
        ],
      ),
    );
  }
}

class PelembabCard extends StatelessWidget {
  const PelembabCard({
    Key key, this.image, this.title, this.brand, this.price, 
  }) : super(key: key);

  final String image, title, brand;
  final int price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding, 
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      //it will cover 40% of our total width
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          Container(
            padding: EdgeInsets.all(kDefaultPadding / 2),
            decoration: BoxDecoration(
            color: Colors.pink[50],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.23),
                ),
             ],
            ), 
            child: Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "$title\n", 
                        style: Theme.of(context).textTheme.button,
                      ),
                      TextSpan(
                        text: "$brand".toUpperCase(),
                        style: TextStyle(
                          color: Colors.pink,
                        ), 
                      ),
                    ],
                  ),
                ),
              ],
            ),  
          ),
        ],
      ),
    );
  }
}
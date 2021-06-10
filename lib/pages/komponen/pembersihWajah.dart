import 'package:flutter/material.dart';

import '../../constants.dart';

class PembersihWajah extends StatelessWidget {
  const PembersihWajah({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PembersihCard(
            image: "assets/images/pwGarnier.jpg",
            title: "Micellar Water",
            brand: "garnier",
          ),
          PembersihCard(
            image: "assets/images/pwCosrx.jpeg",
            title: "Gel Cleanser",
            brand: "cosrx",
          ),
          PembersihCard(
          image: "assets/images/fwEmina.jpg",
          title: "Bright Stuff",
          brand: "emina",
          ),
          PembersihCard(
          image: "assets/images/fwSimple.jpg",
          title: "Refreshing FW",
          brand: "simple",
          ),
        ],
      ),
    );
  }
}

class PembersihCard extends StatelessWidget {
  const PembersihCard({
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
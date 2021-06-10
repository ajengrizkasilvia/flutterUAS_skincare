import 'package:flutter/material.dart';

import '../../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      //mencover 20% dari total height
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          bottom: 20 + kDefaultPadding,
        ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
          children: <Widget>[
            Text(
              'Hi, Sahabat Solcare!',
              style: Theme.of(context).textTheme.headline5.copyWith(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Image.asset("assets/images/solcare.jpg")
          ],
        ),
          ),
        ],
      ),
    );
  }
}

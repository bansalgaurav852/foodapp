import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:foodapp/Widgets/constwidget.dart';
import 'package:foodapp/assets/assets.dart';
import 'package:foodapp/constant/const.dart';
import 'package:foodapp/models/itemsmodel.dart';

class Cart extends StatefulWidget {
  int index;
  Cart({Key? key, required this.index}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  late int index;
  @override
  void initState() {
    index = widget.index;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttonui(SvgPicture.asset(Assets.backbutton)),
                Text(
                  "Cart",
                  style: textW700Stylepoppins(black, 18),
                ),
                buttonui(SvgPicture.asset(Assets.hmore))
              ],
            ),
          ),
          Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                        height: 80, child: Image.asset(burger[index].url)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text("data"),
                ),
                Expanded(
                  child: (SvgPicture.asset(Assets.cancal)),
                  flex: 1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

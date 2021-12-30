// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapp/Screens/cart.dart';
import 'package:foodapp/Widgets/constwidget.dart';
import 'package:foodapp/assets/assets.dart';
import 'package:foodapp/constant/color.dart';
import 'package:foodapp/constant/demin.dart';
import 'package:foodapp/constant/testStyle.dart';
import 'package:foodapp/models/itemsmodel.dart';

class AddToCart extends StatefulWidget {
  int index;
  AddToCart({Key? key, required this.index}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int select = 1;
  int quantity = 1;
  double price = 20.95;
  double total = 20.95;

  void cal(i) {
    return setState(() {
      select = i;
      quantity = 1;
      total = quantity * price;
    });
  }

  late int tag;

  @override
  void initState() {
    tag = widget.index;
    cal(1);
    total = price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () => Navigator.pop(context),
                              child: buttonui(
                                  SvgPicture.asset(Assets.backbutton))),
                          buttonui(SvgPicture.asset(Assets.afav)),
                        ],
                      ),
                      Text(
                        burger[tag].name,
                        textScaleFactor: 1.1,
                        style: textW500Stylepoppins(black, 18),
                      ),
                      Text(
                        "A signature flame-grilled chicken  patty topped with smoked beef",
                        maxLines: 2,
                        style: textW400Stylepoppins(grey, 14),
                      ),
                      Hero(
                          tag: "bigburger$tag",
                          child: Image.asset(burger[tag].url)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {
                                cal(0);
                              },
                              child: sml("S", 0)),
                          InkWell(
                              onTap: () {
                                cal(2);
                              },
                              child: sml("L", 2)),
                        ],
                      ),
                      InkWell(
                          onTap: () {
                            cal(1);
                          },
                          child: sml("M", 1)),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity = quantity - 1;
                            total = price * quantity;
                          });
                        } else {}
                      },
                      child: circlebutton("-")),
                  Text(
                    "$quantity",
                    style: textW700Stylepoppins(black, 20),
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {});
                        quantity = quantity + 1;
                        total = price * quantity;
                      },
                      child: circlebutton("+"))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Price\n",
                          style: textW400Stylepoppins(grey, 14),
                          children: [
                        TextSpan(
                            text: "\$${(total).toStringAsFixed(2)}",
                            style: textW600Stylepoppins(black, 24))
                      ])),
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Cart(
                        index: tag,
                      );
                    })),
                    child: Container(
                      decoration: BoxDecoration(
                          color: red,
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10))),
                      padding: const EdgeInsets.all(5),
                      height: 50,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Assets.bucket,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Go To Cart",
                            style: textW700Stylepoppins(white, 16),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget sml(text, index) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(4),
        height: getHeight(context) * .08,
        width: getHeight(context) * .08,
        decoration: BoxDecoration(
            color: select == index ? red : white,
            boxShadow: [boxShadow],
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Text(
          text,
          textScaleFactor: 1.0,
          style: TextStyle(
            color: select == index ? white : black,
          ),
        ));
  }

  Widget circlebutton(text) {
    return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: lightpink, shape: BoxShape.circle),
        child: Text(
          text,
          style: textW500Stylepoppins(black, 16),
        ));
  }
}

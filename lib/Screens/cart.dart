// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapp/Widgets/constwidget.dart';
import 'package:foodapp/assets/assets.dart';
import 'package:foodapp/constant/color.dart';
import 'package:foodapp/constant/demin.dart';
import 'package:foodapp/constant/testStyle.dart';
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = getHeight(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () => Navigator.pop(context),
                      child: buttonui(SvgPicture.asset(Assets.backbutton))),
                  Text(
                    "Cart",
                    style: textW700Stylepoppins(black, h * .05),
                  ),
                  buttonui(SvgPicture.asset(Assets.hmore))
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        burger.length,
                        (index) => Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Image.asset(burger[index].url)),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          burger[index].name,
                                          style: textW600Stylepoppins(
                                              black, h * .025),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Card(
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(top: 2),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "-",
                                                  style: textW600Stylepoppins(
                                                      red, h * .03),
                                                ),
                                                Text(
                                                  "2",
                                                  style: textW600Stylepoppins(
                                                      black, h * .025),
                                                ),
                                                Text(
                                                  "+",
                                                  style: textW500Stylepoppins(
                                                      red, h * .03),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      (SvgPicture.asset(Assets.cancal)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "\$${burger[index].price}",
                                        maxLines: 1,
                                        style: textW500Stylepoppins(
                                            black, h * .025),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: getHeight(context) * .08,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Apply Coupons  ",
                      style: textW500Stylepoppins(white, h * .025),
                    ),
                    Icon(
                      Icons.arrow_right_alt,
                      color: white,
                      size: h * .05,
                    )
                  ],
                ),
              ),
              Divider(),
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      paytext(context, "Item Total", "62.85"),
                      paytext(context, "Delivery Charge", "2.25"),
                      paytext(context, "Tax", "0.25"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total :",
                              style: textW600Stylepoppins(black, h * .03)),
                          Text("\$65.35",
                              style: textW600Stylepoppins(black, h * .03)),
                        ],
                      ),
                    ],
                  )),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: getHeight(context) * .08,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: red,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Proceed to payment method  ",
                      style: textW500Stylepoppins(white, h * .025),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paytext(BuildContext context, text, value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: textW400Stylepoppins(grey, getHeight(context) * .025),
        ),
        Text(
          "\$${value}",
          style: textW500Stylepoppins(black, getHeight(context) * .025),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapp/assets/assets.dart';
import 'package:foodapp/constant/const.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int select = 1;
  int quantity = 1;
  double price = 21.95;
  double total = 21.95;

  void cal(i) {
    return setState(() {
      select = i;
      quantity = 1;
      total = quantity * price;
    });
  }

  @override
  void initState() {
    cal(1);
    total = price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2.0,
                    color: Colors.black26,
                    spreadRadius: 1.0,
                  )
                ],
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(250))),
            height: MediaQuery.of(context).size.height * .62,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () => Navigator.pop(context),
                          child: buttonui(SvgPicture.asset(Assets.backbutton))),
                      buttonui(SvgPicture.asset(Assets.afav)),
                    ],
                  ),
                  Text(
                    "Chipotle Cheesy Chicken",
                    textScaleFactor: 1.1,
                    style: textW500Stylepoppins(black, 18),
                  ),
                  Text(
                    "A signature flame-grilled chicken \n patty topped with smoked beef",
                    style: textW400Stylepoppins(grey, 14),
                  ),
                  Hero(tag: "bigburger", child: Image.asset(Assets.bigburger)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: () {
                            cal(0);
                          },
                          child: sml("S", select == 0 ? red : white,
                              select == 0 ? white : black)),
                      InkWell(
                          onTap: () {
                            cal(2);
                          },
                          child: sml("L", select == 2 ? red : white,
                              select == 2 ? white : black)),
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        cal(1);
                      },
                      child: sml("M", select == 1 ? red : white,
                          select == 1 ? white : black)),
                  const SizedBox(
                    height: 20,
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
                          text: TextSpan(text: "Price\n", children: [
                        TextSpan(
                            text: "\$${total}",
                            style: textW600Stylepoppins(black, 24))
                      ])),
                      Container(
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
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget buttonui(icon) {
    return Container(
        padding: const EdgeInsets.all(8),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: white,
            boxShadow: [button],
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: icon);
  }

  Widget sml(text, color1, color2) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(4),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: color1,
            boxShadow: [button],
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Text(
          text,
          style: textW500Stylepoppins(color2, 22),
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

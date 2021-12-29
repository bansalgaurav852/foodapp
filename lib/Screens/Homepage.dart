import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapp/Screens/Addtocart.dart';
import 'package:foodapp/assets/assets.dart';
import 'package:foodapp/constant/const.dart';
import 'package:foodapp/models/itemsmodel.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selecteditem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            //appbar
            child: appbar()),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hey!", style: textW700Stylepoppins(black, 36)),
              Text("Let's get your order!",
                  style: textW500Stylepoppins(grey, 18)),
              const SizedBox(height: 10),

              //Searchbar
              searchbar(),
              const SizedBox(height: 20),

              //Item  category
              itemcategory(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: textW600Stylepoppins(black, 18),
                  ),
                  Text(
                    "View all>",
                    style: textW500Stylepoppins(red, 14),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: List.generate(burger.length, (index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddToCart(
                          index: index,
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: white,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black38,
                                      offset: Offset(1.0, 1.0),
                                      blurRadius: 4.0,
                                      spreadRadius: 1.0),
                                ],
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: red,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    height: 150,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        burger[index].name,
                                        style: textW600Stylepoppins(black, 16),
                                      ),
                                      Text(
                                        "${burger[index].price}",
                                        style: textW600Stylepoppins(black, 16),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Chicken Burger",
                                    style: textW400Stylepoppins(grey, 14),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                        Align(
                          child: Hero(
                              tag: "bigburger$index",
                              child: Image.asset(burger[index].url)),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemcategory() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(3, (index) {
          String? name = items[index].name;
          String? item = items[index].item;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selecteditem = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0,
                          spreadRadius: 1.0),
                    ],
                    color: selecteditem == items[index].index ? red : white,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                height: 200,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 60, width: 50, child: Image.asset(item)),
                    Stack(
                      children: <Widget>[
                        // Stroked text as border.

                        // Solid text as fill.
                        Text(name,
                            style: TextStyle(
                                fontSize: 22,
                                color: selecteditem == items[index].index
                                    ? white
                                    : black)),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: SvgPicture.asset(selecteditem == items[index].index
                          ? Assets.rightarrowwhite
                          : Assets.rightarrowblack),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget searchbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              boxShadow,
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(-2.0, -2.0),
                blurRadius: 2.0,
                spreadRadius: 1.0,
              ),
            ],
            color: white,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            const SizedBox(width: 10),
            SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(Assets.search, fit: BoxFit.contain)),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search our delicious burgers",
                  hintStyle: textW500Stylepoppins(grey, 14),
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appbar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 24, child: SvgPicture.asset(Assets.menu)),
        Row(
          children: [
            SizedBox(height: 24, child: SvgPicture.asset(Assets.location)),
            RichText(
                text: TextSpan(
                    text: "Chicago,",
                    style: textW700Stylepoppins(black, 18),
                    children: <TextSpan>[
                  TextSpan(text: "IL", style: textW700Stylepoppins(grey, 18))
                ])),
          ],
        ),
        SizedBox(
            height: 40,
            width: 40,
            child: Image.asset(
              Assets.profile1,
              fit: BoxFit.fill,
            ))
      ],
    );
  }
}

import 'package:foodapp/assets/assets.dart';

class Item {
  String name;
  String item;
  int index;

  Item(this.item, this.name, this.index);
}

List<Item> items = [
  Item(Assets.burger, "Burger", 0),
  Item(Assets.pizza, "Pizza", 1),
  Item(Assets.cake, "Cakes", 2),
];

class Burgers {
  String name;
  String url;
  double price;
  Burgers(this.name, this.url, this.price);
}

List<Burgers> burger = [
  Burgers("Chipotle Cheesy Chicken", Assets.burger2, 20.95),
  Burgers("Beef Burger ", Assets.bigburger, 20.75)
];

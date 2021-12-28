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

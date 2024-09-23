class Item {
  String imgPath;
  double price;
  String location;
  String name;
  Item({
    this.location = 'nouckchot',
    required this.imgPath,
    required this.price,
    required this.name,
  });
}

final List<Item> items = [
  Item(
      name: "Prudact 1",
      imgPath: 'assets/images/1.webp',
      price: 12.99,
      location: 'Marset BMD'),
  Item(name: "Prudact 2", imgPath: 'assets/images/2.webp', price: 12.99),
  Item(name: "Prudact 3", imgPath: 'assets/images/3.webp', price: 12.99),
  Item(name: "Prudact 4", imgPath: 'assets/images/4.webp', price: 12.99),
  Item(name: "Prudact 5", imgPath: 'assets/images/5.webp', price: 12.99),
  Item(name: "Prudact 6", imgPath: 'assets/images/6.webp', price: 12.99),
  Item(name: "Prudact 7", imgPath: 'assets/images/7.webp', price: 12.99),
  Item(name: "Prudact 8", imgPath: 'assets/images/8.webp', price: 12.99),
];

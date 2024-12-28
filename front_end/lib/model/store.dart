class Store {
  String name;
  String number;
  String address;
  List<String> category;

  Store(this.name, this.number, this.address, this.category);

  Store.fromList(Map<String, dynamic> map)
      : name = map['name'],
        number = map['number'],
        address = map['address'],
        category = map['category'];
}

class Store {
  String name;
  String number;
  String address;

  Store(this.name, this.number, this.address);

  Store.fromList(Map<String, dynamic> map)
      : name = map['name'],
        number = map['number'],
        address = map['address'];
}

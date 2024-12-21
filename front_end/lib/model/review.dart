class Review {
  int userId;
  int storeId;
  int star;
  String text;
  DateTime date;

  Review(this.userId, this.storeId, this.star, this.text, this.date);

  Review.fromList(Map<String, dynamic> map)
      : userId = map['userId'],
        storeId = map['storeId'],
        star = map['star'],
        text = map['text'],
        date = map['date'];
}

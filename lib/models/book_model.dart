class BookModel {
  String? bookName;
  String? authorName;
  double? price;
  String? bookImage;
  double? percentSecurity;
  int? quantity;
  String? category;

  BookModel({
    this.bookName,
    this.authorName,
    this.price,
    this.bookImage,
    this.percentSecurity,
    this.quantity,
    this.category,
  });

  BookModel.fromJson(Map<String, dynamic> json) {
    bookName = json['bookName'];
    authorName = json['authorName'];
    price = json['price'].toDouble();
    bookImage = json['bookImage'];
    percentSecurity = json['percentSecurity'].toDouble();
    quantity = json['quantity'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookName'] = this.bookName;
    data['authorName'] = this.authorName;
    data['price'] = this.price;
    data['bookImage'] = this.bookImage;
    data['percentSecurity'] = this.percentSecurity;
    data['quantity'] = this.quantity;
    data['category'] = this.category;
    return data;
  }
}

class BookModel {
  String? bookDocId;
  String? bookName;
  String? authorName;
  double? price;
  String? bookImage;
  double? percentSecurity;
  int? quantity;
  String? category;
  String? libraryID;
  DateTime? createdAt;

  BookModel({
    this.bookDocId,
    this.bookName,
    this.authorName,
    this.price,
    this.bookImage,
    this.percentSecurity,
    this.quantity,
    this.category,
    this.libraryID,
    this.createdAt,
  });

  BookModel.fromJson(Map<String, dynamic> json) {
    bookDocId = json['bookDocId'];
    bookName = json['bookName'];
    authorName = json['authorName'];
    price = json['price'].toDouble();
    bookImage = json['bookImage'];
    percentSecurity = json['percentSecurity'].toDouble();
    quantity = json['quantity'];
    category = json['category'];
    libraryID = json['libraryID'];
    createdAt = json['timestamp'];
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
    data['libraryID'] = this.libraryID;
    data['timestamp'] = this.createdAt;
    return data;
  }
}

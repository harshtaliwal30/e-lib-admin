class BookModel {
  String? bookDocId;
  String? bookName;
  String? authorName;
  double? price;
  String? bookImage;
  double? percentSecurity;
  int? quantity;
  String? category;
  String? libraryId;
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
    this.libraryId,
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
    libraryId = json['libraryID'];
    createdAt = json['createdAt'].toDate();
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
    data['libraryID'] = this.libraryId;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class IssueRequestModel {
  String? authorName;
  String? bookName;
  String? libraryId;
  String? status;
  String? userId;
  DateTime? createdAt;
  DateTime? confirmedAt;
  DateTime? returnedAt;

  IssueRequestModel({
    this.authorName,
    this.bookName,
    this.libraryId,
    this.status,
    this.userId,
    this.createdAt,
    this.confirmedAt,
    this.returnedAt,
  });

  IssueRequestModel.fromJson(Map<String, dynamic> json) {
    authorName = json['authorName'];
    bookName = json['bookName'];
    libraryId = json['libraryId'];
    status = json['status'];
    userId = json['userId'];
    createdAt = json['createdAt'].toDate();
    confirmedAt = json['confirmedAt'].toDate();
    returnedAt = json['returnedAt'].toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorName'] = this.authorName;
    data['bookName'] = this.bookName;
    data['libraryId'] = this.libraryId;
    data['status'] = this.status;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['confirmedAt'] = this.confirmedAt;
    data['returnedAt'] = this.returnedAt;
    return data;
  }
}

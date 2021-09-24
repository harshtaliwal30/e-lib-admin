class IssueRequestModel {
  String? docId;
  String? authorName;
  String? bookName;
  String? libraryId;
  String? status;
  String? userId;
  DateTime? createdAt;
  DateTime? approvedAt;
  DateTime? issuedAt;
  DateTime? returnedAt;

  IssueRequestModel({
    this.docId,
    this.authorName,
    this.bookName,
    this.libraryId,
    this.status,
    this.userId,
    this.createdAt,
    this.approvedAt,
    this.issuedAt,
    this.returnedAt,
  });

  IssueRequestModel.fromJson(Map<String, dynamic> json) {
    docId = json['docId'];
    authorName = json['authorName'];
    bookName = json['bookName'];
    libraryId = json['libraryId'];
    status = json['status'];
    userId = json['userId'];
    createdAt = json['createdAt'].toDate();
    approvedAt = json['approvedAt'].toDate();
    issuedAt = json['issuedAt'].toDate();
    returnedAt = json['returnedAt'].toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['docId'] = this.docId;
    data['authorName'] = this.authorName;
    data['bookName'] = this.bookName;
    data['libraryId'] = this.libraryId;
    data['status'] = this.status;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['approvedAt'] = this.approvedAt;
    data['issuedAt'] = this.issuedAt;
    data['returnedAt'] = this.returnedAt;
    return data;
  }
}

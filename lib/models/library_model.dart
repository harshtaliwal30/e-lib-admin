class LibraryModel {
  String? libraryId;
  String? libraryName;
  String? libraryEmail;
  String? libraryPhone;
  String? libraryImage;
  String? address;
  String? country;
  String? state;
  String? city;
  String? type;

  LibraryModel({
    this.libraryId,
    this.libraryName,
    this.libraryEmail,
    this.libraryPhone,
    this.libraryImage,
    this.address,
    this.country,
    this.state,
    this.city,
    this.type,
  });

  LibraryModel.fromJson(Map<String, dynamic> json) {
    libraryId = json['libraryId'];
    libraryName = json['libraryName'];
    libraryEmail = json['libraryEmail'];
    libraryPhone = json['libraryPhone'];
    libraryImage = json['libraryImage'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['libraryName'] = this.libraryName;
    data['libraryEmail'] = this.libraryEmail;
    data['libraryPhone'] = this.libraryPhone;
    data['libraryImage'] = this.libraryImage;
    data['address'] = this.address;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['type'] = this.type;
    return data;
  }
}

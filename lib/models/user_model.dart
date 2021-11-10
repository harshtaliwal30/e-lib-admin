class UserModel {
  String? userId;
  String? userName;
  String? userImage;
  String? userPhone;
  String? userEmail;
  String? address;
  String? country;
  String? state;
  String? city;

  UserModel({
    this.userId,
    this.userName,
    this.userImage,
    this.userPhone,
    this.userEmail,
    this.address,
    this.country,
    this.state,
    this.city,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userImage = json['userImage'];
    userPhone = json['userPhone'];
    userEmail = json['userEmail'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['userImage'] = this.userImage;
    data['userPhone'] = this.userPhone;
    data['userEmail'] = this.userEmail;
    data['address'] = this.address;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    return data;
  }
}

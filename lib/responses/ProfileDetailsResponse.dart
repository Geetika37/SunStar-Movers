class ProfileDetailsResponse {
  String? profileImage;
  String? firstName;
  String? middleName;
  String? lastName;
  String? phone;
  String? emailAddress;
  int? mediaID;
  String? qrCode;

  ProfileDetailsResponse(
      {this.profileImage,
        this.firstName,
        this.middleName,
        this.lastName,
        this.phone,
        this.emailAddress,
        this.mediaID,
        this.qrCode});

  ProfileDetailsResponse.fromJson(Map<String, dynamic> json) {
    profileImage = json['profileImage'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    phone = json['phone'];
    emailAddress = json['emailAddress'];
    mediaID = json['mediaID'];
    qrCode = json['qrCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profileImage'] = this.profileImage;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['emailAddress'] = this.emailAddress;
    data['mediaID'] = this.mediaID;
    data['qrCode'] = this.qrCode;
    return data;
  }
}

class AllMarketingDetailResponse {
  int? marketingID;
  int? marketingNo;
  int? activityID;
  String? activityDetails;
  int? customerID;
  int? branchID;
  int? staffEntityID;
  String? name;
  String? customerName;
  String? customerPhone;
  String? emailAddress;
  String? designation;
  String? address;
  String? marketingTypeName;
  String? companyName;
  String? date;
  String? time;
  String? customerPhone2;
  String? phoneCountryID;
  String? phone2CountryID;
  String? place;
  int? emirateID;
  String? emirates;
  int? userID;
  String? nationality;
  // List<Null>? feedback;

  AllMarketingDetailResponse(
      {this.marketingID,
        this.marketingNo,
        this.activityID,
        this.activityDetails,
        this.customerID,
        this.branchID,
        this.staffEntityID,
        this.name,
        this.customerName,
        this.customerPhone,
        this.emailAddress,
        this.designation,
        this.address,
        this.marketingTypeName,
        this.companyName,
        this.date,
        this.time,
        this.customerPhone2,
        this.phoneCountryID,
        this.phone2CountryID,
        this.place,
        this.emirateID,
        this.emirates,
        this.userID,
        this.nationality,
        // this.feedback
      });

  AllMarketingDetailResponse.fromJson(Map<String, dynamic> json) {
    marketingID = json['marketingID'];
    marketingNo = json['marketingNo'];
    activityID = json['activityID'];
    activityDetails = json['activityDetails'];
    customerID = json['customerID'];
    branchID = json['branchID'];
    staffEntityID = json['staffEntityID'];
    name = json['name'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    emailAddress = json['emailAddress'];
    designation = json['designation'];
    address = json['address'];
    marketingTypeName = json['marketingTypeName'];
    companyName = json['companyName'];
    date = json['date'];
    time = json['time'];
    customerPhone2 = json['customerPhone2'];
    phoneCountryID = json['phoneCountryID'];
    phone2CountryID = json['phone2CountryID'];
    place = json['place'];
    emirateID = json['emirateID'];
    emirates = json['emirates'];
    userID = json['userID'];
    nationality = json['nationality'];
    // if (json['feedback'] != null) {
    //   feedback = <Null>[];
    //   json['feedback'].forEach((v) {
    //     feedback!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['marketingID'] = this.marketingID;
    data['marketingNo'] = this.marketingNo;
    data['activityID'] = this.activityID;
    data['activityDetails'] = this.activityDetails;
    data['customerID'] = this.customerID;
    data['branchID'] = this.branchID;
    data['staffEntityID'] = this.staffEntityID;
    data['name'] = this.name;
    data['customerName'] = this.customerName;
    data['customerPhone'] = this.customerPhone;
    data['emailAddress'] = this.emailAddress;
    data['designation'] = this.designation;
    data['address'] = this.address;
    data['marketingTypeName'] = this.marketingTypeName;
    data['companyName'] = this.companyName;
    data['date'] = this.date;
    data['time'] = this.time;
    data['customerPhone2'] = this.customerPhone2;
    data['phoneCountryID'] = this.phoneCountryID;
    data['phone2CountryID'] = this.phone2CountryID;
    data['place'] = this.place;
    data['emirateID'] = this.emirateID;
    data['emirates'] = this.emirates;
    data['userID'] = this.userID;
    data['nationality'] = this.nationality;
    // if (this.feedback != null) {
    //   data['feedback'] = this.feedback!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

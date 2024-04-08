class AllComplaintResponse {
  int? surveyID;
  int? surveyNo;
  String? date;
  String? requirement;
  String? placeFrom;
  String? placeTo;
  String? emiratesFrom;
  String? emiratesTo;
  num? quotedPrice;
  String? closedDate;
  String? customerName;
  String? customerPhone;
  String? companyName;
  String? emailAddress;
  String? buildingTypeName;
  String? movingTypeName;
  String? staffName;
  num? agreedAmount;
  num? boxToBeCollected;
  String? collectedDateTime;
  num? boxCollected;
  String? customerPhone2;
  String? designation;
  String? phoneCountryID;
  String? phone2CountryID;
  num? finalAmount;
  int? complaintID;
  String? complaintDetails;
  int? complaintStatus;
  String? complaintDate;
  String? complaintCloseDate;
  String? complaintCloseDetails;
  num? totalQuotedPrice;
  String? volume;
  String? time;
  int? orderStatus;
  String? workDuration;
  dynamic addedBy;
  String? userName;
  String? finalVolume;
  String? leadQuality;
  String? leadSourceName;
  bool? isSurveyNo;
  String? movingDate;
  String? movingTime;
  String? pricingInstruction;
  String? workStartDate;
  String? teamLeaderName;
  int? taxCategoryID;
  int? paymentStatus;
  String? percentage;
  num? totalAmount;
  num? discountAmount;
  num? discount;
  num? totalFinalAmount;
  num? vat;
  String? nationality;
  String? comment;

  AllComplaintResponse(
      {this.surveyID,
        this.surveyNo,
        this.date,
        this.requirement,
        this.placeFrom,
        this.placeTo,
        this.emiratesFrom,
        this.emiratesTo,
        this.quotedPrice,
        this.closedDate,
        this.customerName,
        this.customerPhone,
        this.companyName,
        this.emailAddress,
        this.buildingTypeName,
        this.movingTypeName,
        this.staffName,
        this.agreedAmount,
        this.boxToBeCollected,
        this.collectedDateTime,
        this.boxCollected,
        this.customerPhone2,
        this.designation,
        this.phoneCountryID,
        this.phone2CountryID,
        this.finalAmount,
        this.complaintID,
        this.complaintDetails,
        this.complaintStatus,
        this.complaintDate,
        this.complaintCloseDate,
        this.complaintCloseDetails,
        this.totalQuotedPrice,
        this.volume,
        this.time,
        this.orderStatus,
        this.workDuration,
        this.addedBy,
        this.userName,
        this.finalVolume,
        this.leadQuality,
        this.leadSourceName,
        this.isSurveyNo,
        this.movingDate,
        this.movingTime,
        this.pricingInstruction,
        this.workStartDate,
        this.teamLeaderName,
        this.taxCategoryID,
        this.paymentStatus,
        this.percentage,
        this.totalAmount,
        this.discountAmount,
        this.discount,
        this.totalFinalAmount,
        this.vat,
        this.nationality,
        this.comment});

  AllComplaintResponse.fromJson(Map<String, dynamic> json) {
    surveyID = json['surveyID'];
    surveyNo = json['surveyNo'];
    date = json['date'];
    requirement = json['requirement'];
    placeFrom = json['placeFrom'];
    placeTo = json['placeTo'];
    emiratesFrom = json['emiratesFrom'];
    emiratesTo = json['emiratesTo'];
    quotedPrice = json['quotedPrice'];
    closedDate = json['closedDate'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    companyName = json['companyName'];
    emailAddress = json['emailAddress'];
    buildingTypeName = json['buildingTypeName'];
    movingTypeName = json['movingTypeName'];
    staffName = json['staffName'];
    agreedAmount = json['agreedAmount'];
    boxToBeCollected = json['boxToBeCollected'];
    collectedDateTime = json['collectedDateTime'];
    boxCollected = json['boxCollected'];
    customerPhone2 = json['customerPhone2'];
    designation = json['designation'];
    phoneCountryID = json['phoneCountryID'];
    phone2CountryID = json['phone2CountryID'];
    finalAmount = json['finalAmount'];
    complaintID = json['complaintID'];
    complaintDetails = json['complaintDetails'];
    complaintStatus = json['complaintStatus'];
    complaintDate = json['complaintDate'];
    complaintCloseDate = json['complaintCloseDate'];
    complaintCloseDetails = json['complaintCloseDetails'];
    totalQuotedPrice = json['totalQuotedPrice'];
    volume = json['volume'];
    time = json['time'];
    orderStatus = json['orderStatus'];
    workDuration = json['workDuration'];
    addedBy = json['addedBy'];
    userName = json['userName'];
    finalVolume = json['finalVolume'];
    leadQuality = json['leadQuality'];
    leadSourceName = json['leadSourceName'];
    isSurveyNo = json['isSurveyNo'];
    movingDate = json['movingDate'];
    movingTime = json['movingTime'];
    pricingInstruction = json['pricingInstruction'];
    workStartDate = json['workStartDate'];
    teamLeaderName = json['teamLeaderName'];
    taxCategoryID = json['taxCategoryID'];
    paymentStatus = json['paymentStatus'];
    percentage = json['percentage'];
    totalAmount = json['totalAmount'];
    discountAmount = json['discountAmount'];
    discount = json['discount'];
    totalFinalAmount = json['totalFinalAmount'];
    vat = json['vat'];
    nationality = json['nationality'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['surveyID'] = this.surveyID;
    data['surveyNo'] = this.surveyNo;
    data['date'] = this.date;
    data['requirement'] = this.requirement;
    data['placeFrom'] = this.placeFrom;
    data['placeTo'] = this.placeTo;
    data['emiratesFrom'] = this.emiratesFrom;
    data['emiratesTo'] = this.emiratesTo;
    data['quotedPrice'] = this.quotedPrice;
    data['closedDate'] = this.closedDate;
    data['customerName'] = this.customerName;
    data['customerPhone'] = this.customerPhone;
    data['companyName'] = this.companyName;
    data['emailAddress'] = this.emailAddress;
    data['buildingTypeName'] = this.buildingTypeName;
    data['movingTypeName'] = this.movingTypeName;
    data['staffName'] = this.staffName;
    data['agreedAmount'] = this.agreedAmount;
    data['boxToBeCollected'] = this.boxToBeCollected;
    data['collectedDateTime'] = this.collectedDateTime;
    data['boxCollected'] = this.boxCollected;
    data['customerPhone2'] = this.customerPhone2;
    data['designation'] = this.designation;
    data['phoneCountryID'] = this.phoneCountryID;
    data['phone2CountryID'] = this.phone2CountryID;
    data['finalAmount'] = this.finalAmount;
    data['complaintID'] = this.complaintID;
    data['complaintDetails'] = this.complaintDetails;
    data['complaintStatus'] = this.complaintStatus;
    data['complaintDate'] = this.complaintDate;
    data['complaintCloseDate'] = this.complaintCloseDate;
    data['complaintCloseDetails'] = this.complaintCloseDetails;
    data['totalQuotedPrice'] = this.totalQuotedPrice;
    data['volume'] = this.volume;
    data['time'] = this.time;
    data['orderStatus'] = this.orderStatus;
    data['workDuration'] = this.workDuration;
    data['addedBy'] = this.addedBy;
    data['userName'] = this.userName;
    data['finalVolume'] = this.finalVolume;
    data['leadQuality'] = this.leadQuality;
    data['leadSourceName'] = this.leadSourceName;
    data['isSurveyNo'] = this.isSurveyNo;
    data['movingDate'] = this.movingDate;
    data['movingTime'] = this.movingTime;
    data['pricingInstruction'] = this.pricingInstruction;
    data['workStartDate'] = this.workStartDate;
    data['teamLeaderName'] = this.teamLeaderName;
    data['taxCategoryID'] = this.taxCategoryID;
    data['paymentStatus'] = this.paymentStatus;
    data['percentage'] = this.percentage;
    data['totalAmount'] = this.totalAmount;
    data['discountAmount'] = this.discountAmount;
    data['discount'] = this.discount;
    data['totalFinalAmount'] = this.totalFinalAmount;
    data['vat'] = this.vat;
    data['nationality'] = this.nationality;
    data['comment'] = this.comment;
    return data;
  }
}

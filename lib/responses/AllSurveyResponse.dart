class AllSurveyResponse {
  int? surveyID;
  int? surveyNo;
  int? customerID;
  int? staffEntityID;
  String? date;
  String? time;
  String? requirement;
  String? folioRefNo;
  String? placeFrom;
  String? placeTo;
  int? emirateIDFrom;
  int? emirateIDTo;
  num? quotedPrice;
  int? orderStatus;
  String? movingDate;
  String? movingTime;
  String? closedDate;
  String? closedTime; // null
  String? customerName;
  String? customerPhone;
  String? companyName;
  String? leadSourceName;
  String? remark; // null
  int? remarkID; // null
  String? emailAddress;
  String? volume;
  int? buildingTypeID;
  String? buildingTypeName;
  int? movingTypeID;
  String? movingTypeName;
  int? branchID;
  String? name;
  num? agreedAmount;
  String? pricingInstruction; // null
  int? teamLeaderID;
  String? finalVolume;
  num? boxToBeCollected;
  String? collectedDateTime; // null
  num? boxCollected;
  String? teamLeaderName;
  String? workStartDate;
  String? workStartTime;
  String? placeFromEmirates;
  String? placeToEmirates;
  String? customerPhone2;
  String? workDuration;
  String? address; //null
  String? designation; // null
  String? phoneCountryID;
  String? phone2CountryID;
  String? isdCode; //null
  String? isdCode2; //null
  bool? isSameContact; //null
  int? userID;
  int? confirmWorkDuration;
  String? allConfirmDates;
  String? confirmStartTime; //null
  int? taxCategoryID;
  num? discountAmount;
  num? finalAmount;
  int? paymentStatus;
  String? canceledReason; //null
  String? leadQuality;
  int? leadSourceID;
  int? surveyThrough;
  String? percentage; //null
  num? totalQuotedPrice; //null
  num? totalAmount; //null
  num? discount; //null
  num? totalFinalAmount; //null
  String? vat; //null
  int? receiptJournalMasterID; //null
  int? journalNo;
  int? journalNoPrefix; //null
  String? nationality; //null
  List<Comments>? comments;
  // List<Null>? collectionHistory;
  List<ConfirmDate>? confirmDate;

  AllSurveyResponse(
      {this.surveyID,
      this.surveyNo,
      this.customerID,
      this.staffEntityID,
      this.date,
      this.time,
      this.requirement,
      this.folioRefNo,
      this.placeFrom,
      this.placeTo,
      this.emirateIDFrom,
      this.emirateIDTo,
      this.quotedPrice,
      this.orderStatus,
      this.movingDate,
      this.movingTime,
      this.closedDate,
      this.closedTime,
      this.customerName,
      this.customerPhone,
      this.companyName,
      this.leadSourceName,
      this.remark,
      this.remarkID,
      this.emailAddress,
      this.volume,
      this.buildingTypeID,
      this.buildingTypeName,
      this.movingTypeID,
      this.movingTypeName,
      this.branchID,
      this.name,
      this.agreedAmount,
      this.pricingInstruction,
      this.teamLeaderID,
      this.finalVolume,
      this.boxToBeCollected,
      this.collectedDateTime,
      this.boxCollected,
      this.teamLeaderName,
      this.workStartDate,
      this.workStartTime,
      this.placeFromEmirates,
      this.placeToEmirates,
      this.customerPhone2,
      this.workDuration,
      this.address,
      this.designation,
      this.phoneCountryID,
      this.phone2CountryID,
      this.isdCode,
      this.isdCode2,
      this.isSameContact,
      this.userID,
      this.confirmWorkDuration,
      this.allConfirmDates,
      this.confirmStartTime,
      this.taxCategoryID,
      this.discountAmount,
      this.finalAmount,
      this.paymentStatus,
      this.canceledReason,
      this.leadQuality,
      this.leadSourceID,
      this.surveyThrough,
      this.percentage,
      this.totalQuotedPrice,
      this.totalAmount,
      this.discount,
      this.totalFinalAmount,
      this.vat,
      this.receiptJournalMasterID,
      this.journalNo,
      this.journalNoPrefix,
      this.nationality,
      // this.comments,
      // this.collectionHistory,
      this.confirmDate});

  AllSurveyResponse.fromJson(Map<String, dynamic> json) {
    surveyID = json['surveyID'];
    surveyNo = json['surveyNo'];
    customerID = json['customerID'];
    staffEntityID = json['staffEntityID'];
    date = json['date'];
    time = json['time'];
    requirement = json['requirement'];
    folioRefNo = json['folioRefNo'];
    placeFrom = json['placeFrom'];
    placeTo = json['placeTo'];
    emirateIDFrom = json['emirateIDFrom'];
    emirateIDTo = json['emirateIDTo'];
    quotedPrice = json['quotedPrice'];
    orderStatus = json['orderStatus'];
    movingDate = json['movingDate'];
    movingTime = json['movingTime'];
    closedDate = json['closedDate'];
    closedTime = json['closedTime'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    companyName = json['companyName'];
    leadSourceName = json['leadSourceName'];
    remark = json['remark'];
    remarkID = json['remarkID'];
    emailAddress = json['emailAddress'];
    volume = json['volume'];
    buildingTypeID = json['buildingTypeID'];
    buildingTypeName = json['buildingTypeName'];
    movingTypeID = json['movingTypeID'];
    movingTypeName = json['movingTypeName'];
    branchID = json['branchID'];
    name = json['name'];
    agreedAmount = json['agreedAmount'];
    pricingInstruction = json['pricingInstruction'];
    teamLeaderID = json['teamLeaderID'];
    finalVolume = json['finalVolume'];
    boxToBeCollected = json['boxToBeCollected'];
    collectedDateTime = json['collectedDateTime'];
    boxCollected = json['boxCollected'];
    teamLeaderName = json['teamLeaderName'];
    workStartDate = json['workStartDate'];
    workStartTime = json['workStartTime'];
    placeFromEmirates = json['placeFromEmirates'];
    placeToEmirates = json['placeToEmirates'];
    customerPhone2 = json['customerPhone2'];
    workDuration = json['workDuration'];
    address = json['address'];
    designation = json['designation'];
    phoneCountryID = json['phoneCountryID'];
    phone2CountryID = json['phone2CountryID'];
    isdCode = json['isdCode'];
    isdCode2 = json['isdCode2'];
    isSameContact = json['isSameContact'];
    userID = json['userID'];
    confirmWorkDuration = json['confirmWorkDuration'];
    allConfirmDates = json['allConfirmDates'];
    confirmStartTime = json['confirmStartTime'];
    taxCategoryID = json['taxCategoryID'];
    discountAmount = json['discountAmount'];
    finalAmount = json['finalAmount'];
    paymentStatus = json['paymentStatus'];
    canceledReason = json['canceledReason'];
    leadQuality = json['leadQuality'];
    leadSourceID = json['leadSourceID'];
    surveyThrough = json['surveyThrough'];
    percentage = json['percentage'];
    totalQuotedPrice = json['totalQuotedPrice'];
    totalAmount = json['totalAmount'];
    discount = json['discount'];
    totalFinalAmount = json['totalFinalAmount'];
    vat = json['vat'];
    receiptJournalMasterID = json['receiptJournalMasterID'];
    journalNo = json['journalNo'];
    journalNoPrefix = json['journalNoPrefix'];
    nationality = json['nationality'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    // if (json['collectionHistory'] != null) {
    //   collectionHistory = <Null>[];
    //   json['collectionHistory'].forEach((v) {
    //     collectionHistory!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['confirmDate'] != null) {
      confirmDate = <ConfirmDate>[];
      json['confirmDate'].forEach((v) {
        confirmDate!.add(new ConfirmDate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['surveyID'] = this.surveyID;
    data['surveyNo'] = this.surveyNo;
    data['customerID'] = this.customerID;
    data['staffEntityID'] = this.staffEntityID;
    data['date'] = this.date;
    data['time'] = this.time;
    data['requirement'] = this.requirement;
    data['folioRefNo'] = this.folioRefNo;
    data['placeFrom'] = this.placeFrom;
    data['placeTo'] = this.placeTo;
    data['emirateIDFrom'] = this.emirateIDFrom;
    data['emirateIDTo'] = this.emirateIDTo;
    data['quotedPrice'] = this.quotedPrice;
    data['orderStatus'] = this.orderStatus;
    data['movingDate'] = this.movingDate;
    data['movingTime'] = this.movingTime;
    data['closedDate'] = this.closedDate;
    data['closedTime'] = this.closedTime;
    data['customerName'] = this.customerName;
    data['customerPhone'] = this.customerPhone;
    data['companyName'] = this.companyName;
    data['leadSourceName'] = this.leadSourceName;
    data['remark'] = this.remark;
    data['remarkID'] = this.remarkID;
    data['emailAddress'] = this.emailAddress;
    data['volume'] = this.volume;
    data['buildingTypeID'] = this.buildingTypeID;
    data['buildingTypeName'] = this.buildingTypeName;
    data['movingTypeID'] = this.movingTypeID;
    data['movingTypeName'] = this.movingTypeName;
    data['branchID'] = this.branchID;
    data['name'] = this.name;
    data['agreedAmount'] = this.agreedAmount;
    data['pricingInstruction'] = this.pricingInstruction;
    data['teamLeaderID'] = this.teamLeaderID;
    data['finalVolume'] = this.finalVolume;
    data['boxToBeCollected'] = this.boxToBeCollected;
    data['collectedDateTime'] = this.collectedDateTime;
    data['boxCollected'] = this.boxCollected;
    data['teamLeaderName'] = this.teamLeaderName;
    data['workStartDate'] = this.workStartDate;
    data['workStartTime'] = this.workStartTime;
    data['placeFromEmirates'] = this.placeFromEmirates;
    data['placeToEmirates'] = this.placeToEmirates;
    data['customerPhone2'] = this.customerPhone2;
    data['workDuration'] = this.workDuration;
    data['address'] = this.address;
    data['designation'] = this.designation;
    data['phoneCountryID'] = this.phoneCountryID;
    data['phone2CountryID'] = this.phone2CountryID;
    data['isdCode'] = this.isdCode;
    data['isdCode2'] = this.isdCode2;
    data['isSameContact'] = this.isSameContact;
    data['userID'] = this.userID;
    data['confirmWorkDuration'] = this.confirmWorkDuration;
    data['allConfirmDates'] = this.allConfirmDates;
    data['confirmStartTime'] = this.confirmStartTime;
    data['taxCategoryID'] = this.taxCategoryID;
    data['discountAmount'] = this.discountAmount;
    data['finalAmount'] = this.finalAmount;
    data['paymentStatus'] = this.paymentStatus;
    data['canceledReason'] = this.canceledReason;
    data['leadQuality'] = this.leadQuality;
    data['leadSourceID'] = this.leadSourceID;
    data['surveyThrough'] = this.surveyThrough;
    data['percentage'] = this.percentage;
    data['totalQuotedPrice'] = this.totalQuotedPrice;
    data['totalAmount'] = this.totalAmount;
    data['discount'] = this.discount;
    data['totalFinalAmount'] = this.totalFinalAmount;
    data['vat'] = this.vat;
    data['receiptJournalMasterID'] = this.receiptJournalMasterID;
    data['journalNo'] = this.journalNo;
    data['journalNoPrefix'] = this.journalNoPrefix;
    data['nationality'] = this.nationality;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    // if (this.collectionHistory != null) {
    //   data['collectionHistory'] =
    //       this.collectionHistory!.map((v) => v.toJson()).toList();
    // }
    if (this.confirmDate != null) {
      data['confirmDate'] = this.confirmDate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ConfirmDate {
  bool? isRowInEditMode;
  int? rowIndex;
  int? branchID;
  int? surveyBookingDateID;
  String? bookingDate;
  String? bookingTime;
  int? surveyID;

  ConfirmDate(
      {this.isRowInEditMode,
      this.rowIndex,
      this.branchID,
      this.surveyBookingDateID,
      this.bookingDate,
      this.bookingTime,
      this.surveyID});

  ConfirmDate.fromJson(Map<String, dynamic> json) {
    isRowInEditMode = json['isRowInEditMode'];
    rowIndex = json['rowIndex'];
    branchID = json['branchID'];
    surveyBookingDateID = json['surveyBookingDateID'];
    bookingDate = json['bookingDate'];
    bookingTime = json['bookingTime'];
    surveyID = json['surveyID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isRowInEditMode'] = this.isRowInEditMode;
    data['rowIndex'] = this.rowIndex;
    data['branchID'] = this.branchID;
    data['surveyBookingDateID'] = this.surveyBookingDateID;
    data['bookingDate'] = this.bookingDate;
    data['bookingTime'] = this.bookingTime;
    data['surveyID'] = this.surveyID;
    return data;
  }
}


class Comments {
  int? remarkID;
  String? remark;
  String? name;
  int? surveyID;

  Comments({this.remarkID, this.remark, this.name, this.surveyID});

  Comments.fromJson(Map<String, dynamic> json) {
    remarkID = json['remarkID'];
    remark = json['remark'];
    name = json['name'];
    surveyID = json['surveyID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['remarkID'] = this.remarkID;
    data['remark'] = this.remark;
    data['name'] = this.name;
    data['surveyID'] = this.surveyID;
    return data;
  }
}

class NavSurveyResponse {
  int? pageIndex;
  int? pageSize;
  int? totalCount;
  int? totalPages;
  bool? hasPreviousPage;
  bool? hasNextPage;
  List<Data>? data;

  NavSurveyResponse(
      {this.pageIndex,
        this.pageSize,
        this.totalCount,
        this.totalPages,
        this.hasPreviousPage,
        this.hasNextPage,
        this.data});

  NavSurveyResponse.fromJson(Map<String, dynamic> json) {
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    totalCount = json['totalCount'];
    totalPages = json['totalPages'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageIndex'] = this.pageIndex;
    data['pageSize'] = this.pageSize;
    data['totalCount'] = this.totalCount;
    data['totalPages'] = this.totalPages;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['hasNextPage'] = this.hasNextPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? surveyID;
  int? surveyNo;
  String? customerName;
  String? customerPhone;
  String? date;
  String? folioRefNo;
  int? orderStatus;
  String? teamLeaderName;
  num? boxToBeCollected;
  num? boxCollected;
  String? time;
  String? leadQuality;
  String? confirmWorkDuration;
  String? staffName;
  String? workStartDate;
  int? surveyThrough;
  String? placeFrom;
  String? placeTo;
  num? finalAmount;
  String? finalVolume;
  String? volume;
  int? quotedPrice;
  String? nationality;

  Data(
      {this.surveyID,
        this.surveyNo,
        this.customerName,
        this.customerPhone,
        this.date,
        this.folioRefNo,
        this.orderStatus,
        this.teamLeaderName,
        this.boxToBeCollected,
        this.boxCollected,
        this.time,
        this.leadQuality,
        this.confirmWorkDuration,
        this.staffName,
        this.workStartDate,
        this.surveyThrough,
        this.placeFrom,
        this.placeTo,
        this.finalAmount,
        this.finalVolume,
        this.volume,
        this.quotedPrice,
        this.nationality});

  Data.fromJson(Map<String, dynamic> json) {
    surveyID = json['surveyID'];
    surveyNo = json['surveyNo'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    date = json['date'];
    folioRefNo = json['folioRefNo'];
    orderStatus = json['orderStatus'];
    teamLeaderName = json['teamLeaderName'];
    boxToBeCollected = json['boxToBeCollected'];
    boxCollected = json['boxCollected'];
    time = json['time'];
    leadQuality = json['leadQuality'];
    confirmWorkDuration = json['confirmWorkDuration'];
    staffName = json['staffName'];
    workStartDate = json['workStartDate'];
    surveyThrough = json['surveyThrough'];
    placeFrom = json['placeFrom'];
    placeTo = json['placeTo'];
    finalAmount = json['finalAmount'];
    finalVolume = json['finalVolume'];
    volume = json['volume'];
    quotedPrice = json['quotedPrice'];
    nationality = json['nationality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['surveyID'] = this.surveyID;
    data['surveyNo'] = this.surveyNo;
    data['customerName'] = this.customerName;
    data['customerPhone'] = this.customerPhone;
    data['date'] = this.date;
    data['folioRefNo'] = this.folioRefNo;
    data['orderStatus'] = this.orderStatus;
    data['teamLeaderName'] = this.teamLeaderName;
    data['boxToBeCollected'] = this.boxToBeCollected;
    data['boxCollected'] = this.boxCollected;
    data['time'] = this.time;
    data['leadQuality'] = this.leadQuality;
    data['confirmWorkDuration'] = this.confirmWorkDuration;
    data['staffName'] = this.staffName;
    data['workStartDate'] = this.workStartDate;
    data['surveyThrough'] = this.surveyThrough;
    data['placeFrom'] = this.placeFrom;
    data['placeTo'] = this.placeTo;
    data['finalAmount'] = this.finalAmount;
    data['finalVolume'] = this.finalVolume;
    data['volume'] = this.volume;
    data['quotedPrice'] = this.quotedPrice;
    data['nationality'] = this.nationality;
    return data;
  }
}

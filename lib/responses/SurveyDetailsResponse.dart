class SurveyDetailsResponse {
  int? pageIndex;
  int? pageSize;
  int? totalCount;
  int? totalPages;
  bool? hasPreviousPage;
  bool? hasNextPage;
  List<Data>? data;

  SurveyDetailsResponse(
      {this.pageIndex,
        this.pageSize,
        this.totalCount,
        this.totalPages,
        this.hasPreviousPage,
        this.hasNextPage,
        this.data});

  SurveyDetailsResponse.fromJson(Map<String, dynamic> json) {
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
  String? surveyNo;
  int? customerID;
  int? staffEntityID;
  String? date;
  String? time;
  int? quotedPrice;
  int? orderStatus;
  String? leadQuality;
  String? customerName;
  String? staffName;
  int? paymentStatus;
  String? workStartDate;
  String? confirmStartTime;
  String? confirmWorkDuration;
  int? receiptJournalMasterID;
  String? placeFrom;
  String? placeTo;
  String? volume;
  String? nationality;
  String? orderStatusClass;

  Data(
      {this.surveyID,
        this.surveyNo,
        this.customerID,
        this.staffEntityID,
        this.date,
        this.time,
        this.quotedPrice,
        this.orderStatus,
        this.leadQuality,
        this.customerName,
        this.staffName,
        this.paymentStatus,
        this.workStartDate,
        this.confirmStartTime,
        this.confirmWorkDuration,
        this.receiptJournalMasterID,
        this.placeFrom,
        this.placeTo,
        this.volume,
        this.nationality,
        this.orderStatusClass});

  Data.fromJson(Map<String, dynamic> json) {
    surveyID = json['surveyID'];
    surveyNo = json['surveyNo'];
    customerID = json['customerID'];
    staffEntityID = json['staffEntityID'];
    date = json['date'];
    time = json['time'];
    quotedPrice = json['quotedPrice'];
    orderStatus = json['orderStatus'];
    leadQuality = json['leadQuality'];
    customerName = json['customerName'];
    staffName = json['staffName'];
    paymentStatus = json['paymentStatus'];
    workStartDate = json['workStartDate'];
    confirmStartTime = json['confirmStartTime'];
    confirmWorkDuration = json['confirmWorkDuration'];
    receiptJournalMasterID = json['receiptJournalMasterID'];
    placeFrom = json['placeFrom'];
    placeTo = json['placeTo'];
    volume = json['volume'];
    nationality = json['nationality'];
    orderStatusClass = json['orderStatusClass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['surveyID'] = this.surveyID;
    data['surveyNo'] = this.surveyNo;
    data['customerID'] = this.customerID;
    data['staffEntityID'] = this.staffEntityID;
    data['date'] = this.date;
    data['time'] = this.time;
    data['quotedPrice'] = this.quotedPrice;
    data['orderStatus'] = this.orderStatus;
    data['leadQuality'] = this.leadQuality;
    data['customerName'] = this.customerName;
    data['staffName'] = this.staffName;
    data['paymentStatus'] = this.paymentStatus;
    data['workStartDate'] = this.workStartDate;
    data['confirmStartTime'] = this.confirmStartTime;
    data['confirmWorkDuration'] = this.confirmWorkDuration;
    data['receiptJournalMasterID'] = this.receiptJournalMasterID;
    data['placeFrom'] = this.placeFrom;
    data['placeTo'] = this.placeTo;
    data['volume'] = this.volume;
    data['nationality'] = this.nationality;
    data['orderStatusClass'] = this.orderStatusClass;
    return data;
  }
}

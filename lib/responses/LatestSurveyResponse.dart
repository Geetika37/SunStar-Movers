class LatestSurveyResponse {
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

  LatestSurveyResponse(
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

  LatestSurveyResponse.fromJson(Map<String, dynamic> json) {
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

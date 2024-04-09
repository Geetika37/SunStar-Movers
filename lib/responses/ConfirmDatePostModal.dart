class ConfirmDatePostModal {
  bool? isRowInEditMode;
  int? rowIndex;
  int? branchID;
  int? surveyBookingDateID;
  String? bookingDate;
  String? bookingTime;
  int? surveyID;

  ConfirmDatePostModal(
      {this.isRowInEditMode,
        this.rowIndex,
        this.branchID,
        this.surveyBookingDateID,
        this.bookingDate,
        this.bookingTime,
        this.surveyID});

  ConfirmDatePostModal.fromJson(Map<String, dynamic> json) {
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

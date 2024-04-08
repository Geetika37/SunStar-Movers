class NavComplaintResponse {
  int? pageIndex;
  int? pageSize;
  int? totalCount;
  int? totalPages;
  bool? hasPreviousPage;
  bool? hasNextPage;
  List<Data>? data;

  NavComplaintResponse(
      {this.pageIndex,
        this.pageSize,
        this.totalCount,
        this.totalPages,
        this.hasPreviousPage,
        this.hasNextPage,
        this.data});

  NavComplaintResponse.fromJson(Map<String, dynamic> json) {
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
  String? surveyNo;
  int? complaintID;
  String? customerName;
  int? complaintStatus;
  String? complaintDate;
  int? addedBy;
  String? name;

  Data(
      {this.surveyNo,
        this.complaintID,
        this.customerName,
        this.complaintStatus,
        this.complaintDate,
        this.addedBy,
        this.name});

  Data.fromJson(Map<String, dynamic> json) {
    surveyNo = json['surveyNo'];
    complaintID = json['complaintID'];
    customerName = json['customerName'];
    complaintStatus = json['complaintStatus'];
    complaintDate = json['complaintDate'];
    addedBy = json['addedBy'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['surveyNo'] = this.surveyNo;
    data['complaintID'] = this.complaintID;
    data['customerName'] = this.customerName;
    data['complaintStatus'] = this.complaintStatus;
    data['complaintDate'] = this.complaintDate;
    data['addedBy'] = this.addedBy;
    data['name'] = this.name;
    return data;
  }
}

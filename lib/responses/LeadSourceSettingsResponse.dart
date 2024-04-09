class LeadSourceSettingsResponse {
  int? pageIndex;
  int? pageSize;
  int? totalCount;
  int? totalPages;
  bool? hasPreviousPage;
  bool? hasNextPage;
  List<Data>? data;

  LeadSourceSettingsResponse(
      {this.pageIndex,
        this.pageSize,
        this.totalCount,
        this.totalPages,
        this.hasPreviousPage,
        this.hasNextPage,
        this.data});

  LeadSourceSettingsResponse.fromJson(Map<String, dynamic> json) {
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
  int? leadSourceID;
  String? leadSourseName;
  int? branchID;
  bool? isDeleted;

  Data({this.leadSourceID, this.leadSourseName, this.branchID, this.isDeleted});

  Data.fromJson(Map<String, dynamic> json) {
    leadSourceID = json['leadSourceID'];
    leadSourseName = json['leadSourseName'];
    branchID = json['branchID'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leadSourceID'] = this.leadSourceID;
    data['leadSourseName'] = this.leadSourseName;
    data['branchID'] = this.branchID;
    data['isDeleted'] = this.isDeleted;
    return data;
  }
}

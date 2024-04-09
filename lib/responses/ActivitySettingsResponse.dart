class ActivitySettingsResponse {
  int? pageIndex;
  int? pageSize;
  int? totalCount;
  int? totalPages;
  bool? hasPreviousPage;
  bool? hasNextPage;
  List<Data>? data;

  ActivitySettingsResponse(
      {this.pageIndex,
        this.pageSize,
        this.totalCount,
        this.totalPages,
        this.hasPreviousPage,
        this.hasNextPage,
        this.data});

  ActivitySettingsResponse.fromJson(Map<String, dynamic> json) {
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
  int? marketingTypeID;
  String? marketingTypeName;
  int? branchID;

  Data({this.marketingTypeID, this.marketingTypeName, this.branchID});

  Data.fromJson(Map<String, dynamic> json) {
    marketingTypeID = json['marketingTypeID'];
    marketingTypeName = json['marketingTypeName'];
    branchID = json['branchID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['marketingTypeID'] = this.marketingTypeID;
    data['marketingTypeName'] = this.marketingTypeName;
    data['branchID'] = this.branchID;
    return data;
  }
}

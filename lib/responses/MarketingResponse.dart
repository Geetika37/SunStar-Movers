class MarketingDetailResponse {
  int? pageIndex;
  int? pageSize;
  int? totalCount;
  int? totalPages;
  bool? hasPreviousPage;
  bool? hasNextPage;
  List<Data>? data;

  MarketingDetailResponse(
      {this.pageIndex,
        this.pageSize,
        this.totalCount,
        this.totalPages,
        this.hasPreviousPage,
        this.hasNextPage,
        this.data});

  MarketingDetailResponse.fromJson(Map<String, dynamic> json) {
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
  int? marketingID;
  int? marketingNo;
  String? date;
  String? marketingTypeName;
  String? customerName;
  String? staffName;
  String? time;

  Data(
      {this.marketingID,
        this.marketingNo,
        this.date,
        this.marketingTypeName,
        this.customerName,
        this.staffName,
        this.time});

  Data.fromJson(Map<String, dynamic> json) {
    marketingID = json['marketingID'];
    marketingNo = json['marketingNo'];
    date = json['date'];
    marketingTypeName = json['marketingTypeName'];
    customerName = json['customerName'];
    staffName = json['staffName'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['marketingID'] = this.marketingID;
    data['marketingNo'] = this.marketingNo;
    data['date'] = this.date;
    data['marketingTypeName'] = this.marketingTypeName;
    data['customerName'] = this.customerName;
    data['staffName'] = this.staffName;
    data['time'] = this.time;
    return data;
  }
}

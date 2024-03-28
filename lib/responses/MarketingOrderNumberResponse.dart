class MarketingOrderNumberResponse {
  int? orderNo;

  MarketingOrderNumberResponse({this.orderNo});

  MarketingOrderNumberResponse.fromJson(Map<String, dynamic> json) {
    orderNo = json['orderNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderNo'] = this.orderNo;
    return data;
  }
}

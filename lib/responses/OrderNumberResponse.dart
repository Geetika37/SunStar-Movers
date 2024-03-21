class OrderNumberResponse {
  int? orderNo;

  OrderNumberResponse({this.orderNo});

  OrderNumberResponse.fromJson(Map<String, dynamic> json) {
    orderNo = json['orderNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderNo'] = this.orderNo;
    return data;
  }
}

class BuildingTypeResponse {
  int? id;
  String? value;

  BuildingTypeResponse({this.id, this.value});

  BuildingTypeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    return data;
  }
}

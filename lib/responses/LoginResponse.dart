class LoginResponse {
  String? accessToken;
  String? refreshToken;
  dynamic? clients;
  dynamic? branches;
  bool? emailConfirmed;

  LoginResponse(
      {this.accessToken,
        this.refreshToken,
        this.clients,
        this.branches,
        this.emailConfirmed});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    clients = json['clients'];
    branches = json['branches'];
    emailConfirmed = json['emailConfirmed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['clients'] = this.clients;
    data['branches'] = this.branches;
    data['emailConfirmed'] = this.emailConfirmed;
    return data;
  }
}

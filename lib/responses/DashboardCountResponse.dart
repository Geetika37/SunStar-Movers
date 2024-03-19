class DashboardCountResponse {
  SurveyCount? surveyCount;
  MarketingCount? marketingCount;

  DashboardCountResponse({this.surveyCount, this.marketingCount});

  DashboardCountResponse.fromJson(Map<String, dynamic> json) {
    surveyCount = json['surveyCount'] != null
        ? new SurveyCount.fromJson(json['surveyCount'])
        : null;
    marketingCount = json['marketingCount'] != null
        ? new MarketingCount.fromJson(json['marketingCount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.surveyCount != null) {
      data['surveyCount'] = this.surveyCount!.toJson();
    }
    if (this.marketingCount != null) {
      data['marketingCount'] = this.marketingCount!.toJson();
    }
    return data;
  }
}

class SurveyCount {
  int? currentYearSurvey;
  int? lastYearSurvey;

  SurveyCount({this.currentYearSurvey, this.lastYearSurvey});

  SurveyCount.fromJson(Map<String, dynamic> json) {
    currentYearSurvey = json['currentYearSurvey'];
    lastYearSurvey = json['lastYearSurvey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentYearSurvey'] = this.currentYearSurvey;
    data['lastYearSurvey'] = this.lastYearSurvey;
    return data;
  }
}

class MarketingCount {
  int? currentYearActivity;
  int? lastYearActivity;

  MarketingCount({this.currentYearActivity, this.lastYearActivity});

  MarketingCount.fromJson(Map<String, dynamic> json) {
    currentYearActivity = json['currentYearActivity'];
    lastYearActivity = json['lastYearActivity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentYearActivity'] = this.currentYearActivity;
    data['lastYearActivity'] = this.lastYearActivity;
    return data;
  }
}

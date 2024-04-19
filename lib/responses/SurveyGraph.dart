class SurveyGraph {
  String? day;
  int? pendingSurvey;
  int? canceledSurvey;
  int? confirmSurvey;
  int? startWorkSurvey;
  int? closedSurvey;

  SurveyGraph(
      {this.day,
        this.pendingSurvey,
        this.canceledSurvey,
        this.confirmSurvey,
        this.startWorkSurvey,
        this.closedSurvey});

  SurveyGraph.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    pendingSurvey = json['pendingSurvey'];
    canceledSurvey = json['canceledSurvey'];
    confirmSurvey = json['confirmSurvey'];
    startWorkSurvey = json['startWorkSurvey'];
    closedSurvey = json['closedSurvey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['pendingSurvey'] = this.pendingSurvey;
    data['canceledSurvey'] = this.canceledSurvey;
    data['confirmSurvey'] = this.confirmSurvey;
    data['startWorkSurvey'] = this.startWorkSurvey;
    data['closedSurvey'] = this.closedSurvey;
    return data;
  }
}

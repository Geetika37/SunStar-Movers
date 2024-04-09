class CalenderResponse {
  List<Calendar>? calendar;
  // List<Null>? events;

  CalenderResponse({this.calendar});
  // CalenderResponse({this.calendar, this.events});

  CalenderResponse.fromJson(Map<String, dynamic> json) {
    if (json['calendar'] != null) {
      calendar = <Calendar>[];
      json['calendar'].forEach((v) {
        calendar!.add(new Calendar.fromJson(v));
      });
    }
    // if (json['events'] != null) {
    //   events = <Null>[];
    //   json['events'].forEach((v) {
    //     events!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.calendar != null) {
      data['calendar'] = this.calendar!.map((v) => v.toJson()).toList();
    }
    // if (this.events != null) {
    //   data['events'] = this.events!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Calendar {
  int? surveyID;
  int? surveyNo;
  String? placeFrom;
  String? placeTo;
  String? userCode;
  int? duration;
  List<String>? dates;

  Calendar(
      {this.surveyID,
        this.surveyNo,
        this.placeFrom,
        this.placeTo,
        this.userCode,
        this.duration,
        this.dates});

  Calendar.fromJson(Map<String, dynamic> json) {
    surveyID = json['surveyID'];
    surveyNo = json['surveyNo'];
    placeFrom = json['placeFrom'];
    placeTo = json['placeTo'];
    userCode = json['userCode'];
    duration = json['duration'];
    dates = json['dates'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['surveyID'] = this.surveyID;
    data['surveyNo'] = this.surveyNo;
    data['placeFrom'] = this.placeFrom;
    data['placeTo'] = this.placeTo;
    data['userCode'] = this.userCode;
    data['duration'] = this.duration;
    data['dates'] = this.dates;
    return data;
  }
}

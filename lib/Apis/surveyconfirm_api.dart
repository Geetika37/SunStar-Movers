import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/responses/TeamLeaderResponse.dart';

class SurveyConfirmApi {
  AppController appCt = Get.find();

  // POST CONFIRM SURVEY

  Future<bool> SurveyConfirm(dynamic data) async {
    var isSuccess;
    try {
      var response = await Dio().post(
          'https://sunstar-project.progbiz.io/api/Orders/save-survey-confirmation',
          data: data,
          options: Options(
              headers: appCt.token == null
                  ? {
                      "Accept": "application/json",
                      "content-type": "application/json",
                      "Accept-Language": "En"
                    }
                  : {
                      "Accept": "application/json",
                      "content-type": "application/json",
                      "Authorization": "Bearer " + appCt.token!,
                      "Accept-Language": "En"
                    }));
      print(response.data);
      if (response.statusCode == 200) {
        isSuccess = true;
      }
    } on DioException catch (err) {
      print("-------------------");
      print(err.response?.data);
    }
    return isSuccess;
  }

  // POST STARTWORK

  Future<bool> StartWorkSurvey(dynamic data) async {
    var isSuccess;
    var response = await Dio()
        .post('https://sunstar-project.progbiz.io/api/Orders/save-start-work',
            data: data,
            options: Options(
                headers: appCt.token == null
                    ? {
                        "Accept": "application/json",
                        "content-type": "application/json",
                        "Accept-Language": "En"
                      }
                    : {
                        "Accept": "application/json",
                        "content-type": "application/json",
                        "Authorization": "Bearer " + appCt.token!,
                        "Accept-Language": "En"
                      }));
    print(response.data);
    if (response.statusCode == 200) {
      isSuccess = true;
    }
    return isSuccess;
  }

  // POST STARTWORK TEAM LEADER

  Future<List<TeamLeaderResponse>?> teamLeader() async {
    List<TeamLeaderResponse>? teamLeaderResponse;

    var data = {
      "id": 0,
      "searchString": "",
      "readDataOnSearch": false,
      "dropdownMode": 0
    };
    var response = await Dio().post(
        'https://sunstar-project.progbiz.io/api/Common/get-list-of-team-leaders',
        data: data,
        options: Options(
            headers: appCt.token == null
                ? {
                    "Accept": "application/json",
                    "content-type": "application/json",
                    "Accept-Language": "En"
                  }
                : {
                    "Accept": "application/json",
                    "content-type": "application/json",
                    "Authorization": "Bearer " + appCt.token!,
                    "Accept-Language": "En"
                  }));
    print(response.data);
    if (response.statusCode == 200) {
      teamLeaderResponse = (response.data as List)
          .map((e) => TeamLeaderResponse.fromJson(e))
          .toList();
    }
    return teamLeaderResponse;
  }

  // POST COMPLETE WORK

  Future<bool> CompleteWork(dynamic data) async {
    var isSuccess;

    try {
      var response = await Dio().post(
          'https://sunstar-project.progbiz.io/api/Orders/save-complete-work',
          data: data,
          options: Options(
              headers: appCt.token == null
                  ? {
                      "Accept": "application/json",
                      "content-type": "application/json",
                      "Accept-Language": "En"
                    }
                  : {
                      "Accept": "application/json",
                      "content-type": "application/json",
                      "Authorization": "Bearer " + appCt.token!,
                      "Accept-Language": "En"
                    }));
      print(response.data);
      if (response.statusCode == 200) {
        isSuccess = true;
      }
    } on DioException catch (err) {
      print(err.message);
    }

    return isSuccess;
  }

  // POST BOX COLLECT

  Future<bool> collectBox(dynamic data) async {
    var isSuccess;
    var resposne = await Dio().post(
        'https://sunstar-project.progbiz.io/api/Orders/save-survey-collect',
        data: data,
        options: Options(
            headers: appCt.token == null
                ? {
                    "Accept": "application/json",
                    "content-type": "application/json",
                    "Accept-Language": "En"
                  }
                : {
                    "Accept": "application/json",
                    "content-type": "application/json",
                    "Authorization": "Bearer " + appCt.token!,
                    "Accept-Language": "En"
                  }));
    print(resposne.data);
    if (resposne.statusCode == 200) {
      isSuccess = true;
    }
    return isSuccess;
  }
}

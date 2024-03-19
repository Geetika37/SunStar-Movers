import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/responses/DashboardCountResponse.dart';
import 'package:sunstarmovers/responses/LatestSurveyResponse.dart';

class DashboardApi
{
  AppController appCt=Get.find();


  // GET dashboard count

  Future<DashboardCountResponse ?> dashboardCountResponse() async
  {
    DashboardCountResponse? dashboardCountResponse;
    var response=await Dio().get('https://ssmovers.progbiz.io/api/Dashboard/get-dashboard-count',data: {},
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
            })
    );
    print(response.data);
    if(response.statusCode==200)
      {
        dashboardCountResponse=DashboardCountResponse.fromJson(response.data);
      }
    return dashboardCountResponse;
  }
  
  
  // GET latest survey details

  Future<List<LatestSurveyResponse> ?>  LastestSurvey() async
  {
    List<LatestSurveyResponse>? latestSurveyResponse;
    var response=await Dio().get('https://ssmovers.progbiz.io/api/Dashboard/get-latest-survey-list',data: {},
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
            })
    );
    print(response.data);
    if(response.statusCode==200)
      {
        latestSurveyResponse= (response.data as List).map((e) =>  LatestSurveyResponse.fromJson(e)).toList();

      }
    return latestSurveyResponse;
  }
}
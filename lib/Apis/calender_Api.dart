
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/responses/CalenderResponse.dart';

class CalenderApi
{
  AppController appCt = Get.find();

  // GET CALENDER RESPONSE

  Future<CalenderResponse ?> calender()async
  {
    CalenderResponse? calenderResponse;
    var response=await Dio().get('https://sunstar-project.progbiz.io/api/Orders/get-survey-confirmed-calenders',data: {},
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
        calenderResponse=CalenderResponse.fromJson(response.data);
      }
    return calenderResponse;
  }



}
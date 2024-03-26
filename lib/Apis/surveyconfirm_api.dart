import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/controller/appController.dart';

class SurveyConfirmApi
{
  AppController appCt = Get.find();
  Future<bool> SurveyConfirm(dynamic data) async
  {
    var isSuccess;
    try
    {
      var response=await Dio().post('https://ssmovers.progbiz.io/api/Orders/save-survey-confirmation',data: data,
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
        isSuccess=true;
      }
    }on DioException catch(err)
    {
      print("-------------------");
      print(err.response?.data);
    }
    return isSuccess;
  }


 }

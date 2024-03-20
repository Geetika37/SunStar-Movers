import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/responses/SurveyDetailsResponse.dart';

class SurveyApi
{
  AppController appCt=Get.find();

  Future<SurveyDetailsResponse ?> surevyDetails()async
  {
    SurveyDetailsResponse? suveryDetailResponse;
    var response=await Dio().post('https://ssmovers.progbiz.io/api/Orders/get-orders-paged-list',
        data: {
          "pageIndex": 1,
          "pageSize": 10,
          "searchString": "",
          "currentFollowupNature": -1,
          "filterByIdOptions": [

          ],
          "filterByDateOptions": [

          ],
          "filterByBooleanOptions": [

          ],
          "filterByFieldOptions": [

          ]
        },
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
        suveryDetailResponse=SurveyDetailsResponse.fromJson(response.data);
      }
    return suveryDetailResponse;
  }
}
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/responses/MarketingResponse.dart';

class MarketingApi
{
  AppController appCt=Get.find();

  // POST MARKETING DETAILS

  Future<MarketingDetailResponse?> marketingDetails()async
  {
    MarketingDetailResponse? marketingDetailResponse;
    var data={
      "pageIndex": 1,
        "pageSize": 100,
        "searchString": "",
        "currentFollowupNature": -1,
        "filterByIdOptions": [],
        "filterByDateOptions": [],
        "filterByBooleanOptions": [],
        "filterByFieldOptions": []
    };
    var response=await Dio().post('https://ssmovers.progbiz.io/api/Marketing/get-marketing-paged-list',data: data,
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
        marketingDetailResponse=MarketingDetailResponse.fromJson(response.data);
      }
    return marketingDetailResponse;
  }
}
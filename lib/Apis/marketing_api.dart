import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/responses/ActivityResponse.dart';
import 'package:sunstarmovers/responses/EmirateResponse.dart';
import 'package:sunstarmovers/responses/MarketingDetailResponse.dart';
import 'package:sunstarmovers/responses/MarketingEmirateResponse.dart';
import 'package:sunstarmovers/responses/MarketingOrderNumberResponse.dart';
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


  // GET ORDER NUMBER

  Future<MarketingOrderNumberResponse ?> marketingOrderNumber()async
  {
    MarketingOrderNumberResponse? marketingOrderNumberResponse;
    var response=await Dio().get('https://ssmovers.progbiz.io/api/Marketing/get-marketing-number',data: {},
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
        marketingOrderNumberResponse=MarketingOrderNumberResponse.fromJson(response.data);
      }
    return marketingOrderNumberResponse;

  }



  // POST ADD MARKETING
  Future<bool> MarketingAdd(dynamic data)async
  {
    var isSuccess;
    var response=await Dio().post('https://ssmovers.progbiz.io/api/Marketing/save-marketing',data: data,
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
    return isSuccess;
  }


  // POST ACTIVITY DETAILS

  Future<List<ActivityResponse>?> activity()async
  {
    List<ActivityResponse>? activityResponse;
    var data={
      "id": 0,
      "searchString": "",
      "readDataOnSearch": false,
      "dropdownMode": 0
    };
    var response=await Dio().post('https://ssmovers.progbiz.io/api/Common/get-list-of-activities',data: data,
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

        activityResponse = (response.data as List)
            .map((e) => ActivityResponse.fromJson(e))
            .toList();

      }
    return activityResponse;
  }


  // POST EMIRATE DETAILS

  Future<List<MarketingEmirateResponse>?> marketingEmirate()async
  {
    List<MarketingEmirateResponse>? marketingEmirateResponse;
    var data={
      "id": 0,
      "searchString": "",
      "readDataOnSearch": false,
      "dropdownMode": 0
    };
    var response=await Dio().post('https://ssmovers.progbiz.io/api/Common/get-list-of-emirates',data: data,
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
        marketingEmirateResponse= (response.data as List)
            .map((e) => MarketingEmirateResponse.fromJson(e))
            .toList();
      }
      return marketingEmirateResponse;
  }


  // GET MARKETING DETAILS

  Future<AllMarketingDetailResponse ?> allMarketing({int? marketingId}) async
  {
    AllMarketingDetailResponse? allMarketingDetailResponse;
    print(appCt.token);
    var response=await Dio().get('https://ssmovers.progbiz.io/api/Marketing/get-all-marketing-view-data/${marketingId}',data: {},
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
        allMarketingDetailResponse=AllMarketingDetailResponse.fromJson(response.data);
      }
    return allMarketingDetailResponse;
  }


  // GET DELETE MARKETING

  Future<bool> deleteMarketing(int? marketingId)async
  {
    var isSuccess;
    print(appCt.token);
    var response=await Dio().get('https://ssmovers.progbiz.io/api/Marketing/detete-activity/${marketingId}',data: {},
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
    return isSuccess;
  }

}
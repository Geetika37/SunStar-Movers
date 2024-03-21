import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/responses/BuildingTypeResponse.dart';
import 'package:sunstarmovers/responses/EmirateResponse.dart';
import 'package:sunstarmovers/responses/LeadSourceResponse.dart';
import 'package:sunstarmovers/responses/MovingTypeResponse.dart';
import 'package:sunstarmovers/responses/OrderNumberResponse.dart';
import 'package:sunstarmovers/responses/SurveyDetailsResponse.dart';

class SurveyApi
{
  AppController appCt=Get.find();

  //POST SURVEY DETAILS

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

  // POST ADD SURVEY

  Future<bool> SurveyAdd(dynamic data)async
  {
    var isSuccess;

    var response=await Dio().post('https://ssmovers.progbiz.io/api/Orders/save-orders',data: data,
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

  // GET ORDER NUMBER

  Future<OrderNumberResponse ?> orderNumber()async
  {
    OrderNumberResponse? orderNumberResponse;
    var response=await Dio().get('https://ssmovers.progbiz.io/api/Orders/get-order-number',data: {},
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
        orderNumberResponse=OrderNumberResponse.fromJson(response.data);
      }
    return orderNumberResponse;
  }

  // POST building type

  Future<List<BuildingTypeResponse> ?> buildingType() async
  {
    List<BuildingTypeResponse>? buildingTypeResponse;
    var data={
      "id": 0,
      "searchString": "",
      "readDataOnSearch": false,
      "dropdownMode": 0
    };
    var response=await Dio().post('https://ssmovers.progbiz.io/api/Common/get-list-of-building-types',data: data,
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
        buildingTypeResponse=(response.data as List).map((e) => BuildingTypeResponse.fromJson(e)).toList();
      }
    return buildingTypeResponse;
  }


  // POST MOVING TYPE

  Future<List<MovingTypeResponse>?> movingType() async
  {
    List<MovingTypeResponse>? movingTypeResponse;
    var data={
      "id": 0,
      "searchString": "",
      "readDataOnSearch": false,
      "dropdownMode": 0
    };
    var response=await Dio().post('https://ssmovers.progbiz.io/api/Common/get-list-of-moving-types',data: data,
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
        movingTypeResponse=(response.data as List).map((e) => MovingTypeResponse.fromJson(e)).toList();
      }
    return movingTypeResponse;
  }


  // POST EMIRATES

  Future<List<EmiratesResponse>? > emirate()async
  {
    List<EmiratesResponse>? emiratesResponse;
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
        emiratesResponse=(response.data as List).map((e) => EmiratesResponse.fromJson(e)).toList();
      }
    return emiratesResponse;
  }


  // POST Lead Source Response

  Future<List<LeadSourceResponse>?> leadSource()async
  {
    List<LeadSourceResponse>? leadSourceResponse;
    var data={
      "id": 0,
      "searchString": "",
      "readDataOnSearch": false,
      "dropdownMode": 0
    };
    var response=await Dio().post('https://ssmovers.progbiz.io/api/Common/get-list-of-lead-source',data: data,
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
        leadSourceResponse=(response.data as List).map((e) => LeadSourceResponse.fromJson(e)).toList();
      }
    return leadSourceResponse;
  }

}
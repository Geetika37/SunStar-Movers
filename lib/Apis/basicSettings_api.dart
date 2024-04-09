import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/responses/ActivitySettingsResponse.dart';
import 'package:sunstarmovers/responses/BuildingTypeSettingsResponse.dart';
import 'package:sunstarmovers/responses/EmirateSettingsResponse.dart';
import 'package:sunstarmovers/responses/LeadSourceSettingsResponse.dart';
import 'package:sunstarmovers/responses/MovingTypeSettingsResponse.dart';
import 'package:sunstarmovers/responses/TeamLeaderSettingsResponse.dart';

class BasicSettingApi
{
  AppController appCt=Get.find();

  // ---------SETTINGS-------

  // ********** BUILIDNG TYPE *********

  // POST BUILDING TYPE SETTINGS DETAILS

  Future<BuildingTypeSettingsResponse?> buildingTypeSettings()async
  {
    BuildingTypeSettingsResponse? buildingTypeSettingsResponse;
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
    var response=await Dio().post('https://sunstar-project.progbiz.io/api/Common/get-building-type-paged-list',data: data,
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
        buildingTypeSettingsResponse=BuildingTypeSettingsResponse.fromJson(response.data);
      }
    return buildingTypeSettingsResponse;
  }

  // ADD BUILDING TYPE SETTING

  Future<bool> BuildingTypeSettingAdd(dynamic data)async
  {
    var isSuccess;
    var response=await Dio().post('https://sunstar-project.progbiz.io/api/Orders/save-building-type',data: data,
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

  // DELETE BUILDING TYPE

  Future<bool> deleteBuildingType(int? buildingTypeID)async
  {
    var isSuccess;
    var response=await Dio().get('https://sunstar-project.progbiz.io/api/Common/detete-building-type/${buildingTypeID}',data: {},
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






// ********** MOVING TYPE *********

// POST MOVING DETAILS

  Future<MovingTypeSettingsResponse ?> movingTypeSettings()async
  {
    MovingTypeSettingsResponse? movingTypeSettingsResponse;
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
    var response=await Dio().post('https://sunstar-project.progbiz.io/api/Common/get-moving-type-paged-list',data: data,
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
        movingTypeSettingsResponse=MovingTypeSettingsResponse.fromJson(response.data);
      }
    return movingTypeSettingsResponse;
  }


  // ADD MOVING TYPE

  Future<bool> MovingTypeSettingAdd(dynamic data) async
  {
    var isSuccess;
    var response=await Dio().post('https://sunstar-project.progbiz.io/api/Orders/save-moving-type',data: data,
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

  // DELETE MOVING TYPE

  Future<bool> deleteMovingType(int? movingTypeID) async
  {
    var isSuccess;
    var response=await Dio().get('https://sunstar-project.progbiz.io/api/Common/detete-moving-type/${movingTypeID}',data: {},
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








// ********** LEAD SOURCE *********

// POST LEAD SOURCE DETAILS

  Future<LeadSourceSettingsResponse ?> leadSourceSettings()async
  {
    LeadSourceSettingsResponse? leadSourceSettingsResponse;
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
    var response=await Dio().post('https://sunstar-project.progbiz.io/api/Leads/get-lead-source-paged-list',data: data,
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
      leadSourceSettingsResponse=LeadSourceSettingsResponse.fromJson(response.data);
    }
    return leadSourceSettingsResponse;
  }







}
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/responses/BuildingTypeSettingsResponse.dart';

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

}
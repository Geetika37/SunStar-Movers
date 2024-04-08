import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/pages/SurveyPendingConfirm.dart';
import 'package:sunstarmovers/responses/AllSurveyResponse.dart';
import 'package:sunstarmovers/responses/BuildingTypeResponse.dart';
import 'package:sunstarmovers/responses/EmirateResponse.dart';
import 'package:sunstarmovers/responses/LeadSourceResponse.dart';
import 'package:sunstarmovers/responses/MovingTypeResponse.dart';
import 'package:sunstarmovers/responses/OrderNumberResponse.dart';
import 'package:sunstarmovers/responses/SurveyDetailsResponse.dart';
import 'package:sunstarmovers/responses/navSurveyResponse.dart';

class SurveyApi {
  AppController appCt = Get.find();

  //POST SURVEY DETAILS

  Future<SurveyDetailsResponse?> surevyDetails() async {
    SurveyDetailsResponse? suveryDetailResponse;
    var response = await Dio()
        .post('https://sunstar-project.progbiz.io/api/Orders/get-orders-paged-list',
            data: {
              "pageIndex": 1,
              "pageSize": 100,
              "searchString": "",
              "currentFollowupNature": -1,
              "filterByIdOptions": [],
              "filterByDateOptions": [],
              "filterByBooleanOptions": [],
              "filterByFieldOptions": []
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
                      }));
    print(response.data);

    if (response.statusCode == 200) {
      suveryDetailResponse = SurveyDetailsResponse.fromJson(response.data);
    }
    return suveryDetailResponse;
  }

  // POST ADD SURVEY

  Future<bool> SurveyAdd(dynamic data) async {
    var isSuccess;
    // log(data);

    try {
      var response =
          await Dio().post('https://sunstar-project.progbiz.io/api/Orders/save-orders',
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
      print(err.response!.data);
    }
    return isSuccess;
  }

  // GET ORDER NUMBER

  Future<OrderNumberResponse?> orderNumber() async {
    OrderNumberResponse? orderNumberResponse;
    var response = await Dio()
        .get('https://sunstar-project.progbiz.io/api/Orders/get-order-number',
            data: {},
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
      orderNumberResponse = OrderNumberResponse.fromJson(response.data);
    }
    return orderNumberResponse;
  }

  // POST building type

  Future<List<BuildingTypeResponse>?> buildingType() async {
    List<BuildingTypeResponse>? buildingTypeResponse;
    var data = {
      "id": 0,
      "searchString": "",
      "readDataOnSearch": false,
      "dropdownMode": 0
    };
    var response = await Dio().post(
        'https://sunstar-project.progbiz.io/api/Common/get-list-of-building-types',
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
      buildingTypeResponse = (response.data as List)
          .map((e) => BuildingTypeResponse.fromJson(e))
          .toList();
    }
    return buildingTypeResponse;
  }

  // POST MOVING TYPE

  Future<List<MovingTypeResponse>?> movingType() async {
    List<MovingTypeResponse>? movingTypeResponse;
    var data = {
      "id": 0,
      "searchString": "",
      "readDataOnSearch": false,
      "dropdownMode": 0
    };
    var response = await Dio()
        .post('https://sunstar-project.progbiz.io/api/Common/get-list-of-moving-types',
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
      movingTypeResponse = (response.data as List)
          .map((e) => MovingTypeResponse.fromJson(e))
          .toList();
    }
    return movingTypeResponse;
  }

  // POST EMIRATES

  Future<List<EmiratesResponse>?> emirate() async {
    List<EmiratesResponse>? emiratesResponse;
    var data = {
      "id": 0,
      "searchString": "",
      "readDataOnSearch": false,
      "dropdownMode": 0
    };
    var response = await Dio()
        .post('https://sunstar-project.progbiz.io/api/Common/get-list-of-emirates',
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
      emiratesResponse = (response.data as List)
          .map((e) => EmiratesResponse.fromJson(e))
          .toList();
    }
    return emiratesResponse;
  }

  // POST Lead Source Response

  Future<List<LeadSourceResponse>?> leadSource() async {
    List<LeadSourceResponse>? leadSourceResponse;
    var data = {
      "id": 0,
      "searchString": "",
      "readDataOnSearch": false,
      "dropdownMode": 0
    };
    var response = await Dio()
        .post('https://sunstar-project.progbiz.io/api/Common/get-list-of-lead-source',
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
      leadSourceResponse = (response.data as List)
          .map((e) => LeadSourceResponse.fromJson(e))
          .toList();
    }
    return leadSourceResponse;
  }


  // GET ALL SURVEY API
  Future<AllSurveyResponse ?> allSurvey({int? surveyID})async
  {
    AllSurveyResponse? allSurveyResponse;
print(appCt.token);
    var response=await Dio().get('https://sunstar-project.progbiz.io/api/Orders/get-all-servey/${surveyID}',data: {},
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
        allSurveyResponse=AllSurveyResponse.fromJson(response.data);
      }
    return allSurveyResponse;
  }


  // GET DELETE SURVEY

  Future<bool> deleteSurvey(int? surveyID)async
  {
      var isSuccess;
      print(appCt.token);
      var response=await Dio().get('https://sunstar-project.progbiz.io/api/Orders/detete-survey/${surveyID}',data: {},
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


  //POST COMMENT SURVEY

  Future<bool> commentSurvey({String? remark ,int? SurveyID}) async
  {
    var isSuccess;
    print(appCt.token);
    var data={
      "isDeleted": false,
      "remarkID": 0,
      "surveyID": SurveyID,
      "entityID": 0,
      "remark": remark
    };
    var response=await Dio().post('https://sunstar-project.progbiz.io/api/Orders/save-survey-remark',data:data,
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


  // POST CANCEL SUREVY

  Future<bool> cancelSurvey({int? surevyID, String? cancelReason})async
  {
    print(appCt.token);
    var isSuccess;
    var data={
      "surveyID": surevyID,
      "canceledReason": cancelReason
    };
    var response=await Dio().post('https://sunstar-project.progbiz.io/api/Orders/save-canceled-reason',data: data,
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


  //MENU

  // POST Pendng Surevy

  Future<NavSurveyResponse ?> pendingDetails() async
  {
    NavSurveyResponse? pendingSurveyDetails;
    var data={
      "pageIndex": 1,
      "pageSize": 100,
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
    };
    var response=await Dio().post('https://sunstar-project.progbiz.io/api/Orders/get-survey-pending-paged-list',data: data,
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
        pendingSurveyDetails=NavSurveyResponse.fromJson(response.data);
      }
    return pendingSurveyDetails;
  }

  // POST CONFIRMED SURVEY

  Future<NavSurveyResponse ?> confirmedDetails() async
  {
    NavSurveyResponse? confirmedSurveyDetails;
    var data={
      "pageIndex": 1,
      "pageSize": 100,
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
    };
    var response=await Dio().post('https://sunstar-project.progbiz.io/api/Orders/get-survey-confirmed-paged-list',data: data,
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
        confirmedSurveyDetails=NavSurveyResponse.fromJson(response.data);
      }
    return confirmedSurveyDetails;
  }


  //POST CANCELLED SURVEY


  Future<NavSurveyResponse ?> canceledDetails()async
  {
    NavSurveyResponse? canceledSurveyDetails;
    var data={
      "pageIndex": 1,
      "pageSize": 100,
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
    };
    var response=await Dio().post('https://sunstar-project.progbiz.io/api/Orders/get-survey-cancelled-paged-list',data: data,
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
        canceledSurveyDetails=NavSurveyResponse.fromJson(response.data);
      }
    return canceledSurveyDetails;
  }


  // POST START WORK

  Future<NavSurveyResponse ?> startWorkDetails() async
  {
    NavSurveyResponse? startWorkSurveyDetails;
    var data={
      "pageIndex": 1,
      "pageSize": 100,
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
    };
    var response=await Dio().post('https://sunstar-project.progbiz.io/api/Orders/get-survey-start-work-paged-list',data: data,
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
        startWorkSurveyDetails=NavSurveyResponse.fromJson(response.data);
      }
    return startWorkSurveyDetails;
  }


  // POST COLLECTION PENDING

  Future<NavSurveyResponse ?> collectionPendingDetails() async
  {
    NavSurveyResponse? collectionPendingSurveyDetails;
    var data={
      "pageIndex": 1,
      "pageSize": 100,
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
    };
    var response=await Dio().post('https://sunstar-project.progbiz.io/api/Orders/get-collection-pending-paged-list',data: data,
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
        collectionPendingSurveyDetails=NavSurveyResponse.fromJson(response.data);
      }
    return collectionPendingSurveyDetails;
  }

  // POST CLOSED SURVEY

  Future<NavSurveyResponse ?> closedDetails() async
  {
    NavSurveyResponse? closedSurveyDetails;
    var data={
      "pageIndex": 1,
      "pageSize": 100,
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
    };
    var response=await Dio().post('https://sunstar-project.progbiz.io/api/Orders/get-survey-complete-paged-list',data: data,
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
        closedSurveyDetails=NavSurveyResponse.fromJson(response.data);
      }
    return closedSurveyDetails;
  }
}

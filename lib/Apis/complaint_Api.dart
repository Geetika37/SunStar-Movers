import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/pages/ComplaintAddDetails.dart';
import 'package:sunstarmovers/pages/ComplaintDetails.dart';
import 'package:sunstarmovers/pages/showDialog2.dart';
import 'package:sunstarmovers/pages/showDialog3.dart';
import 'package:sunstarmovers/responses/AllComplaintResponse.dart';
import 'package:sunstarmovers/responses/ComplaintAddDetailResponse.dart';
import 'package:sunstarmovers/responses/ComplaintResponse.dart';
import 'package:sunstarmovers/responses/navComplaintResponse.dart';

class ComplaintApi {
  AppController appCt = Get.find();

  // POST COMPLAINT DETAILS
  Future<ComplaintResponse?> complaintDetails() async {
    ComplaintResponse? complaintDetailsResponse;
    var data = {
      "pageIndex": 1,
      "pageSize": 100,
      "searchString": "",
      "currentFollowupNature": -1,
      "filterByIdOptions": [],
      "filterByDateOptions": [],
      "filterByBooleanOptions": [],
      "filterByFieldOptions": []
    };
    var response = await Dio().post(
        'https://sunstar-project.progbiz.io/api/Complaint/get-complaint-paged-list',
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
      complaintDetailsResponse = ComplaintResponse.fromJson(response.data);
    }
    return complaintDetailsResponse;
  }

  // Get valid survey number
  Future<bool> validSurveyNumber(String refNo) async {
    var isSuccess;
    var data = {"value": refNo};
    var response = await Dio().post(
        'https://sunstar-project.progbiz.io/api/Complaint/get-valid-survey-number',
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
    if (response.statusCode == 200)
    {
      if (response.data == true) {
        Get.to(() => ComplaintAddDetails(
              refNo: refNo,
            ));
      } else {
        Get.dialog(showDialog3(
          title1: 'Oops',
          subtitle1: 'Invalid Ref No',
          button11: 'close',
          onPressedd: () {
            Get.back();
          },
        ));
      }

      isSuccess = true;
    }
    return isSuccess;
  }

  // VALID PHONE NUMBER

  Future<bool> validPhoneNumber(String PhoneNum) async {
    var isSuccess;
    var data = {"value": PhoneNum};
    var response = await Dio().post(
        'https://sunstar-project.progbiz.io/api/Complaint/get-valid-phone-number',
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
      response.data == true
          ? Get.dialog(showDialog3(
              title1: 'Oops',
              subtitle1: 'Invalid Phone Number',
              button11: 'Close',
              onPressedd: () {
                Get.back();
              },
            ))
          : Get.to(() => ComplaintAddDetails());
      isSuccess = true;
    }
    return isSuccess;
  }

  // POST  ADD COMPLAINT ----  DETAILS (While adding ref no)
  Future<ComplaintAddDetailResponse?> complaintAddDetail(
      String surveyNo) async {
    ComplaintAddDetailResponse? complaintAddDetailResponse;
    var data = {"value": surveyNo};
    var response = await Dio().post(
        'https://sunstar-project.progbiz.io/api/Complaint/get-complaint-survey-details',
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
      complaintAddDetailResponse =
          ComplaintAddDetailResponse.fromJson(response.data);
    }
    return complaintAddDetailResponse;
  }

  // POST SAVE DATA

  Future<bool> ComplaintAdd(dynamic data) async {
    var isSuccess;
    var response = await Dio()
        .post('https://sunstar-project.progbiz.io/api/Complaint/save-complaint',
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
    return isSuccess;
  }

  //GET DETAILS complaint
  Future<ComplaintAddDetailResponse?> complaintDetailShow() async {
    ComplaintAddDetailResponse? complaintDetail;
    var response = await Dio()
        .get('https://sunstar-project.progbiz.io/api/Complaint/get-complaint/7',
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
      complaintDetail = ComplaintAddDetailResponse.fromJson(response.data);
    }
    return complaintDetail;
  }

  // POST PENDING COMPLAINT DETAILS

  Future<ComplaintResponse?> pendingComplaint() async {
    ComplaintResponse? pendingComplaintDetails;
    var data = {
      "pageIndex": 1,
      "pageSize": 100,
      "searchString": "",
      "currentFollowupNature": -1,
      "filterByIdOptions": [],
      "filterByDateOptions": [],
      "filterByBooleanOptions": [],
      "filterByFieldOptions": []
    };
    var response = await Dio().post(
        'https://sunstar-project.progbiz.io/api/Complaint/get-complaint-pending-paged-list',
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
      pendingComplaintDetails = ComplaintResponse.fromJson(response.data);
    }
    return pendingComplaintDetails;
  }

  // POST CLOSED COMPLAINT DETAILS

  Future<ComplaintResponse?> closedComplaint() async {
    ComplaintResponse? closedComplaintDetails;
    var data = {
      "pageIndex": 1,
      "pageSize": 100,
      "searchString": "",
      "currentFollowupNature": -1,
      "filterByIdOptions": [],
      "filterByDateOptions": [],
      "filterByBooleanOptions": [],
      "filterByFieldOptions": []
    };

    var response = await Dio().post(
        'https://sunstar-project.progbiz.io/api/Complaint/get-complaint-closed-paged-list',
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
      closedComplaintDetails = ComplaintResponse.fromJson(response.data);
    }
    return closedComplaintDetails;
  }

  // GET COMPLAINT DETAILS

  Future<AllComplaintResponse?> allComplaint({int? compalintId}) async {
    AllComplaintResponse? allComplaintResponse;
    var response = await Dio().get(
        'https://sunstar-project.progbiz.io/api/Complaint/get-complaint/${compalintId}',
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
      allComplaintResponse = AllComplaintResponse.fromJson(response.data);
    }
    return allComplaintResponse;
  }

  // CLOSE COMPLAINT

  Future<bool> CloseComplaint(dynamic data) async {
    var isSuccess;
    var response = await Dio().post(
        'https://sunstar-project.progbiz.io/api/Complaint/save-close-complaint',
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
    return isSuccess;
  }


  // Add comment in complaint

  Future<bool> commentComplaint({int? complaintID,String? comment})async
  {
    var isSuccess;
    var data={
      "complaintID": complaintID,
      "comment": comment
    };
    var response=await Dio().post('https://sunstar-project.progbiz.io/api/Complaint/save-Complaint-remark',data: data,
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

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/responses/ProfileDetailsResponse.dart';




class ProfileApi
{
  AppController appCt=Get.find();

  // Post Change Password

  Future<bool> changePassword(String currentPass,String newPass,String confirmPass) async
  {
    var isSuccess;
    var data={
      "currentPassword": currentPass,
      "newPassword": newPass,
      "confirmPassword": confirmPass
    };
    var response=await Dio().post('https://sunstar-project.progbiz.io/api/Profile/change-password',data: data,
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

  // GET profile details

  Future< ProfileDetailsResponse ?> profileDetails() async
  {
    ProfileDetailsResponse? profileDetailResponse;
    var response=await Dio().get('https://sunstar-project.progbiz.io/api/Profile/get-profile-details',data: {},
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
      profileDetailResponse=ProfileDetailsResponse.fromJson(response.data);
    }
    return profileDetailResponse;
  }

  // POST profile update

  Future<bool> updateProfile(String firstName,String middleName,String lastName,String phoneNum,String emailAddress) async
  {
    var isSuccess;
    var data={
      "firstName": firstName,
      "middleName": middleName,
      "lastName": lastName,
      "phone": phoneNum,
      "emailAddress": emailAddress,
      "mediaID": 0,
      "qrCode": null
    };
    
    var response=await Dio().post('https://sunstar-project.progbiz.io/api/Profile/update-profile',data: data,
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


// Profile account



import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/responses/LoginResponse.dart';

// class AuthApi{
//   Future<bool> login(String userName, String passwoard)async{
//     var isSuccess;
//     var data = {
//       "username": userName,
//       "password": passwoard,
//       "clientID": 0,
//       "branchID": -1,
//       "accessibleUserTypes": null,
//       "machineID": null
//     };
//     var response = await Dio().post('https://ssmovers.progbiz.io/api/Auth/login',data:data );
//     print(response.data);
//     if(response.statusCode== 200){
//       isSuccess = true;
//     }
//     return isSuccess;
//   }
// }



class AuthApi
{

  AppController appCt = Get.find();
  Future<bool> login(String userName,String password) async
  {
    var isSuccess;
    var data={
      "username": userName,
      "password": password,
      "clientID": 0,
      "branchID": -1,
      "accessibleUserTypes": null,
      "machineID": null
    };

    print(data);
    var response =await Dio().post('https://ssmovers.progbiz.io/api/Auth/login',data: data,
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

        print('11111111111111');
        var data = LoginResponse.fromJson(response.data);
        isSuccess=true;
        appCt.token = data.accessToken;
      }
    return isSuccess;
  }
}
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/profile_Api.dart';
import 'package:sunstarmovers/responses/DashboardCountResponse.dart';
import 'package:sunstarmovers/responses/LatestSurveyResponse.dart';
import 'package:sunstarmovers/responses/ProfileDetailsResponse.dart';
import 'package:sunstarmovers/responses/SurveyDetailsResponse.dart';

class AppController extends GetxController
{
  String ? token;

  ProfileDetailsResponse? profileDetailResponse;

  getProfile()async{
    profileDetailResponse = await ProfileApi().profileDetails();
    update();
  }

  DashboardCountResponse? dashboardCountResponse;

  List<LatestSurveyResponse>? lastestSurvey;

  SurveyDetailsResponse? surveyDetailsResponse;
}

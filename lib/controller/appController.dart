import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/profile_Api.dart';
import 'package:sunstarmovers/Apis/survey_api.dart';
import 'package:sunstarmovers/responses/ActivityResponse.dart';
import 'package:sunstarmovers/responses/AllSurveyResponse.dart';
import 'package:sunstarmovers/responses/BuildingTypeResponse.dart';
import 'package:sunstarmovers/responses/DashboardCountResponse.dart';
import 'package:sunstarmovers/responses/EmirateResponse.dart';
import 'package:sunstarmovers/responses/LatestSurveyResponse.dart';
import 'package:sunstarmovers/responses/LeadSourceResponse.dart';
import 'package:sunstarmovers/responses/MarketingDetailResponse.dart';
import 'package:sunstarmovers/responses/MarketingEmirateResponse.dart';
import 'package:sunstarmovers/responses/MarketingOrderNumberResponse.dart';
import 'package:sunstarmovers/responses/MarketingResponse.dart';
import 'package:sunstarmovers/responses/MovingTypeResponse.dart';
import 'package:sunstarmovers/responses/OrderNumberResponse.dart';
import 'package:sunstarmovers/responses/ProfileDetailsResponse.dart';
import 'package:sunstarmovers/responses/SurveyDetailsResponse.dart';
import 'package:sunstarmovers/responses/TeamLeaderResponse.dart';
import 'package:sunstarmovers/responses/navSurveyResponse.dart';

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

  MarketingDetailResponse? marketingDetailResponse;



  MarketingOrderNumberResponse? marketingOrderNumberResponse;
  OrderNumberResponse? orderNumberResponse;

  getOrderNumber()async
  {
    orderNumberResponse=await SurveyApi().orderNumber();
  }

  List<BuildingTypeResponse>? buildingTypeResponse;

  List<MovingTypeResponse>? movingTypeResponse;

  List<EmiratesResponse>? emiratesResponse;

  List<LeadSourceResponse>? leadSourceResponse;

  AllSurveyResponse? allSurveyResponse;

  List<ActivityResponse>? activityResponse;

  List<MarketingEmirateResponse>? marketingEmirateResponse;

  AllMarketingDetailResponse? allMarketingDetailResponse;

  List<TeamLeaderResponse>? teamLeaderResponse;
}

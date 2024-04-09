import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/basicSettings_api.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/TextField1.dart';
import 'package:sunstarmovers/responses/BuildingTypeSettingsResponse.dart';

class SettingBuildingSheet extends StatefulWidget {
  final String? buildingTypeName;
  final int? buildingTypeID;
  const SettingBuildingSheet(
      {super.key, this.buildingTypeID, this.buildingTypeName});

  @override
  State<SettingBuildingSheet> createState() => _SettingBuildingSheetState();
}

class _SettingBuildingSheetState extends State<SettingBuildingSheet> {
  TextEditingController _buildingTypeController = TextEditingController();

  @override
  void initState() {
    _buildingTypeController.text = widget.buildingTypeName ?? '';

    super.initState();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            SizedBox(height: 25),
            Row(
              children: [Text3(name3: 'Building Type')],
            ),
            SizedBox(height: 15),
            TextField1(
              hintName: 'Building Type Name',
              labelText: 'Building Type Name',
              controller: _buildingTypeController,
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                    child: ButtonnElevated(
                  buttonName: 'Done',
                  onPressed: () async {
                    var data = {
                      "buildingTypeID": widget.buildingTypeID ?? 0,
                      "buildingTypeName": _buildingTypeController.text,
                      "branchID": 0
                    };

                    var isSuccess =
                        await BasicSettingApi().BuildingTypeSettingAdd(data);
                    if (isSuccess) {
                      Get.back(result: true);
                    }
                  },
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: ButtonnOutlined(
                  title: 'Close',
                  onPressed: () {},
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

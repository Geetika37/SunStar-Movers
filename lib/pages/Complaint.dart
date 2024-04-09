import 'package:flutter/material.dart';
import 'package:sunstarmovers/Apis/complaint_Api.dart';
import 'package:sunstarmovers/enums/enum.dart';
import 'package:sunstarmovers/pages/ComplaintAddBottomsheet.dart';
import 'package:sunstarmovers/pages/ComplaintBottomSheet.dart';
import 'package:sunstarmovers/pages/ComplaintDetails.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/searchBar.dart';
import 'package:sunstarmovers/responses/ComplaintResponse.dart';
import 'package:sunstarmovers/responses/navComplaintResponse.dart';

class Complaint extends StatefulWidget {
  final int? Id;
  const Complaint({super.key, this.Id});

  @override
  State<Complaint> createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  ComplaintResponse? complaintResponse;
  NavComplaintResponse? navComplaintResponse;
  bool screenLoad = true;

  @override
  void initState() {
    switch (widget.Id) {
      case 1:
        getComplaintDetails();
        break;
      case 2:
        getPendingComplaintDetails();
        break;
      case 3:
        getClosedComplaintDetails();
        break;
    }

    super.initState();
  }

  getPendingComplaintDetails() async {
    print('==========================pending}');
    complaintResponse = await ComplaintApi().pendingComplaint();
    setState(() {
      screenLoad = false;
    });
  }

  getClosedComplaintDetails() async {
    print('==========================closed}');
    complaintResponse = await ComplaintApi().closedComplaint();
    setState(() {
      screenLoad = false;
    });
  }

  getComplaintDetails() async {
    print('==========================complaints}');
    complaintResponse = await ComplaintApi().complaintDetails();
    setState(() {
      screenLoad = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        shadowColor: Colors.red,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
        backgroundColor: Colors.red,
        toolbarHeight: 80,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: ImageIcon(
              AssetImage('assets/chevron-left.png'),
              color: Colors.white,
            )),
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Complaints",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return ComplaintAddBottomSheet();
                    }).then((value) async {
                  print('==========================${value}');
                  if (value == true) {
                    setState(() {
                      screenLoad = true;
                    });
                    await getComplaintDetails();
                  }
                });
              },
              icon: ImageIcon(
                AssetImage(
                  'assets/plus-circle.png',
                ),
                size: 30,
                color: Colors.white,
              )),
        ],
      ),
      body: screenLoad
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.red,
            ))
          : ListView(
              children: [
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SearchBarr(
                          title: 'Search for complaints',
                          image: 'assets/3864_boolean_operation.png'),
                    ),
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return ComplaintBottomSheet();
                              }).then((value) async {
                            print('==========================${value}');
                            if (value == true) {
                              setState(() {
                                screenLoad = true;
                              });
                              await getComplaintDetails();
                            }
                          });
                        },
                        icon: ImageIcon(
                          AssetImage('assets/3881_frame.png'),
                          size: 35,
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text3(name3: 'Complaints'),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),

                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: complaintResponse!.data!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row3(
                                      status: complaintStatusList
                                          .firstWhere((element) =>
                                              element.id ==
                                              complaintResponse!
                                                  .data![index].complaintStatus)
                                          .value!,
                                      color1: complaintStatusList
                                          .firstWhere((element) =>
                                              element.id ==
                                              complaintResponse!
                                                  .data![index].complaintStatus)
                                          .backgroundColor!,
                                      color2: complaintStatusList
                                          .firstWhere((element) =>
                                              element.id ==
                                              complaintResponse!
                                                  .data![index].complaintStatus)
                                          .textColor!,
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ComplaintDetails(
                                                complaintId: complaintResponse!.data![index].complaintID,
                                              ),
                                            )).then((value) async {
                                          if (value == true) {
                                            setState(() {
                                              screenLoad = true;
                                            });
                                            switch (widget.Id) {
                                              case 1:
                                                getComplaintDetails();
                                                break;
                                              case 2:
                                                getPendingComplaintDetails();
                                                break;
                                              case 3:
                                                getClosedComplaintDetails();
                                                break;
                                            }
                                          }
                                        });
                                      },
                                      name1: complaintResponse!
                                          .data![index].customerName!,
                                      date: complaintResponse!
                                          .data![index].complaintDate,
                                      time:
                                          complaintResponse!.data![index].name!,
                                      image1: 'assets/calendar.png',
                                      image2: 'assets/user-03.png',
                                      image3: 'assets/pending.png',
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    new Divider(
                                      color: Colors.grey.shade300,
                                    ),
                                  ],
                                );
                              })

                          // Row3(status: 'Pending', color1:const Color(0xfffFFEFEF) ,color2:const Color(0xfffFC5A5A),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintDetails(status: 'Pending')));},name1: 'Zack Snyder', date: '12/12/2023', time: 'Steve', image1: 'assets/calendar.png', image2: 'assets/user-03.png', image3: 'assets/pending.png',),
                          // SizedBox(height: 10,),
                          //
                          // new Divider(
                          //   color: Colors.grey.shade300,
                          // ),
                          //
                          // SizedBox(height: 10,),
                          // Row3(status: 'Closed', color1:const Color(0xfffE8F2FE) ,color2:const Color(0xfff157CF0),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintDetails(status: 'Closed',)));},name1: 'Zack Snyder', date: '12/12/2023', time: 'Steve', image1: 'assets/calendar.png', image2: 'assets/user-03.png', image3: 'assets/closed.png',),
                          // SizedBox(height: 10,),
                          //
                          // new Divider(
                          //   color: Colors.grey.shade300,
                          // ),
                          //
                          // SizedBox(height: 10,),
                          // Row3(status: 'Pending', color1:const Color(0xfffFFEFEF) ,color2:const Color(0xfffFC5A5A),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintDetails(status: 'Pending',)));},name1: 'Zack Snyder', date: '12/12/2023', time: 'Steve', image1: 'assets/calendar.png', image2: 'assets/user-03.png', image3: 'assets/pending.png',),
                          // SizedBox(height: 10,),
                          //
                          // new Divider(
                          //   color: Colors.grey.shade300,
                          // ),
                          //
                          // SizedBox(height: 10,),
                          // Row3(status: 'Closed', color1:const Color(0xfffE8F2FE) ,color2:const Color(0xfff157CF0),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintDetails(status:'Closed' ,)));},name1: 'Zack Snyder', date: '12/12/2023', time: 'Steve', image1: 'assets/calendar.png', image2: 'assets/user-03.png', image3: 'assets/closed.png',),
                          // SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}

class IdValue {
  int? id;
  String? value;
  Color? backgroundColor;
  Color? textColor;
  IdValue({this.id, this.value, this.backgroundColor, this.textColor});
}

List<IdValue> complaintStatusList = [
  IdValue(
      id: ComplaintStatus.Pending.index,
      value: ComplaintStatus.Pending.name,
      backgroundColor: Color(0xfffFFEFEF),
      textColor: Color(0xfffFC5A5A)),
  IdValue(
      id: ComplaintStatus.Closed.index,
      value: ComplaintStatus.Closed.name,
      backgroundColor: Color(0xfffE8F2FE),
      textColor: Color(0xfff157CF0))
];

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sunstarmovers/Apis/calender_Api.dart';
import 'package:sunstarmovers/responses/CalenderResponse.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalanderScreen extends StatefulWidget {
  const CalanderScreen({Key? key}) : super(key: key);

  @override
  State<CalanderScreen> createState() => _CalanderScreenState();
}

class _CalanderScreenState extends State<CalanderScreen> {
  CalenderResponse? calenderResponse;
  bool screenLoad = true;

  @override
  void initState() {
    getDetails();
    super.initState();
  }

  @override
  void getDetails() async {
    calenderResponse = await CalenderApi().calender();
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
            bottomLeft: Radius.circular(10),
          ),
        ),
        backgroundColor: Colors.red,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Calendar",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: screenLoad
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.red,
            ))
          : Center(
              child: SfCalendar(
                view: CalendarView.schedule,
                showCurrentTimeIndicator: false,
                scheduleViewSettings: ScheduleViewSettings(
                    appointmentItemHeight: 60,
                    appointmentTextStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    hideEmptyScheduleWeek: true,
                ),
                dataSource: _getCalendarDataSource(),
                todayHighlightColor: Colors.red,
                headerHeight: 0,
                scheduleViewMonthHeaderBuilder: (BuildContext buildContext,
                    ScheduleViewMonthHeaderDetails details) {
                  return Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(children: [
                      Image.asset('assets/calender_schedule.png'),
                      Positioned(
                          top: 15,
                          left: 10,
                          child: Text(
                            "${DateFormat('MMM yyyy').format(details.date)}",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ))
                    ]),
                  ));
                },
              ),
            ),
    );
  }

  _DataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];

    for (var survey in calenderResponse!.calendar!) {
      for (var date in survey.dates!) {
        appointments.add(Appointment(
          startTime: DateTime.parse(date),
          endTime: DateTime.parse(date),
          isAllDay: true,
          color: Color(0xFF1457A2),
          subject:
              "${survey.placeFrom} to ${survey.placeTo} - ${survey.userCode}",
        ));
      }
    }
    return _DataSource(appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}

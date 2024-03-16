import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalanderScreen extends StatefulWidget {
  const CalanderScreen({super.key});

  @override
  State<CalanderScreen> createState() => _CalanderScreenState();
}

class _CalanderScreenState extends State<CalanderScreen> {
  @override
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
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
              "Calender",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'Poppins',color: Colors.white),
          ),
        ),

      ),
      body: Center(
        child: SfCalendar(

          scheduleViewSettings:ScheduleViewSettings(

          ) ,
          view: CalendarView.schedule,
          dataSource: _getCalendarDataSource(),
        ),
      ),
    );
  }
}






MeetingDataSource _getCalendarDataSource() {
  List<Meeting> appointments = <Meeting>[];

  appointments.add(Meeting(
    from: DateTime.now().subtract(Duration(days: 2)),
    to: DateTime.now().subtract(Duration(days: 2)),
    eventName: 'Meeting with John',
    background: Colors.red,
    isAllDay: true,
  ));

  appointments.add(Meeting(
    from: DateTime.now().subtract(Duration(days: 1)),
    to: DateTime.now().subtract(Duration(days: 1)),
    eventName: 'Team lunch',
    background: Colors.green,
    isAllDay: true,
  ));

  appointments.add(Meeting(
    from: DateTime.now().add(Duration(days: 1)),
    to: DateTime.now().add(Duration(days: 1)),
    eventName: 'Client meeting',
    background: Colors.blue,
    isAllDay: true,
  ));

  return MeetingDataSource(appointments);
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }
}

class Meeting {
  Meeting({required this.from, required this.to, required this.eventName, this.background, this.isAllDay = false});

  DateTime from;
  DateTime to;
  String eventName;
  Color? background;
  bool isAllDay;
}

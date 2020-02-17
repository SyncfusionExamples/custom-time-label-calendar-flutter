import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(TimeLabelCustomization());

class TimeLabelCustomization extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimeLabel(),
    );
  }
}

class TimeLabel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

List<String> colors = <String>[
  'Pink',
  'Blue',
  'Wall Brown',
  'Yellow',
  'Default'
];

List<String> views = <String>[
  'Day',
  'Week',
  'WorkWeek',
  'Month',
  'Timeline Day',
  'Timeline Week',
  'Timeline WorkWeek'
];

class ScheduleExample extends State<TimeLabel> {
  CalendarView _calendarView;
  String _customTimeLabelText;
  Color headerColor, viewHeaderColor, calendarColor, defaultColor;

  @override
  void initState() {
    _calendarView = CalendarView.week;
    _customTimeLabelText='Cell';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (
        Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton<String>(
              icon: Icon(Icons.color_lens),
              itemBuilder: (BuildContext context) {
                return colors.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
              onSelected: (String value) {
                setState(() {
                  if (value == 'Pink') {
                    headerColor = const Color(0xFF09e8189);
                    viewHeaderColor = const Color(0xFF0f3acb6);
                    calendarColor = const Color(0xFF0ffe5d8);
                  } else if (value == 'Blue') {
                    headerColor = const Color(0xFF0007eff);
                    viewHeaderColor = const Color(0xFF03aa4f6);
                    calendarColor = const Color(0xFF0bae5ff);
                  } else if (value == 'Wall Brown') {
                    headerColor = const Color(0xFF0937c5d);
                    viewHeaderColor = const Color(0xFF0e6d9b1);
                    calendarColor = const Color(0xFF0d1d2d6);
                  } else if (value == 'Yellow') {
                    headerColor = const Color(0xFF0f7ed53);
                    viewHeaderColor = const Color(0xFF0fff77f);
                    calendarColor = const Color(0xFF0f7f2cc);
                  } else if (value == 'Default') {
                    headerColor = null;
                    viewHeaderColor = null;
                    calendarColor = null;
                  }
                });
              },
            ),
          ],
          backgroundColor: headerColor,
          centerTitle: true,
          titleSpacing: 60,
          leading: PopupMenuButton<String>(
            icon: Icon(Icons.calendar_today),
            itemBuilder: (BuildContext context) => views.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList(),
            onSelected: (String value) {
              setState(() {
                if (value == 'Day') {
                  _calendarView = CalendarView.day;
                } else if (value == 'Week') {
                  _calendarView = CalendarView.week;
                } else if (value == 'WorkWeek') {
                  _calendarView = CalendarView.workWeek;
                } else if (value == 'Month') {
                  _calendarView = CalendarView.month;
                } else if (value == 'Timeline Day') {
                  _calendarView = CalendarView.timelineDay;
                } else if (value == 'Timeline Week') {
                  _calendarView = CalendarView.timelineWeek;
                } else if (value == 'Timeline WorkWeek') {
                  _calendarView = CalendarView.timelineWorkWeek;
                }
              });
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: SfCalendar(
                viewHeaderStyle:
                ViewHeaderStyle(backgroundColor: viewHeaderColor),
                backgroundColor: calendarColor,
                view: _calendarView,
                dataSource: getCalendarDataSource(),
                timeSlotViewSettings: TimeSlotViewSettings(
                  timelineAppointmentHeight: 500,
                  timeRulerSize: 80,
                  timeFormat: _customTimeLabelText + ' hh',
                    timeTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
                ),
              ),
            ),
          ],
        ),
      ));
  }

  _DataSource getCalendarDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      subject: 'Booked',
      color: Colors.red,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
      endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
      subject: 'Booked',
      color: Colors.red,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 2, days: 5)),
      endTime: DateTime.now().add(const Duration(hours: 4, days: 5)),
      subject: 'Booked',
      color: Colors.red,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 6, days: 4)),
      endTime: DateTime.now().add(const Duration(hours: 7, days:4)),
      subject: 'Booked',
      color: Colors.red,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 6, days: 2)),
      endTime: DateTime.now().add(const Duration(hours: 7, days: 2)),
      subject: 'Booked',
      color: Colors.red,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 5)),
      endTime: DateTime.now().add(const Duration(hours: 6)),
      subject: 'Booked',
      color: Colors.red,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 9, days: 2)),
      endTime: DateTime.now().add(const Duration(hours: 10, days: 2)),
      subject: 'Booked',
      color: Colors.red,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 1, days: 2)),
      endTime: DateTime.now().add(const Duration(hours: 2, days: 2)),
      subject: 'Booked',
      color: Colors.red,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 12,)),
      endTime: DateTime.now().add(const Duration(hours: 13, )),
      subject: 'Booked',
      color: Colors.red,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 10)),
      endTime: DateTime.now().add(const Duration(hours: 11)),
      subject: 'Booked',
      color: Colors.red,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 6, days: 2)),
      endTime: DateTime.now().add(const Duration(hours: 7, days: 2)),
      subject: 'Booked',
      color: Colors.red,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 6, days: -1)),
      endTime: DateTime.now().add(const Duration(hours: 7, days: -1)),
      subject: 'Booked',
      color: Colors.red,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 10, days: 5)),
      endTime: DateTime.now().add(const Duration(hours: 11, days: 5)),
      subject: 'Booked',
      color: Colors.red,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 10, days: 3)),
      endTime: DateTime.now().add(const Duration(hours: 11, days: 3)),
      subject: 'Booked',
      color: Colors.red,
    ));

    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 2, days: 3)),
      endTime: DateTime.now().add(const Duration(hours: 3, days: 3)),
      subject: 'Booked',
      color: Colors.red,
    ));
    return _DataSource(appointments);
  }
}
class _DataSource extends CalendarDataSource {
  _DataSource(this.source);

  List<Appointment> source;

  @override
  List<dynamic> get appointments => source;
}

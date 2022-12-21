import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(const TimeLabelCustomization());

class TimeLabelCustomization extends StatelessWidget {
  const TimeLabelCustomization({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimeLabel(),
    );
  }
}

class TimeLabel extends StatefulWidget {
  const TimeLabel({super.key});

  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

class ScheduleExample extends State<TimeLabel> {
  List<String> _colors = <String>[
    'Pink',
    'Blue',
    'Wall Brown',
    'Yellow',
    'Default'
  ];
  final CalendarController _controller = CalendarController();
  Color? _headerColor, _viewHeaderColor, _calendarColor;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: const Icon(Icons.color_lens),
            itemBuilder: (BuildContext context) {
              return _colors.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            onSelected: (String value) {
              setState(() {
                if (value == 'Pink') {
                  _headerColor = const Color(0xFF09e8189);
                  _viewHeaderColor = const Color(0xFF0f3acb6);
                  _calendarColor = const Color(0xFF0ffe5d8);
                } else if (value == 'Blue') {
                  _headerColor = const Color(0xFF0007eff);
                  _viewHeaderColor = const Color(0xFF03aa4f6);
                  _calendarColor = const Color(0xFF0bae5ff);
                } else if (value == 'Wall Brown') {
                  _headerColor = const Color(0xFF0937c5d);
                  _viewHeaderColor = const Color(0xFF0e6d9b1);
                  _calendarColor = const Color(0xFF0d1d2d6);
                } else if (value == 'Yellow') {
                  _headerColor = const Color(0xFF0f7ed53);
                  _viewHeaderColor = const Color(0xFF0fff77f);
                  _calendarColor = const Color(0xFF0f7f2cc);
                } else if (value == 'Default') {
                  _headerColor = null;
                  _viewHeaderColor = null;
                  _calendarColor = null;
                }
              });
            },
          ),
        ],
        backgroundColor: _headerColor,
        centerTitle: true,
        titleSpacing: 60,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SfCalendar(
              viewHeaderStyle:
              ViewHeaderStyle(backgroundColor: _viewHeaderColor),
              backgroundColor: _calendarColor,
              view: CalendarView.week,
              controller: _controller,
              allowedViews: const [
                CalendarView.day,
                CalendarView.week,
                CalendarView.workWeek,
                CalendarView.month,
                CalendarView.timelineDay,
                CalendarView.timelineWeek,
                CalendarView.timelineWorkWeek,
              ],
              dataSource: getCalendarDataSource(),
              timeSlotViewSettings: const TimeSlotViewSettings(
                  timelineAppointmentHeight: 500,
                  timeRulerSize: 80,
                  timeFormat: 'Cell' + ' hh',
                  timeTextStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
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
      endTime: DateTime.now().add(const Duration(hours: 7, days: 4)),
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
      startTime: DateTime.now().add(const Duration(
        hours: 12,
      )),
      endTime: DateTime.now().add(const Duration(
        hours: 13,
      )),
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
  _DataSource(List<Appointment> source){
    appointments = source;
  }
}

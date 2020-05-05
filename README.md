# How to customize the time label in the Flutter event calendar (SfCalendar)?


In the flutter event calendar, you can customize the time label text using the `timeFormat` property of `TimeSlotViewSettings` in `SfCalendar`.

## Step 1:
In initState(), set the default values for calendar view, custom text for the time label.

```xml
CalendarView _calendarView;
String _customTimeLabelText;
@override
void initState() {
  _calendarView = CalendarView.week;
  _customTimeLabelText='Cell';
  super.initState();
}
```

## Step 2:
Use the ‘timeRulerSize’ value as 0, to hide the time labels.

```xml
body: Column(
  children: <Widget>[
    Expanded(
      child: SfCalendar(
        view: _calendarView,
        timeSlotViewSettings: TimeSlotViewSettings(
          timeRulerSize: 0,
        ),
      ),
    ),
  ],
),
```
![time ruler size](http://www.syncfusion.com/uploads/user/kb/flut/flut-671/flut-671_img1.png)

## Step 3:
Assign the custom time label text to the `timeFormat` property of the `TimeSlotViewSettings` along with that you can add any time format data for dynamic values.

```xml
body: Column(
  children: <Widget>[
    Expanded(
      child: SfCalendar(
        view: _calendarView,
        dataSource: getCalendarDataSource(),
        timeSlotViewSettings: TimeSlotViewSettings(
          timelineAppointmentHeight: 500,
          timeRulerSize: 50,
          timeFormat: _customTimeLabelText + ' hh',
            timeTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
        ),
      ),
    ),
  ],
),
```
[View document in Syncfusion Flutter Knowledge base](https://www.syncfusion.com/kb/11008/how-to-customize-the-time-label-in-the-flutter-event-calendar-sfcalendar)

Screenshots

![day](http://www.syncfusion.com/uploads/user/kb/flut/flut-671/flut-671_img2.png)
![week](http://www.syncfusion.com/uploads/user/kb/flut/flut-671/flut-671_img3.png)
![workweek](http://www.syncfusion.com/uploads/user/kb/flut/flut-671/flut-671_img4.png)
![timeline](http://www.syncfusion.com/uploads/user/kb/flut/flut-671/flut-671_img5.png)

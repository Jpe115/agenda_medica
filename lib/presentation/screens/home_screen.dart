import 'package:flutter/material.dart';

import 'package:agenda/presentation/widgets/side_menu.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  static const name = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('TableCalendar - Basics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: TableCalendar(
          daysOfWeekHeight: 24,
          daysOfWeekStyle: const DaysOfWeekStyle(
            decoration: BoxDecoration(
              color: Colors.amber,
              //borderRadius: BorderRadius.horizontal(left: Radius.circular(11), right: Radius.circular(11))
              //shape: BoxShape.circle
              ),
            ),
          calendarStyle: const CalendarStyle(
            weekendTextStyle: TextStyle(color: Colors.red),
            outsideDaysVisible: false,
            cellMargin: EdgeInsets.all(5),
            rowDecoration: BoxDecoration(
              color: Color.fromARGB(255, 202, 197, 197),
            )
          ),
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true
          ),
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            // Use `selectedDayPredicate` to determine which day is currently selected.
            // If this returns true, then `day` will be marked as selected.
        
            // Using `isSameDay` is recommended to disregard
            // the time-part of compared DateTime objects.
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              // Call `setState()` when updating the selected day
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            }
          },
          onFormatChanged: (format) {
            // if (_calendarFormat != format) {
            //   // Call `setState()` when updating calendar format
            //   setState(() {
            //     _calendarFormat = format;
            //   });
            //}
          },
          onPageChanged: (focusedDay) {
            // No need to call `setState()` here
            _focusedDay = focusedDay;
          },
        ),
      ),
      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import '../../widgets/search_widget.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  bool isTextField = false;
  int selectedContainerIndex = 0; // Initially, Month view is selected
  String searchText = '';
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildContainer(
                    height * .9,
                    width,
                    'Today'.tr,
                    onPressed: () {},
                    index: 0,
                  ),
                  _buildContainer(
                    height * .9,
                    width * 1.5,
                    _selectedDate == null
                        ? 'selectDate'.tr
                        : _selectedDate!.toLocal().toString().split(' ')[0],
                    onPressed: () async {
                      DateTime? selected = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025),
                      );
                      if (selected != null) {
                        setState(() {
                          _selectedDate = selected;
                        });
                      }
                    },
                    index: 1,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isTextField = !isTextField;
                      });
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
            if (isTextField)
              SearchWidget(
                onClose: () {
                  setState(() {
                    isTextField = false;
                    searchText = '';
                  });
                },
                onSearch: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
              ),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                _buildLastRowContainer(height, width, 'month'.tr, 0),
                _buildLastRowContainer(height, width, 'week'.tr, 1),
                _buildLastRowContainer(height, width, 'day'.tr, 2),
              ],
            ),
            Expanded(
              child: _buildCalendarView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarView() {
    switch (selectedContainerIndex) {
      case 0:
        _calendarFormat = CalendarFormat.month;
        return _buildTableCalendar();
      case 1:
        return _buildWeekView();
      case 2:
        _calendarFormat = CalendarFormat.week;
        return _buildTableCalendar();
      default:
        _calendarFormat = CalendarFormat.month;
        return _buildTableCalendar();
    }
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      calendarFormat: _calendarFormat,
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        // Handle day selected
      },
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.deepPurple,
          shape: BoxShape.circle,
        ),
      ),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
      ),
    );
  }

  Widget _buildWeekView() {
    return DatePicker(
      DateTime.now(),
      daysCount: 7,
      onDateChange: (date) {
        // Handle week date selected
      },
    );
  }

  Widget _buildContainer(
    double height,
    double width,
    String text, {
    required VoidCallback onPressed,
    required int index,
  }) {
    return Container(
      height: height * 0.05,
      width: width * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildLastRowContainer(
    double height,
    double width,
    String text,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedContainerIndex = index;
        });
      },
      child: Container(
        height: height * 0.05,
        width: width * 0.2,
        decoration: BoxDecoration(
          color: selectedContainerIndex == index
              ? Colors.deepPurple
              : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: index == 0 ? const Radius.circular(20) : Radius.zero,
            bottomLeft: index == 0 ? const Radius.circular(20) : Radius.zero,
            topRight: index == 2 ? const Radius.circular(20) : Radius.zero,
            bottomRight: index == 2 ? const Radius.circular(20) : Radius.zero,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color:
                  selectedContainerIndex == index ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  final Function(DateTime, DateTime) onDaySelected;

  const CalendarWidget({super.key, required this.onDaySelected});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      calendarFormat: CalendarFormat.month,
      onDaySelected: onDaySelected,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
      ),
    );
  }
}

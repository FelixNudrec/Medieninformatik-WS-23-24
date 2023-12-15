import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SubjectScheduleWidget extends StatefulWidget {
  final String subjectName;
  final DateTime vorlesungDateTime;  // DateTime for Vorlesung
  final DateTime ubungDateTime;      // DateTime for Übung

  SubjectScheduleWidget({
    Key? key,
    required this.subjectName,
    required this.vorlesungDateTime,
    required this.ubungDateTime,
  }) : super(key: key);

  @override
  _SubjectScheduleWidgetState createState() => _SubjectScheduleWidgetState();
}

class _SubjectScheduleWidgetState extends State<SubjectScheduleWidget> {
  @override
  Widget build(BuildContext context) {
    bool isVorlesungToday = _isSameDate(widget.vorlesungDateTime, DateTime.now());
    bool isUbungToday = _isSameDate(widget.ubungDateTime, DateTime.now());

    return IntrinsicHeight( // This widget will give its children the same height
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children across the cross axis
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildDateTimeWidget('Vorlesung: ${_formatDateTime(widget.vorlesungDateTime)}', isVorlesungToday, Icons.school),
                SizedBox(height: 3), // Space between Vorlesung and Übung
                _buildDateTimeWidget('Übung: ${_formatDateTime(widget.ubungDateTime)}', isUbungToday, Icons.edit),
              ],
            ),
          ),
          SizedBox(width: 3),
          ElevatedButton(
            onPressed: () {
              // Implement your logic here
            },
            child: Text(widget.subjectName),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey[300],
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              elevation: 0,
              padding: EdgeInsets.zero, // Remove padding to allow the button to stretch
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeWidget(String text, bool isToday, IconData iconData) {
    return Container(
      color: isToday ? Colors.indigo : Colors.grey[300],
      child: Row(
        children: [
          Icon(iconData, color: isToday ? Colors.white : Colors.black), // Icon
          SizedBox(width: 8), // Space between icon and text
          Text(text, style: TextStyle(color: isToday ? Colors.white : Colors.black)),
        ],
      ),
    );
  }

  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String _formatDateTime(DateTime dateTime) {
    // Format the DateTime, e.g., '2023-12-10 10:00 AM'
    return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
  }
}
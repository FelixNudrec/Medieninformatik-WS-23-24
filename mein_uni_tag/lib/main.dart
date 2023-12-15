import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:intl/intl.dart';
import 'widgets.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Logo_TU_Dresden_small.svg/1200px-Logo_TU_Dresden_small.svg.png',
            width: 30,
            height: 30,
          ),
          title: Text('Mein Uni-Tag', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                // Logik für das Öffnen des Menüs hinzufügen
              },
            ),
          ],
          backgroundColor: Colors.indigo[900],
        ),
        body: SingleChildScrollView(
          child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: const AnalogClock(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${_getFormattedWeekday()}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 8),
                  Text('|', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 8),
                  Text(
                    '${_getFormattedDate()}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            SubjectScheduleWidget(subjectName: 'Physics',vorlesungDateTime: DateTime(2023, 12, 10, 10, 0),ubungDateTime: DateTime(2023, 12, 12, 14, 0)),
            SubjectScheduleWidget(subjectName: 'Mathe',vorlesungDateTime: DateTime(2023, 15, 10, 10, 0),ubungDateTime: DateTime(2023, 15, 12, 14, 0)),
          ],
        ),
        ),
      ),
    );
  }

  String _getFormattedWeekday() {
    return DateTime.now().toLocal().weekday.toString();
  }

  String _getFormattedDate() {
    return DateTime.now().toLocal().toString().split(' ')[0];
  }
}



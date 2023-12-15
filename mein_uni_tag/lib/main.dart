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
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Meine Kurse',
                          style: TextStyle(
                            color: Colors.indigo[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: '\nMatr.-Nr.: 123456789\n',
                          style: TextStyle(
                            color: Colors.black, // Farbe nach Bedarf ändern
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: 'Matr.-Nr.: 123456789',
                          style: TextStyle(
                            color: Colors.black, // Farbe nach Bedarf ändern
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 200, // Breite des Containers nach Bedarf ändern
                  height: 200, // Höhe des Containers nach Bedarf ändern
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: const AnalogClock(),
                  ),
                ),
              ],
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
            Align(
              alignment: Alignment.topLeft,
              child: RichText(
                text: TextSpan(
                  text: 'Meine Kurse',
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            SubjectScheduleWidget(subjectName: 'AUD',vorlesungDateTime: DateTime(2023, 12, 10, 10, 0),ubungDateTime: DateTime(2023, 12, 12, 14, 0)),
            SizedBox(height: 3),
            SubjectScheduleWidget(subjectName: 'Mathe',vorlesungDateTime: DateTime(2023, 15, 10, 10, 0),ubungDateTime: DateTime(2023, 15, 12, 14, 0)),
          ],
        ),
        ),
      ),
    );
  }

  String _getFormattedWeekday() {
    var now = DateTime.now();
    var formatter = DateFormat('EEEE');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  String _getFormattedDate() {
    return DateTime.now().toLocal().toString().split(' ')[0];
  }
}



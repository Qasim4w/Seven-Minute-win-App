import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../utils/app_colors.dart';
import '../hidve_database/existing_data.dart';


class Done extends StatefulWidget {
  String title;
  Done({required this.title});

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    final dataBox = Hive.box<DataModel>('dataBox');

    Map<DateTime, List<DataModel>> groupedEntries = {};

    for (var i = 0; i < dataBox.length; i++) {
      final entry = dataBox.getAt(i);
      final date = DateTime(entry!.date.year, entry.date.month, entry.date.day);

      if (groupedEntries.containsKey(date)) {
        groupedEntries[date]!.add(entry);
      } else {
        groupedEntries[date] = [entry];
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
          elevation: 1,
          title: Text(widget.title)),
      body: Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.blue, AppColors.lightgreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: groupedEntries.length,
          itemBuilder: (context, index) {
            final date = groupedEntries.keys.elementAt(index);
            final entries = groupedEntries[date]!;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionPanelList(

                elevation: 1,
                expandedHeaderPadding: EdgeInsets.all(0),

                expansionCallback: (int panelIndex, bool isExpanded) {
                  // Toggle the expansion state of the corresponding DataModel
                  setState(() {
                    entries[index].isExpanded = !isExpanded;
                  });
                },
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(
                          '${date.year}-${date.month}-${date.day}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    body: Column(
                      children: entries.map((entry) {
                        return ListTile(
                          title: Text('Minutes: ${entry.minutes}, Seconds: ${entry.seconds}'),
                          subtitle: Text(
                              'Start: ${entry.startTime.hour}:${entry.startTime.minute}, End: ${entry.endTime.hour}:${entry.endTime.minute}'),
                        );
                      }).toList(),
                    ),
                    isExpanded: true,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTimeRange _dateTimeRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Toplam Gün Sayısı"),
            Text("${_dateTimeRange.duration.inDays}"),
            const SizedBox(
              height: 10,
            ),
            const Text("Başlangıç tarihi"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${_dateTimeRange.start.day} / "),
                Text("${_dateTimeRange.start.month} / "),
                Text("${_dateTimeRange.start.year}"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Bitiş Tarihi tarihi"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${_dateTimeRange.end.day} / "),
                Text("${_dateTimeRange.end.month} / "),
                Text("${_dateTimeRange.end.year}"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  final DateTimeRange? rangeTime = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2070));
                  if (rangeTime != null) {
                    setState(() {
                      _dateTimeRange = rangeTime;
                    });
                  }
                },
                child: const Text("Show Date Picker"))
          ],
        ),
      ),
    );
  }
}

import 'package:dotted_border/dotted_border.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WorkoutReport extends StatefulWidget {
  const WorkoutReport({Key? key}) : super(key: key);

  @override
  State<WorkoutReport> createState() => _WorkoutReportState();
}

class _WorkoutReportState extends State<WorkoutReport> with TickerProviderStateMixin {
  List<Map<String, dynamic>> dates = [
    {
      'date': '1',
      'day': 'Mon',
    },
    {
      'date': '2',
      'day': 'Tue',
    },
    {
      'date': '3',
      'day': 'Wed',
    },
    {
      'date': '4',
      'day': 'Thu',
    },
    {
      'date': '5',
      'day': 'Fri',
    },
    {
      'date': '6',
      'day': 'Sat',
    },
    {
      'date': '7',
      'day': 'Sun',
    },
  ];

  late final TabController _controller = TabController(
    length: 4,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 15, 15, 15),
        body: Column(
          children: [
            Container(
              height: 160,
              width: double.infinity,
              margin: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hi,Ducky',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      Icon(
                        Icons.calendar_today,
                        size: 18,
                      ),
                    ],
                  ),
                  dateCapsules(),
                  const Text(
                    'Today\'s Report',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              indicatorColor: Colors.transparent,
              labelPadding: EdgeInsets.zero,
              unselectedLabelColor: Colors.grey,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              controller: _controller,
              tabs: [
                DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    color: Colors.grey.shade800,
                    dashPattern: const [3, 3],
                    child: rotatedTabBars('New Report', Icons.add_circle)),
                rotatedTabBars('Calories', Icons.local_fire_department),
                rotatedTabBars('Workout', Icons.fitness_center),
                rotatedTabBars('Heart Rate', Icons.favorite),
              ],
            ),
            Container(
              height: 280,
              color: Colors.black,
              child: TabBarView(
                controller: _controller,
                children: [
                  lineChartReports(),
                  const Center(child: Text('one')),
                  const Center(child: Text('two')),
                  const Center(
                    child: Text('three'),
                  ),
                  // const Center(
                  //   child: Text('four'),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dateCapsules() => SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          final date = dates[index];
          return Container(
            width: 50,
            height: 70,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
                bottom: Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  date['date'],
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                Text(
                  date['day'],
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }),
        itemCount: dates.length,
      ));

  Widget rotatedTabBars(String text, IconData icon) {
    return RotatedBox(
      quarterTurns: 3,
      child: Container(
        height: 60,
        width: 135,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon),
            Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lineChartReports() => LineChart(
        LineChartData(
          minX: 0,
          minY: 0,
          maxX: 10,
          maxY: 12,
        ),
      );
}

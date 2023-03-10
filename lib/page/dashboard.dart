import 'package:flutter/material.dart';

import '../components/mission.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    debugPrint('Dashboard run');
    final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F'];
    final List<int> colorCodes = <int>[600, 500, 400, 300, 200, 100];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Mission(
                title: entries[index],
                color: colorCodes[index],
              ),
              onTap: () => {
                debugPrint("Hello test ${entries[index]}")
              }
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wrkt_ctrl/view/home/widgets/logo.dart';

import '../widgets/calendar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Expanded(flex: 1, child: SizedBox()),
          Logo('wrkt_ctrl'),
          Calendar(),
          Expanded(flex: 2, child: SizedBox()),
        ],
      ),
    );
  }
}

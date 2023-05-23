import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app_colors.dart';
import '../../../app_styles.dart';
import '../../../providers/navigation_provider.dart';

class AddRoutineSummaryPage extends ConsumerWidget {
  const AddRoutineSummaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(
          height: 28,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 38),
          child: TextField(
            maxLength: 30,
            style: TextStyle(color: Color(AppColors.lightGrey)),
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: 'Routine name',
              labelStyle: TextStyle(color: Color(AppColors.lightGrey)),
              counterText: '',
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 38),
          child: TextField(
            maxLength: 120,
            maxLines: 3,
            style: TextStyle(color: Color(AppColors.lightGrey)),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              labelText: 'Routine description',
              labelStyle: TextStyle(color: Color(AppColors.lightGrey)),
              counterText: '',
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Rest time: 0 sec',
              style: AppStyles.smallText,
            ),
            Text(
              'Circuits: 0',
              style: AppStyles.smallText,
            ),
          ],
        ),
        const Expanded(
          child: Center(child: Text('List of exercises placeholder')),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(addRoutineIndexProvider.notifier).state = 0;
                },
                child: Text(
                  'Previous page',
                  style: AppStyles.button,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Add routine',
                  style: AppStyles.button,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

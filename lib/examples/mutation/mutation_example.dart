import 'package:flutter/material.dart';

import '../../schemas/moon_high_way/generated/moon_high_way.schema.graphql.dart';

class MutationExample extends StatelessWidget {
  MutationExample({super.key});

  final ValueNotifier<EnumLiftStatus> liftStatus = ValueNotifier(
    EnumLiftStatus.OPEN,
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: liftStatus,
      // TODO(Task2-4): Define Query Widget
      builder: (context, value, __) => const SizedBox.shrink(),
    );
  }
}

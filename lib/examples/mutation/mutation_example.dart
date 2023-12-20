import 'package:flutter/material.dart';
import 'package:graphql_demo/schemas/moon_high_way/operations/gql_operations.dart';
// import 'package:graphql_demo/utils/extensions.dart';
// import 'package:graphql_demo/values/app_client.dart';
// import 'package:graphql_demo/widgets/gql_error.dart';
// import 'package:graphql_demo/widgets/gql_loading.dart';
// import 'package:graphql_demo/widgets/gql_no_data.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
//
// import 'widgets/lift_tile.dart';
// import 'widgets/lifts_list_view.dart';

class MutationExample extends StatelessWidget {
  MutationExample({super.key});

  final ValueNotifier<EnumLiftStatus> liftStatus = ValueNotifier(
    EnumLiftStatus.OPEN,
  );

  @override
  Widget build(BuildContext context) {
    // TODO(TASK:2-2): Provide GraphQL Client
    return ValueListenableBuilder(
      valueListenable: liftStatus,
      // TODO(TASK:2-3): Define Query Widget
      builder: (context, value, __) => const SizedBox.shrink(),
    );
  }
}

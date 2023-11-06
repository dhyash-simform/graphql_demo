import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../values/app_client.dart';

class MutationExample extends StatelessWidget {
  MutationExample({super.key});

  final ValueNotifier<String> selectedStatus = ValueNotifier('OPEN');

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: AppClient.moonHighwayClient,
      child: ValueListenableBuilder(
        valueListenable: selectedStatus,
        // TODO(gql-2-2): Define Query Widget
        builder: (context, value, __) => const SizedBox(),
      ),
    );
  }
}

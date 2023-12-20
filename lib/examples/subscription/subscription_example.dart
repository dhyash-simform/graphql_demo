import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_demo/schemas/moon_high_way/operations/gql_operations.dart';
import 'package:graphql_demo/values/app_apis.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SubscriptionExample extends StatelessWidget {
  const SubscriptionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(
        GraphQLClient(
          link: WebSocketLink(AppApis.moonHighWayApiSubscription),
          cache: GraphQLCache(),
        ),
      ),
      child: Subscription(
        options: OptionsSubscriptionOnChangeStatus(),
        builder: (result) {
          if (result.isLoading && result.parsedData == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (result.hasException) {
            log('${result.exception}', name: 'Exception');
            return Center(
              child: Text('Error: ${result.exception}'),
            );
          } else {
            if (result.parsedData == null) {
              return const Center(
                child: Text('No Data'),
              );
            }
            return Center(
              child: Text(
                result.parsedData?.liftStatusChange?.toJson().toString() ?? '',
              ),
            );
          }
        },
      ),
    );
  }
}

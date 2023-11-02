import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../utils/gql_subscription.dart';
import '../../values/app_client.dart';

class SubscriptionExample extends StatelessWidget {
  const SubscriptionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription'),
      ),
      body: GraphQLProvider(
        client: AppClient.moonHighwaySubClient,
        child: Subscription(
          options: SubscriptionOptions(
            document: gql(GqlSubscription.liftStatusChange),
          ),
          onSubscriptionResult: (subscriptionResult, client) {
            print(subscriptionResult);
          },
          builder: (result) {
            if (result.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (result.hasException) {
              log('Error: ${result.exception}', name: 'GQL SUBSCRIPTION');
              return const Center(
                child: Text('Service Unavailable'),
              );
            }

            print(result.data);

            if (result.data == null) {
              return const Center(
                child: Text('No Data Changed'),
              );
            }

            return ResultAccumulator.appendUniqueEntries(
              latest: result.data,
              builder: (context, {results}) => Text('Result: ${result.data}'),
            );
          },
        ),
      ),
    );
  }
}

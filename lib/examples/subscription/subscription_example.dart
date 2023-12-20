import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_demo/examples/subscription/widgets/lift_card.dart';
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
          link: Link.from([
            WebSocketLink(
              AppApis.moonHighWayApiSubscription,
            ),
          ]),
          cache: GraphQLCache(),
        ),
      ),
      child: Subscription(
        options: SubscriptionOptions(
          parserFn: (data) => SubscriptionOnChangeStatusliftStatusChange(
            id: data['liftStatusChange']['id'] as String,
            name: data['liftStatusChange']['name'] as String,
            status: fromJsonEnumLiftStatus(
              data['liftStatusChange']['status'] as String,
            ),
          ),
          document: gql(
            '''
            subscription OnChangeStatus {
                liftStatusChange{
                    id
                    name
                    status
                }
            }
          ''',
          ),
        ),
        onSubscriptionResult: (subscriptionResult, client) {
          print(subscriptionResult);
        },
        builder: (result) {
          if (result.isLoading && result.data == null) {
            if (result.data == null) {
              return const Center(
                child: Text('No Data'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (result.hasException) {
            log('${result.exception}', name: 'Exception');
            return Center(
              child: Text('Error: ${result.exception}'),
            );
          } else {
            if (result.data == null) {
              return const Center(
                child: Text('No Data'),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(20),
              child: LiftCard(
                liftName: result.parsedData?.name ?? '-',
                liftStatus: toJsonEnumLiftStatus(
                  result.parsedData?.status ?? EnumLiftStatus.CLOSED,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

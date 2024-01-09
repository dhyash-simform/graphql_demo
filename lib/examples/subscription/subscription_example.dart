import 'package:flutter/material.dart';
import 'package:graphql_demo/examples/subscription/widgets/lift_card.dart';
import 'package:graphql_demo/schemas/moon_high_way/operations/gql_operations.dart';
import 'package:graphql_demo/values/app_client.dart';
import 'package:graphql_demo/widgets/gql_error.dart';
import 'package:graphql_demo/widgets/gql_no_data.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SubscriptionExample extends StatelessWidget {
  const SubscriptionExample({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(TASK:3-2): Provide GraphQL Client
    // TODO(TASK:3-3): Define Subscription Widget
    return GraphQLProvider(
      client: AppClient.moonHighwaySubscriptionClient,
      child: Subscription(
        //TODO: Provide Subscription Options Options here
        options: SubscriptionOptions(
          //TODO(Task3: 3-1): Provide parserFn
          parserFn: (data) {
            final listStatusChange = data['liftStatusChange'] as Map?;
            if (listStatusChange == null) return null;
            return SubscriptionOnChangeStatusliftStatusChange(
              id: listStatusChange['id'] as String,
              name: listStatusChange['name'] as String,
              status: fromJsonEnumLiftStatus(
                listStatusChange['status'] as String,
              ),
            );
          },
          //TODO: Provide Subscription query here
          document: gql(
            '''
             subscription {
               liftStatusChange{
                id
                name
                status
              }
            }
             ''',
          ),
        ),
        builder: (result) {
          if (result.isLoading && result.parsedData == null) {
            return const GqlNoData();
          } else if (result.hasException) {
            return GqlError(error: result.exception.toString());
          } else {
            if (result.parsedData == null) {
              return const GqlNoData();
            }
            return LiftCard(
              liftName: result.parsedData?.name ?? '-',
              liftStatus: toJsonEnumLiftStatus(
                result.parsedData?.status ?? EnumLiftStatus.CLOSED,
              ),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:graphql_demo/schemas/moon_high_way/operations/gql_operations.dart';
import 'package:graphql_demo/utils/extensions.dart';
import 'package:graphql_demo/values/app_client.dart';
import 'package:graphql_demo/widgets/gql_error.dart';
import 'package:graphql_demo/widgets/gql_loading.dart';
import 'package:graphql_demo/widgets/gql_no_data.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'widgets/lift_tile.dart';
import 'widgets/lifts_list_view.dart';

class MutationExample extends StatelessWidget {
  MutationExample({super.key});

  final ValueNotifier<EnumLiftStatus> liftStatus = ValueNotifier(
    EnumLiftStatus.OPEN,
  );

  @override
  Widget build(BuildContext context) {
    // TODO(TASK:2-2): Provide GraphQL Client
    return GraphQLProvider(
      client: AppClient.moonHighwayClient,
      child: ValueListenableBuilder(
        valueListenable: liftStatus,
        // TODO(TASK:2-3): Define Query Widget
        builder: (context, value, __) => Query(
          options: OptionsQueryGetLifts(
            variables: VariablesQueryGetLifts(status: value),
          ),
          builder: (result, {fetchMore, refetch}) {
            //TODO: Handle different states: Loading, Error, No Data, Has Data
            if (result.isLoading && result.parsedData == null) {
              return const GqlLoading();
            } else if (result.hasException) {
              return GqlError(error: result.exception.toString());
            } else {
              if (result.parsedData == null) {
                return const GqlNoData();
              }

              final response = result.parsedData!.allLifts;

              return LiftsListView(
                onRefresh: () async => refetch?.call(),
                currentValue: value,
                statusNotifier: liftStatus,
                onTabChange: (status) => refetch?.call(),
                itemCount: response.length,
                onItemBuild: (index) {
                  final lift = response[index];
                  // TODO(Task2:4): Define Mutate Widget
                  return Mutation(
                    options: OptionsMutationUpdateLiftStatus(
                      variables: VariablesMutationUpdateLiftStatus(
                        id: lift.id,
                        status: lift.status ?? value,
                      ),
                    ),
                    builder: (runMutation, result) => LiftTile(
                      onSelected: (status) {
                        // TODO(Task2:5): Perform Mutation
                        runMutation(
                          VariablesMutationUpdateLiftStatus(
                            id: lift.id,
                            status: status,
                          ).toJson(),
                          optimisticResult: MutationUpdateLiftStatus(
                            setLiftStatus:
                                MutationUpdateLiftStatussetLiftStatus(
                              id: lift.id,
                              name: lift.name,
                              status: status,
                            ),
                          ),
                        );
                      },
                      name: lift.name,
                      status: (lift.status ?? EnumLiftStatus.OPEN).toEnumString,
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

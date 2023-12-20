import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_demo/schemas/moon_high_way/operations/gql_operations.dart';
import 'package:graphql_demo/utils/extensions.dart';
import 'package:graphql_demo/values/app_client.dart';
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
    return GraphQLProvider(
      client: AppClient.moonHighwayClient,
      child: ValueListenableBuilder(
        valueListenable: liftStatus,
        builder: (context, value, __) => Query(
          options: OptionsQueryGetLifts(
            variables: VariablesQueryGetLifts(
              status: value,
            ),
            // fetchPolicy: FetchPolicy.cacheOnly,
            // pollInterval: Duration(seconds: 1),
          ),
          builder: (result, {fetchMore, refetch}) {
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

              final response = result.parsedData!.allLifts;

              return LiftsListView(
                onRefresh: () async => refetch?.call(),
                currentValue: value,
                statusNotifier: liftStatus,
                onTabChange: (status) => refetch?.call(),
                itemCount: response.length,
                onItemBuild: (index) {
                  final lift = response[index];
                  return Mutation(
                    options: OptionsMutationUpdateLiftStatus(
                      variables: VariablesMutationUpdateLiftStatus(
                        id: lift.id,
                        status: lift.status ?? EnumLiftStatus.OPEN,
                      ),
                    ),
                    builder: (runMutation, result) => LiftTile(
                      onSelected: (status) {
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

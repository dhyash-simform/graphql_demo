import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_demo/utils/extensions.dart';
import 'package:graphql_demo/values/app_client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../schemas/moon_high_way/generated/moon_high_way.schema.graphql.dart';
import '../../schemas/moon_high_way/mutation/generated/update_lift_status.mutation.graphql.dart';
import '../../schemas/moon_high_way/query/generated/lifts.query.graphql.dart';
import 'widgets/lift_tile.dart';
import 'widgets/lift_view.dart';

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
        builder: (context, value, __) => QueryGetLiftsWidget(
          options: OptionsQueryGetLifts(
            variables: VariablesQueryGetLifts(
              status: value,
            ),
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

              return LiftView(
                onRefresh: () async => refetch?.call(),
                currentValue: value,
                statusNotifier: liftStatus,
                onTabChange: (status) => refetch?.call(),
                itemCount: response.length,
                onItemBuild: (index) => MutationUpdateLiftStatusWidget(
                  options: WidgetOptionsMutationUpdateLiftStatus(),
                  builder: (runMutation, result) => LiftTile(
                    onSelected: (status) {
                      runMutation(
                        optimisticResult: MutationUpdateLiftStatus(
                          setLiftStatus: MutationUpdateLiftStatussetLiftStatus(
                            id: response[index].id,
                            name: response[index].name,
                            status: status,
                          ),
                        ),
                        VariablesMutationUpdateLiftStatus(
                          id: response[index].id,
                          status: status,
                        ),
                      );
                    },
                    name: response[index].name,
                    status: (response[index].status ?? EnumLiftStatus.OPEN)
                        .toEnumString,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

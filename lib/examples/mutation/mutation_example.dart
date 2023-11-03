import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../model/lift.dart';
import '../../utils/gql_mutation.dart';
import '../../utils/gql_query.dart';
import '../../values/app_client.dart';
import '../../values/app_colors.dart';
import '../../widgets/gradient_background.dart';
import 'widgets/lift_tile.dart';

class MutationExample extends StatelessWidget {
  MutationExample({super.key});

  final ValueNotifier<String> selectedStatus = ValueNotifier('OPEN');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text(
          'Mutation',
          style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      body: GradientBackground(
        child: GraphQLProvider(
          client: AppClient.moonHighwayClient,
          child: ValueListenableBuilder(
            valueListenable: selectedStatus,
            builder: (context, value, __) {
              return Query(
                options: QueryOptions(
                  document: gql(GqlQuery.lifts),
                  variables: {'status': value},
                  parserFn: (data) {
                    return (data['allLifts'] as List<dynamic>)
                        .map((e) => Lift.fromJson(e as Map<String, dynamic>))
                        .toList();
                  },
                ),
                builder: (result, {fetchMore, refetch}) {
                  if (result.isLoading && result.parsedData == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (result.hasException) {
                    log(
                      'Error: ${result.exception}',
                      name: 'Moon High Way Query',
                    );
                    return Center(
                      child: Text('Error: ${result.exception}'),
                    );
                  }

                  if (result.parsedData == null) {
                    return const Center(
                      child: Text('No Lifts'),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () async => refetch!(),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: ValueListenableBuilder(
                            valueListenable: selectedStatus,
                            builder: (_, value, __) {
                              return SegmentedButton<String>(
                                selectedIcon: const Icon(
                                  Icons.circle_rounded,
                                  color: AppColors.pink,
                                ),
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                segments: const [
                                  ButtonSegment(
                                    value: 'OPEN',
                                    label: Text(
                                      'OPEN',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  ButtonSegment(
                                    value: 'CLOSED',
                                    label: Text(
                                      'CLOSED',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  ButtonSegment(
                                    value: 'HOLD',
                                    label: Text(
                                      'HOLD',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                                selected: {value},
                                onSelectionChanged: (value) {
                                  selectedStatus.value = value.first;
                                  fetchMore!(
                                    FetchMoreOptions(
                                      variables: {
                                        'status': selectedStatus.value,
                                      },
                                      updateQuery: (
                                        previousResultData,
                                        fetchMoreResultData,
                                      ) =>
                                          fetchMoreResultData ??
                                          previousResultData,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: result.parsedData?.length ?? 0,
                          padding: const EdgeInsets.all(20),
                          itemBuilder: (_, index) {
                            final lift = result.parsedData![index];
                            return Mutation(
                              options: MutationOptions(
                                document: gql(GqlMutation.setLiftStatus),
                              ),
                              builder: (runMutation, mutationResult) {
                                if (mutationResult?.hasException ?? false) {
                                  log(
                                    'Error: ${mutationResult?.exception}',
                                    name: 'Mutation',
                                  );
                                }

                                if (mutationResult?.data != null) {
                                  log(
                                    'Data: ${mutationResult?.data}',
                                    name: 'Mutation',
                                  );
                                }
                                return LiftTile(
                                  lift: lift,
                                  onSelected: (value) => runMutation(
                                    optimisticResult: {
                                      'data': {
                                        'setLiftStatus': {
                                          'id': lift.id,
                                          'name': lift.name,
                                          'status': value,
                                        },
                                      },
                                    },
                                    {'id': lift.id, 'status': value},
                                  ),
                                );
                              },
                            );
                          },
                          separatorBuilder: (_, __) => const SizedBox(
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

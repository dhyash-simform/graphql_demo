import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_demo/examples/mutation/widgets/lift_tile.dart';
import 'package:graphql_demo/utils/gql_mutation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../model/lift.dart';
import '../../utils/gql_query.dart';
import '../../values/app_client.dart';

class MutationExample extends StatelessWidget {
  const MutationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mutation'),
      ),
      body: GraphQLProvider(
        client: AppClient.moonHighwayClient,
        child: Query(
          options: QueryOptions(
            document: gql(GqlQuery.lifts),
            variables: const {
              'status': 'OPEN',
            },
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
              log('Error: ${result.exception}', name: 'Moon High Way Query');
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
              child: ListView.separated(
                itemCount: result.parsedData?.length ?? 0,
                padding: const EdgeInsets.all(20),
                itemBuilder: (_, index) => Mutation(
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
                      lift: result.parsedData![index],
                      onSelected: (id, value) => runMutation(
                        {'id': id, 'status': value},
                      ),
                    );
                  },
                ),
                separatorBuilder: (_, __) => const SizedBox(
                  height: 20,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

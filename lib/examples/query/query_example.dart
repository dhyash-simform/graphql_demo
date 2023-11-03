import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../model/base_response.dart';
import '../../model/character.dart';
import '../../utils/gql_query.dart';
import '../../values/app_client.dart';
import '../../values/app_colors.dart';
import '../../widgets/gradient_background.dart';
import 'widgets/character_tile.dart';

class QueryExample extends StatelessWidget {
  const QueryExample({super.key});

  static const charactersListView = PageStorageKey('characters');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Query',
          style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                color: Colors.white,
              ),
        ),
        backgroundColor: AppColors.black,
      ),
      body: GradientBackground(
        // TODO(Task-4): Perform fetching query and display on screen
        child: GraphQLProvider(
          client: AppClient.rickAndMortyClient,
          child: Query(
            options: QueryOptions(
              /// pass here the query you want to perform
              document: gql(GqlQuery.characters),

              /// at a time of querying
              ///
              /// is there any argument you have to pass
              /// then pass it here
              variables: const {'page': 1},

              /// To convert incoming data
              parserFn: (data) => BaseResponse<List<Character>>.fromJson(
                data['characters'] as Map<String, dynamic>,
                (p0) => (p0! as List<dynamic>)
                    .map((e) => Character.fromJson(e as Map<String, dynamic>))
                    .toList(),
              ),
            ),
            builder: (result, {fetchMore, refetch}) {
              if (result.isLoading && result.parsedData == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (result.hasException) {
                log('Error: ${result.exception}', name: 'Character Query');
                return Center(
                  child: Text('Error: ${result.exception}'),
                );
              }

              if (result.parsedData == null) {
                return const Center(
                  child: Text('No Characters'),
                );
              }

              return ListView(
                key: charactersListView,
                children: [
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 8 / 10,
                    ),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(20),
                    itemCount: result.parsedData?.results.length,
                    itemBuilder: (_, index) {
                      final character = result.parsedData!.results[index];
                      return CharacterTile(
                        character: character,
                      );
                    },
                  ),
                  // TODO(Task-5-1): Implements Pagination Func.
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

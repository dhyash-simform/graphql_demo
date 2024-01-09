import 'package:flutter/material.dart';
import 'package:graphql_demo/schemas/rick_any_morty/operations/generated/characters.query.graphql.dart';
import 'package:graphql_demo/values/app_client.dart';
import 'package:graphql_demo/widgets/gql_error.dart';
import 'package:graphql_demo/widgets/gql_loading.dart';
import 'package:graphql_demo/widgets/gql_no_data.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../schemas/rick_any_morty/operations/gql_operations.dart';
import 'widgets/characters_list_view.dart';

class QueryExample extends StatelessWidget {
  const QueryExample({super.key});

  static const charactersListView = PageStorageKey('characters');

  @override
  Widget build(BuildContext context) {
    // TODO(TASK:1-2): Provide GraphQL Client
    // TODO(TASK:1-3): Define Query Widget
    return GraphQLProvider(
      client: AppClient.rickAndMortyClient,
      child: Query(
        //TODO: Provide Query Options here
        options: OptionsQueryGetCharacters(
          variables: VariablesQueryGetCharacters(page: 0),
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

            final response = result.parsedData!.characters;

            return CharactersListView(
              charactersView: charactersListView,
              itemCount: response?.results?.length ?? 0,
              onItemBuild: (index) => (
                response?.results?[index]?.image,
                response?.results?[index]?.name,
              ),
              fetchMore: response?.page?.next == null
                  ? const SizedBox.shrink()
                  : result.isLoading
                      ? const CircularProgressIndicator()
                      : FilledButton(
                          //TODO(Task1:3): Pagination
                          onPressed: () => fetchMore?.call(
                            FetchMoreOptionsQueryGetCharacters(
                              variables: VariablesQueryGetCharacters(
                                page: response?.page?.next ?? 1,
                              ),
                              updateQuery: (previousData, data) {
                                final previousCharacters =
                                    previousData!['characters']['results'];

                                final fetchMoreCharacters =
                                    data!['characters']['results'];

                                final characters = <dynamic>[
                                  ...previousCharacters as List<dynamic>,
                                  ...fetchMoreCharacters as List<dynamic>,
                                ];

                                data['characters']['results'] = characters;

                                return data;
                              },
                            ),
                          ),
                          child: const Text('Fetch More'),
                        ),
            );
          }
        },
      ),
    );
  }
}

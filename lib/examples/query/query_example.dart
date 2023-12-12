import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../schemas/rick_any_morty/operations/gql_operations.dart';
import '../../values/app_client.dart';
import 'widgets/characters_list_view.dart';

class QueryExample extends StatelessWidget {
  const QueryExample({super.key});

  static const charactersListView = PageStorageKey('characters');

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: AppClient.rickAndMortyClient,
      child: Query(
        options: OptionsQueryGetCharacters(
          variables: VariablesQueryGetCharacters(
            page: 0,
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
                          onPressed: () => fetchMore?.call(
                            FetchMoreOptionsQueryGetCharacters(
                              variables: VariablesQueryGetCharacters(
                                page: response?.page?.next ?? 1,
                              ),
                              updateQuery: (previousData, currentData) {
                                final previousCharacters =
                                    previousData!['characters']['results'];

                                final fetchMoreCharacters =
                                    currentData!['characters']['results'];

                                final characters = <dynamic>[
                                  ...previousCharacters as List<dynamic>,
                                  ...fetchMoreCharacters as List<dynamic>,
                                ];

                                currentData['characters']['results'] =
                                    characters;

                                return currentData;
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

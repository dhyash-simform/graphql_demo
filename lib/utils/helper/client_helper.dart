import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class ClientHelper {
  static ValueNotifier<GraphQLClient> configClient({required String url}) {
    final client = GraphQLClient(
      link: HttpLink(url),
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
    return ValueNotifier(client);
  }
}

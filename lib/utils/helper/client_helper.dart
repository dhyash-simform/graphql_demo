import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class ClientHelper {
  static ValueNotifier<GraphQLClient> configClient({required String url}) {
    final graphQLClient = GraphQLClient(
      link: HttpLink('https://$url'),
      cache: GraphQLCache(),
      defaultPolicies: DefaultPolicies(
        query: Policies(
          fetch: FetchPolicy.cacheAndNetwork,
        ),
      ),
    );
    return ValueNotifier(graphQLClient);
  }

  static ValueNotifier<GraphQLClient> configSubClient({required String url}) {
    final graphQLClient = GraphQLClient(
      link: Link.split(
        (request) => false,
        WebSocketLink('wss://$url/graphql'),
        HttpLink('https://$url'),
      ),
      cache: GraphQLCache(),
      defaultPolicies: DefaultPolicies(
        query: Policies(
          fetch: FetchPolicy.cacheAndNetwork,
        ),
      ),
    );
    return ValueNotifier(graphQLClient);
  }
}

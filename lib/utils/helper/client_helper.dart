import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class ClientHelper {
  const ClientHelper._();

  static ValueNotifier<GraphQLClient> configClient({required String url}) {
    final client = GraphQLClient(
      /// HttpLink, AuthLink, Others
      ///
      /// HttpLink: used for simple apis
      /// AuthLink: used for if you want to attach token for authentication
      link: HttpLink(url),
      cache: GraphQLCache(),
    );
    return ValueNotifier(client);
  }

  static ValueNotifier<GraphQLClient> configSubscriptionClient({
    required String subscriptionUrl,
  }) {
    final client = GraphQLClient(
      link: Link.from([WebSocketLink(subscriptionUrl)]),
      cache: GraphQLCache(),
    );
    return ValueNotifier(client);
  }
}

import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class ClientHelper {
  const ClientHelper._();

  static ValueNotifier<GraphQLClient> create({required String url}) {
    final client = GraphQLClient(link: HttpLink(url), cache: GraphQLCache());
    return ValueNotifier(client);
  }
}

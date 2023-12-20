import 'package:graphql_demo/utils/helper/client_helper.dart';
import 'package:graphql_demo/values/app_apis.dart';

class AppClient {
  const AppClient._();

  static final rickAndMortyClient = ClientHelper.create(
    url: AppApis.rickAndMortyApi,
  );

  static final moonHighwayClient = ClientHelper.create(
    url: AppApis.moonHighWayApi,
  );
}

import 'package:graphql_demo/utils/helper/client_helper.dart';
import 'package:graphql_demo/values/app_apis.dart';

class AppClient {
  static final rickAndMortyClient = ClientHelper.configClient(
    url: AppApis.rickAndMortyApi,
  );

  static final moonHighwayClient = ClientHelper.configClient(
    url: AppApis.moonHighWayApi,
  );
}

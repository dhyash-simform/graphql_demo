import '../utils/helper/client_helper.dart';
import 'app_apis.dart';

class AppClient {
  static final moonHighwayClient = ClientHelper.configClient(
    url: Apis.moonHighWayApi,
  );
  static final rickAndMortyClient = ClientHelper.configClient(
    url: Apis.rickAndMortyApi,
  );
}

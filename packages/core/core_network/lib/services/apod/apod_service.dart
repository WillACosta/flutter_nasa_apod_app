import 'package:core_dependencies/chopper.dart';

import '../../infra/infra.dart';
import 'apod.dart';
import 'constants/constants.dart';

part 'apod_service.chopper.dart';

@ChopperApi(baseUrl: ApodServiceConstants.apodEndpoint)
abstract class ApodService extends ChopperService {
  static ApodService create(HttpClientApp client) {
    return _$ApodService(client);
  }

  @Get()
  @FactoryConverter(response: mapResponseToNetworkMedia)
  AsyncResponseOf<NetworkMedia> getMediaOfTheDay();

  @Get()
  @FactoryConverter(response: mapResponseToListNetworkMedia)
  AsyncResponseOf<List<NetworkMedia>> getMedias(
    @Query('count') int count,
  );
}

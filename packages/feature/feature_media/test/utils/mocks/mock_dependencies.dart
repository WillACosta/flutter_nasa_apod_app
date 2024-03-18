import 'package:core_network/core_network.dart';
import 'package:feature_core/feature_core.dart';
import 'package:feature_media/feature_media.dart';
import 'package:mocktail/mocktail.dart';

class MockApodRepository extends Mock implements ApodRepository {}

class MockConvertDateTimeUseCase extends Mock
    implements ConvertDateTimeUseCase {}

class MockApodService extends Mock implements ApodService {}

class MockApodLocalRepository extends Mock implements ApodLocalRepository {}

class MockNetworkActivityService extends Mock
    implements NetworkActivityService {}

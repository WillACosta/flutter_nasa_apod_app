// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apod_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ApodService extends ApodService {
  _$ApodService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApodService;

  @override
  Future<Response<NetworkMedia>> getMediaOfTheDay() {
    final Uri $url = Uri.parse('/apod');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<NetworkMedia, NetworkMedia>(
      $request,
      responseConverter: mapResponseToNetworkMedia,
    );
  }

  @override
  Future<Response<List<NetworkMedia>>> getMedias(int count) {
    final Uri $url = Uri.parse('/apod');
    final Map<String, dynamic> $params = <String, dynamic>{'count': count};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<NetworkMedia>, NetworkMedia>(
      $request,
      responseConverter: mapResponseToListNetworkMedia,
    );
  }
}

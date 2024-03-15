import 'package:core_network/core_network.dart';
import 'package:feature_media/domain/models/models.dart';

extension MediaMapper on NetworkMedia {
  DomainMedia toDomain() {
    return DomainMedia(
      title: title,
      description: explanation,
      type: MediaType.parse(mediaType).getOrThrow(),
      dateTime: DateTime.parse(date),
      urls: MediaUrl(
        hdUrl: hdUrl,
        defaultUrl: url,
      ),
      isImage: mediaType == 'image',
    );
  }
}

extension ListMediaMapper on List<NetworkMedia> {
  List<DomainMedia> toDomain() {
    return List.from(map((e) => e.toDomain()));
  }
}

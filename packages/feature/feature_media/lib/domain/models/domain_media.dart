import 'package:core_dependencies/equatable.dart';
import 'package:core_dependencies/result.dart';

enum MediaType {
  image,
  video;

  static Result<MediaType, String> parse(String value) {
    return switch (value.toLowerCase()) {
      'image' => MediaType.image.toSuccess(),
      'video' => MediaType.video.toSuccess(),
      _ => "Invalid value: $value".toFailure(),
    };
  }
}

class MediaUrl extends Equatable {
  final String? hdUrl;
  final String defaultUrl;

  const MediaUrl({
    required this.hdUrl,
    required this.defaultUrl,
  });

  @override
  List<Object?> get props => [
        hdUrl,
        defaultUrl,
      ];
}

class DomainMedia extends Equatable {
  final String title;
  final String description;
  final MediaType type;
  final bool isImage;
  final DateTime dateTime;
  final String? localDate;
  final MediaUrl urls;
  final String? copyright;

  const DomainMedia({
    required this.title,
    required this.description,
    required this.type,
    required this.dateTime,
    required this.urls,
    required this.isImage,
    this.localDate,
    this.copyright,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        type,
        dateTime,
        urls,
        copyright,
      ];

  DomainMedia copyWith({
    String? title,
    String? description,
    MediaType? type,
    bool? isImage,
    DateTime? dateTime,
    String? localDate,
    MediaUrl? urls,
    String? copyright,
  }) {
    return DomainMedia(
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      isImage: isImage ?? this.isImage,
      dateTime: dateTime ?? this.dateTime,
      localDate: localDate ?? this.localDate,
      urls: urls ?? this.urls,
      copyright: copyright ?? this.copyright,
    );
  }
}

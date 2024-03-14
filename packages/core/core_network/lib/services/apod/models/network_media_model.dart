import 'package:core_dependencies/equatable.dart';

class NetworkMedia extends Equatable {
  final String title;
  final String explanation;
  final String date;
  final String mediaType;
  final String url;
  final String? hdUrl;
  final String? copyright;

  const NetworkMedia({
    required this.title,
    required this.explanation,
    required this.date,
    required this.mediaType,
    required this.url,
    required this.hdUrl,
    required this.copyright,
  });

  @override
  List<Object> get props {
    return [title, explanation, date, mediaType, url];
  }

  factory NetworkMedia.fromMap(Map<String, dynamic> map) {
    return NetworkMedia(
      title: map["title"],
      explanation: map["explanation"],
      date: map["date"],
      mediaType: map["media_type"],
      url: map["url"],
      hdUrl: map["hdurl"],
      copyright: map["copyright"],
    );
  }

  static List<NetworkMedia> fromList(List source) {
    return source.map((e) => NetworkMedia.fromMap(e)).toList();
  }
}

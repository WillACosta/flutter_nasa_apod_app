import 'package:core_network/core_network.dart';
import 'package:feature_media/feature_media.dart';

abstract class MockMedia {
  static const networkMedia = NetworkMedia(
    title: 'Nasa Space Image',
    explanation: 'something',
    date: '2012-02-27',
    mediaType: 'image',
    url: 'http://fakeimage.url',
    hdUrl: 'http://fakeimage.hd.url',
    copyright: null,
  );

  static final domainMedia = DomainMedia(
    title: 'Nasa Space Image',
    description: 'something',
    type: MediaType.image,
    dateTime: DateTime.parse('2012-02-27'),
    urls: const MediaUrl(
      defaultUrl: 'http://fakeimage.url',
      hdUrl: 'http://fakeimage.hd.url',
    ),
    isImage: true,
  );

  static const networkMediaList = [networkMedia];
  static final domainMediaList = [domainMedia];

  static const networkMediaListString = '''
  [{
   "title":"Nasa Space Image",
   "explanation":"something",
   "date":"2012-02-27",
   "media_type":"image",
   "url":"http://fakeimage.url",
   "hdUrl":"http://fakeimage.hd.url",
   "copyright":null
   }]
  ''';
}

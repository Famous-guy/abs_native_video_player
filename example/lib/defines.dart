// import 'package:native_video_player/native_video_player.dart';

// class ExampleVideoSource {
//   final String path;
//   final VideoSourceType type;
//   final Map<String, String>? headers;

//   ExampleVideoSource({
//     required this.path,
//     required this.type,
//     this.headers,
//   });
// }

// final videoSources = [
//   ExampleVideoSource(path: 'assets/video/01.mp4', type: VideoSourceType.asset),
//   ExampleVideoSource(path: 'assets/video/02.mp4', type: VideoSourceType.asset),
//   ExampleVideoSource(path: 'assets/video/03.mp4', type: VideoSourceType.asset),
//   ExampleVideoSource(path: 'assets/video/04.mp4', type: VideoSourceType.asset),
//   ExampleVideoSource(path: 'assets/video/05.mp4', type: VideoSourceType.asset),
//   ExampleVideoSource(path: 'assets/video/06.mp4', type: VideoSourceType.asset),
//   // ExampleVideoSource(path: 'assets/video/07.webm', type: VideoSourceType.asset),
//   ExampleVideoSource(
//     path:
//         'https://file-examples.com/storage/fea8fc38fd63bc5c39cf20b/2017/04/file_example_MP4_480_1_5MG.mp4',
//     type: VideoSourceType.network,
//   ),
// ];

import 'package:abs_native_video_player/native_video_player.dart';

class ExampleVideoSource {
  final String path;
  final VideoSourceType type;
  final Map<String, String>? headers;

  ExampleVideoSource({
    required this.path,
    required this.type,
    this.headers,
  });
}

final videoSources = [
  ExampleVideoSource(
      path:
          'https://aws-s3-aws-bucket.s3.us-east-1.amazonaws.com/uploads/I feel so bad for him 😭🥺.mp4',
      type: VideoSourceType.network),
  ExampleVideoSource(
      path:
          'https://aws-s3-aws-bucket.s3.amazonaws.com/uploads%2Fabs+video.mp4',
      type: VideoSourceType.network),
  ExampleVideoSource(
      path:
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
      type: VideoSourceType.network),
  ExampleVideoSource(
      path:
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
      type: VideoSourceType.network),
  ExampleVideoSource(
      path:
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
      type: VideoSourceType.network),
  ExampleVideoSource(
      path:
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
      type: VideoSourceType.network),
  // ExampleVideoSource(path: 'assets/video/07.webm', type: VideoSourceType.asset),
  ExampleVideoSource(
    path:
        'https://file-examples.com/storage/fea8fc38fd63bc5c39cf20b/2017/04/file_example_MP4_480_1_5MG.mp4',
    type: VideoSourceType.network,
  ),
];

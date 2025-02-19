import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:abs_native_video_player/src/native_video_player_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// A [StatefulWidget] that is responsible for displaying a video.
///
/// On iOS, the video is displayed using a combination
/// of AVPlayer and AVPlayerLayer.
///
/// On Android, the video is displayed using a combination
/// of MediaPlayer and VideoView.
class NativeVideoPlayerView extends StatefulWidget {
  final void Function(NativeVideoPlayerController)? onViewReady;

  const NativeVideoPlayerView({
    super.key,
    required this.onViewReady,
  });

  @override
  _NativeVideoPlayerViewState createState() => _NativeVideoPlayerViewState();
}

class _NativeVideoPlayerViewState extends State<NativeVideoPlayerView> {
  NativeVideoPlayerController? _controller;

  @override
  void dispose() {
    // ignore: invalid_use_of_protected_member
    _controller?.dispose();
    // _controller?.dispose();
    _controller = null; // Nullify to avoid dangling references
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// RepaintBoundary is a widget that isolates repaints
    return RepaintBoundary(
      child: _buildNativeView(),
    );
  }

  Widget _buildNativeView() {
    const viewType = 'native_video_player_view';
    if (defaultTargetPlatform == TargetPlatform.android) {
      return VisibilityDetector(
        key: Key(viewType),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0) {
            // Initialize video only when visible
            onPlatformViewCreated(0); // Pass the appropriate view ID
          }
        },
        child: AndroidView(
          viewType: viewType,
          onPlatformViewCreated: onPlatformViewCreated,
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: viewType,
        onPlatformViewCreated: onPlatformViewCreated,
      );
    }
    return Text('$defaultTargetPlatform is not yet supported by this plugin.');
  }

  // Widget _buildNativeView() {
  //   const viewType = 'native_video_player_view';
  //   // final Map<String, dynamic> creationParams = <String, dynamic>{};
  //   if (defaultTargetPlatform == TargetPlatform.android) {
  //     return AndroidView(
  //       viewType: viewType,
  //       onPlatformViewCreated: onPlatformViewCreated,
  //       // creationParams: creationParams,
  //       // creationParamsCodec: const StandardMessageCodec(),
  //     );
  //   } else if (defaultTargetPlatform == TargetPlatform.iOS) {
  //     return UiKitView(
  //       viewType: viewType,
  //       onPlatformViewCreated: onPlatformViewCreated,
  //       // creationParams: creationParams,
  //       // creationParamsCodec: const StandardMessageCodec(),
  //     );
  //   }
  //   return Text('$defaultTargetPlatform is not yet supported by this plugin.');
  // }

  /// This method is invoked by the platform view
  /// when the native view is created.
  Future<void> onPlatformViewCreated(int id) async {
    final controller = NativeVideoPlayerController(id);
    _controller = controller;
    widget.onViewReady?.call(controller);
  }
}

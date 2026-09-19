// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Background+Shadow.png
  AssetGenImage get backgroundShadow =>
      const AssetGenImage('assets/images/Background+Shadow.png');

  /// File path: assets/images/Ellipse 142.png
  AssetGenImage get ellipse142 =>
      const AssetGenImage('assets/images/Ellipse 142.png');

  /// File path: assets/images/Ellipse 153 (1).png
  AssetGenImage get ellipse1531 =>
      const AssetGenImage('assets/images/Ellipse 153 (1).png');

  /// File path: assets/images/Ellipse 153.png
  AssetGenImage get ellipse153 =>
      const AssetGenImage('assets/images/Ellipse 153.png');

  /// File path: assets/images/Ellipse 154 (1).png
  AssetGenImage get ellipse1541 =>
      const AssetGenImage('assets/images/Ellipse 154 (1).png');

  /// File path: assets/images/Ellipse 154 (2).png
  AssetGenImage get ellipse1542 =>
      const AssetGenImage('assets/images/Ellipse 154 (2).png');

  /// File path: assets/images/Ellipse 154.png
  AssetGenImage get ellipse154 =>
      const AssetGenImage('assets/images/Ellipse 154.png');

  /// File path: assets/images/Ellipse 163.png
  AssetGenImage get ellipse163 =>
      const AssetGenImage('assets/images/Ellipse 163.png');

  /// File path: assets/images/Ellipse 26.png
  AssetGenImage get ellipse26 =>
      const AssetGenImage('assets/images/Ellipse 26.png');

  /// File path: assets/images/Group (1).png
  AssetGenImage get group1 =>
      const AssetGenImage('assets/images/Group (1).png');

  /// File path: assets/images/Group 649.png
  AssetGenImage get group649 =>
      const AssetGenImage('assets/images/Group 649.png');

  /// File path: assets/images/Group.png
  AssetGenImage get group => const AssetGenImage('assets/images/Group.png');

  /// File path: assets/images/Rectangle 512.png
  AssetGenImage get rectangle512 =>
      const AssetGenImage('assets/images/Rectangle 512.png');

  /// File path: assets/images/Rectangle 531.png
  AssetGenImage get rectangle531 =>
      const AssetGenImage('assets/images/Rectangle 531.png');

  /// File path: assets/images/Rectangle 539.png
  AssetGenImage get rectangle539 =>
      const AssetGenImage('assets/images/Rectangle 539.png');

  /// File path: assets/images/bg.png
  AssetGenImage get bg => const AssetGenImage('assets/images/bg.png');

  /// File path: assets/images/map.png
  AssetGenImage get map => const AssetGenImage('assets/images/map.png');

  /// File path: assets/images/onboarding_01.png
  AssetGenImage get onboarding01 =>
      const AssetGenImage('assets/images/onboarding_01.png');

  /// File path: assets/images/onboarding_02.png
  AssetGenImage get onboarding02 =>
      const AssetGenImage('assets/images/onboarding_02.png');

  /// File path: assets/images/onboarding_03.png
  AssetGenImage get onboarding03 =>
      const AssetGenImage('assets/images/onboarding_03.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    backgroundShadow,
    ellipse142,
    ellipse1531,
    ellipse153,
    ellipse1541,
    ellipse1542,
    ellipse154,
    ellipse163,
    ellipse26,
    group1,
    group649,
    group,
    rectangle512,
    rectangle531,
    rectangle539,
    bg,
    map,
    onboarding01,
    onboarding02,
    onboarding03,
  ];
}

abstract final class Assets {
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

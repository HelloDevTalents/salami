import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:salami_theme/salami_theme.dart';

/// Extension `SizeSvg` on SvgGenImage.
extension SizeSvg on SvgGenImage {
  /// `svgResize` by given size and color icon
  SvgPicture svgResize({
    /// Size double
    required double size,

    /// Color Color(0xFF42A5F5)
    Color? color,
  }) =>
      svg(
        color: color,
        height: size,
        width: size,
      );
}

/// Extension `SizeImg` on AssetGenImage.
extension SizeImg on AssetGenImage {
  /// `imgResize` by given size and color icon
  Image imgResize({
    required double size,
    Color? color,
  }) =>
      image(
        color: color,
        height: size,
        width: size,
      );
}

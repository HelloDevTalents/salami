import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salami_theme/salami_theme.dart';

/// Extension `sizeSvg` on SvgGenImage.
extension SizeSvg on SvgGenImage {
  /// Svg resize
  SvgPicture svgResize({
    /// Size double
    required double size,

    /// Color Color(0xFF42A5F5)
    Color? color,
  }) =>
      this.svg(
        color: color,
        height: size,
        width: size,
      );
}

/// Extension `sizeImg` on AssetGenImage.
extension SizeImg on AssetGenImage {
  /// Img resize
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

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salami_theme/salami_theme.dart';

extension sizeSVG on SvgGenImage {
  SvgPicture svgResize({
    required double size,
    Color? color,
  }) =>
      this.svg(
        color: color,
        height: size,
        width: size,
      );
}

extension sizeIMG on AssetGenImage {
  Image imgResize({
    required double size,
    Color? color,
  }) =>
      this.image(
        color: color,
        height: size,
        width: size,
      );
}

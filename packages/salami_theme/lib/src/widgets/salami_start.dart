import 'package:flutter/material.dart';

import 'package:salami_theme/salami_theme.dart';

/// Default `SalamiStart` for Salami UI.
class SalamiStart extends StatelessWidget {
  /// Default start widget Salami UI
  const SalamiStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = [
      SalamiColors.gunmetal,
      SalamiColors.lavenderWeb,
      SalamiColors.metallicSaeweed,
      SalamiColors.beaBlue,
      SalamiColors.black,
      SalamiColors.grey1,
      SalamiColors.grey2,
      SalamiColors.grey3,
      SalamiColors.grey4,
      SalamiColors.grey5,
      SalamiColors.grey6,
    ];
    final headlines = [
      SalamiTextStyle.headline1,
      SalamiTextStyle.headline2,
      SalamiTextStyle.headline3,
      SalamiTextStyle.headline4,
      SalamiTextStyle.headline4,
      SalamiTextStyle.headline6,
      SalamiTextStyle.headline7,
    ];
    final bodyTexts = [
      SalamiTextStyle.bodyText1,
      SalamiTextStyle.bodyText2,
      SalamiTextStyle.bodyText3,
      SalamiTextStyle.bodyText4,
    ];
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: colors
                .map(
                  (color) => Container(
                    width: 20,
                    height: 20,
                    color: color,
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: headlines.map(
              (headline) {
                final index = (headlines.indexOf(headline) + 1).toString();
                return Text(
                  'headline$index',
                  style: headline,
                );
              },
            ).toList(),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: bodyTexts.map(
              (bodyText) {
                final index = (bodyTexts.indexOf(bodyText) + 1).toString();
                return Text(
                  'bodyText$index',
                  style: bodyText,
                );
              },
            ).toList(),
          ),
          const SizedBox(height: 20),
          Text(
            'indication',
            style: SalamiTextStyle.indication,
          ),
          Text(
            'text button',
            style: SalamiTextStyle.button,
          ),
          Text(
            'text overline',
            style: SalamiTextStyle.overline,
          ),
          Text(
            'subtitle1',
            style: SalamiTextStyle.subtitle1,
          ),
          Text(
            'tag',
            style: SalamiTextStyle.tag,
          ),
          Text(
            'caption',
            style: SalamiTextStyle.caption,
          ),
          const SizedBox(height: 20),
          Text(
            'Icons:',
            style: SalamiTextStyle.caption,
          ),
          Assets.icons.apple.svgResize(size: 30),
        ],
      ),
    );
  }
}

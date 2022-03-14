import 'package:flutter_test/flutter_test.dart';
import 'package:salami/utils/utils.dart';

///All DateTime test checks en_US locale'
///
///note that outputed value may change when used in your app
void main() {
  group('.toDM', () {
    test(
      'returns String with in MM/dd format',
      () async {
        // arrange
        final date = DateTime(2021, 8, 17);
        // act
        final formattedString = date.toDM;
        // assert
        expect(formattedString, '8/17');
      },
    );
  });

  group('.toHM', () {
    test(
      'returns String in hh:mm with normal values',
      () async {
        // arrange
        final date = DateTime(2021, 8, 17, 13, 37);
        // act
        final formattedString = date.toHm;
        // assert
        expect(formattedString, '13:37');
      },
    );
    test(
      'returns String in hh:mm with 0 at the beginning when number is <10 ',
      () async {
        // arrange
        final date = DateTime(2021, 8, 17, 03, 07);
        // act
        final formattedString = date.toHm;
        // assert
        expect(formattedString, '03:07');
      },
    );
  });

  group('.toHjm', () {
    test(
      'returns String in hh:mm AM/PM',
      () async {
        // arrange
        final date = DateTime(2021, 8, 17, 03, 07);
        // act
        final formattedString = date.toHjm;
        // assert
        expect(formattedString, '3:07 AM');
      },
    );
  });

  group('.toDMYY', () {
    test(
      'returns String in dd/mm/yyyy ',
      () async {
        // arrange
        final date = DateTime(2021, 8, 17, 03, 07);
        // act
        final formattedString = date.toDMYY;
        // assert
        expect(formattedString, '8/17/2021');
      },
    );
  });

  group('.toDDMMYYYY', () {
    test(
      'returns String in format `montName dd, yyyy` from DateTime',
      () async {
        // arrange
        final date = DateTime(2021, 1, 17, 03, 07);
        // act
        final formattedString = date.toDDMMYYYY;
        // assert
        expect(formattedString, 'January 17, 2021');
      },
    );
  });
}

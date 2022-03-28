// Copyright (c) 2022, DEVTALENTS
// https://devtalents.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:salami/bootstrap.dart';
import 'package:salami_api/salami_api.dart';

void main() {
  final urls = BaseUrls(
    api: 'https://example.api.url',
  );
  bootstrap(urls);
}

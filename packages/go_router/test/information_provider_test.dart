// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/src/information_provider.dart';

// TODO(chunhtai): remove this ignore and migrate the code
// https://github.com/flutter/flutter/issues/124045.
// ignore: deprecated_member_use
const RouteInformation initialRoute = RouteInformation(location: '/');
// TODO(chunhtai): remove this ignore and migrate the code
// https://github.com/flutter/flutter/issues/124045.
// ignore: deprecated_member_use
const RouteInformation newRoute = RouteInformation(location: '/new');

void main() {
  group('GoRouteInformationProvider', () {
    testWidgets('notifies its listeners when set by the app',
        (WidgetTester tester) async {
      late final GoRouteInformationProvider provider =
          GoRouteInformationProvider(initialRouteInformation: initialRoute);
      provider.addListener(expectAsync0(() {}));
      provider.value = newRoute;
    });

    testWidgets('notifies its listeners when set by the platform',
        (WidgetTester tester) async {
      late final GoRouteInformationProvider provider =
          GoRouteInformationProvider(initialRouteInformation: initialRoute);
      provider.addListener(expectAsync0(() {}));
      provider.didPushRouteInformation(newRoute);
    });
  });
}

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:salami/utils/notification_manager/notifications.dart';

class MockLocalNotifications extends Mock
    implements FlutterLocalNotificationsPlugin {}

class MockFirebaseMessaging extends Mock implements FirebaseMessaging {}

class MockNotificationManager extends Mock implements NotificationManager {}

void main() {
  group('Notification Manager', () {
    late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
    late FirebaseMessaging messaging;
    late NotificationManager subject;

    setUp(() {
      messaging = MockFirebaseMessaging();
      flutterLocalNotificationsPlugin = MockLocalNotifications();
      subject = NotificationManager(
        messaging,
        flutterLocalNotificationsPlugin,
      );
    });

    test('constructor returns normally', () {
      expect(
        () => subject,
        returnsNormally,
      );
    });

    group('.init', () {
      test('called without error', () async {
        when(
          () => flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation(),
        ).thenAnswer((invocation) => AndroidFlutterLocalNotificationsPlugin());

        await subject.init();

        /*  verify(() => flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation()).called(1); */
      });
    });
  });
}

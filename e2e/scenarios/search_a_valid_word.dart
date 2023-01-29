// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'robots/home_robot.dart';

void main() {
  late FlutterDriver driver;
  late HomeRobot homeRobot;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
    homeRobot = HomeRobot(driver);
  });

  tearDownAll(() async {
    await driver.close();
  });

  group('Home', () {
    test('when search a valid word navigates to result page', () async {
      await homeRobot.enterWord('perro');
      await homeRobot.tapFab();
    });
  });
}

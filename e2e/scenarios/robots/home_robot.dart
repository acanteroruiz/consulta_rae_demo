// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_driver/flutter_driver.dart';

class HomeRobot {
  const HomeRobot(this.driver);

  final FlutterDriver driver;

  Future<void> enterWord(String word) async {
    await driver.tap(find.byValueKey('wordTextField'));
    await driver.enterText(word);
  }

  Future<void> tapFab() async {
    await driver.tap(find.byTooltip('Consultar'));
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:peridot/controllers/controller.dart';

void main() {
  group('Controller', () {
    test('update notifies listeners', () {
      final controller = Controller();
      var notifications = 0;
      controller.addListener(() => notifications++);

      controller.update();
      controller.update();

      expect(notifications, 2);
      controller.dispose();
    });

    test('update after dispose does not throw', () {
      final controller = Controller()..dispose();

      expect(controller.update, returnsNormally);
    });
  });
}

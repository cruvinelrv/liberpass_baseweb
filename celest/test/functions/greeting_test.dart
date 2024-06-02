import 'package:flutter_test/flutter_test.dart';

import '../../functions/greeting.dart';

void main() {
  group('sayHello', () {
    test('should return a greeting message', () async {
      // Arrange
      final name = 'John';
      
      // Act
      final result = await sayHello(name);
      
      // Assert
      expect(result, 'Hello, $name!');
    });
  });
}
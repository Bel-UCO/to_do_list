import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_list/utility/validator.dart';

void main() {
  group('Validator Tests', () {
    test('Empty string returns error message', () {
      // Arrange
      final input1 = '';
      final input2 = '   ';

      // Act
      final result1 = Validator.validateTodoInput(input1);
      final result2 = Validator.validateTodoInput(input2);

      // Assert
      expect(result1, "Title can't be empty");
      expect(result2, "Title can't be empty");
    });

    test('Valid input returns null', () {
      // Arrange
      final input1 = 'Buy groceries';
      final input2 = '  Task  ';

      // Act
      final result1 = Validator.validateTodoInput(input1);
      final result2 = Validator.validateTodoInput(input2);

      // Assert
      expect(result1, null);
      expect(result2, null);
    });
  });
}

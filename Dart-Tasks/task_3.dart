import 'dart:io';

// A simple Calculator In Dart
class Calculator {
  int? num1, num2;
  Calculator(this.num1, this.num2);

  int addition() {
    return (num1 ?? 0) + (num2 ?? 0);
  }

  int subtraction() {
    return (num1 ?? 0) - (num2 ?? 0);
  }

  int multiplication() {
    return (num1 ?? 0) * (num2 ?? 0);
  }

  dynamic division() {
    try {
      return (num1 ?? 0) ~/ (num2 ?? 0);
    } catch (err) {
      return 'Error: $err';
    }
  }
}

void main() {
  stdout.write("Enter Operand 1: ");
  int num1 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter Operand 2: ");
  int num2 = int.parse(stdin.readLineSync()!);

  Calculator task = Calculator(num1, num2);

  print("------------- Operation ----------------");
  print("1.Addition");
  print("2.Subtraction");
  print("3.Multiplication");
  print("4.Division");

  int choice = int.parse(stdin.readLineSync()!);
  dynamic result;
  switch (choice) {
    case 1:
      result = task.addition();
      break;
    case 2:
      result = task.subtraction();
      break;
    case 3:
      result = task.multiplication();
      break;
    case 4:
      result = task.division();
      break;
    default:
      break;
  }

  Future.delayed(Duration(seconds: 5), () => print('Result: $result'));
}

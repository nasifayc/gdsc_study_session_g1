import 'dart:io';

void main() {
  stdout.write('Enter Number of Elements: ');
  int size = int.parse(stdin.readLineSync()!);

  List<int> values = [];
  for (int i = 0; i < size; ++i) {
    stdout.write('Element ${i + 1}: ');
    values.insert(i, int.parse(stdin.readLineSync()!));
  }

  stdout.write('List : ');
  for (int value in values) {
    stdout.write('$value, ');
  }

  print('\nMaximum Value: ${findMaximum(values)}');
  print('Minimum Value: ${findMinimum(values)}');
  print('Sum: ${calculateSum(values)}');
  print('Average: ${calculateAverage(values)}');
}

int findMaximum(List<int> numbers) {
  int largest = numbers[0];
  for (int number in numbers) {
    if (number > largest) {
      largest = number;
    }
  }

  return largest;
}

int findMinimum(List<int> numbers) {
  int smallest = numbers[0];
  for (int number in numbers) {
    if (number < smallest) {
      smallest = number;
    }
  }

  return smallest;
}

int calculateSum(List<int> numbers) {
  int sum = 0;
  numbers.forEach((number) => sum += number);
  return sum;
}

double calculateAverage(List<int> numbers) {
  int sum = 0;
  numbers.forEach((number) => sum += number);
  return sum / numbers.length;
}

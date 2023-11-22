import 'dart:io';

void main() {
  stdout.write("Enter mark: ");
  var grade = stdin.readByteSync();
 
  if (grade >= 90) {
    print("A");
  } else if (grade >= 80 && grade < 90) {
    print("B");
  } else if (grade >= 70 && grade < 80) {
    print("C");
  } else if (grade >= 60 && grade < 70) {
    print("D");
  } else {
    print("F");
  }
}

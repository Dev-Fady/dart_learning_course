import 'dart:math';

void main() {
  Random random = Random();
  int degree = random.nextInt(101);

  print("Degree: $degree");

  String grade = switch (degree) {
    >= 90 => "A",
    >= 80 => "B",
    >= 70 => "C",
    >= 60 => "D",
    _ => "F"
  };

  print("Grade: $grade");
}
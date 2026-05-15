import 'dart:io';

void main() {
  List<String> studentNames = [];
  List<List<double>> studentGrades = [];

  stdout.write("Enter number of students: ");
  int numStudents = int.parse(stdin.readLineSync() ?? "0");

  for (int i = 0; i < numStudents; i++) {
    print("\n--- Student ${i + 1} ---");
    stdout.write("Enter student name: ");
    String? name = stdin.readLineSync();
    studentNames.add(name!);

    stdout.write("Enter number of subjects: ");
    int numSubjects = int.parse(stdin.readLineSync() ?? "0");
    List<double> grades = [];

    for (int j = 0; j < numSubjects; j++) {
      stdout.write("Enter grade for subject ${j + 1}: ");
      double grade = double.parse(stdin.readLineSync() ?? "0");
      grades.add(grade);
    }

    studentGrades.add(grades);
  }

  while (true) {
    print("\n===== MENU =====");
    print("1. Show All Results");
    print("2. Search Student");
    print("3. Exit");
    stdout.write("Choose an option: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        showAllResults(studentNames, studentGrades);
        break;
      case "2":
        searchStudent(studentNames, studentGrades);
        break;
      case "3":
        print("Exiting program...");
        return;
      default:
        print("Invalid choice. Please enter 1, 2, or 3.");
    }
  }
}

void showAllResults(List<String> names, List<List<double>> grades) {
  print("\n--- All Results ---");
  for (int i = 0; i < names.length; i++) {
    String name = names[i].toUpperCase();
    double avg = calculateAverage(grades[i]);
    String letter = getLetterGrade(avg);
    print("Name: $name | Average: ${avg.toStringAsFixed(2)} | Grade: $letter");
  }
}

void searchStudent(List<String> names, List<List<double>> grades) {
  stdout.write("Enter student name to search: ");
  String? searchName = stdin.readLineSync();

  int index = names.indexWhere(
    (n) => n.toLowerCase() == (searchName ?? "").toLowerCase(),
  );

  if (index == -1) {
    print("Student not found.");
  } else {
    double avg = calculateAverage(grades[index]);
    print("Average grade for ${names[index]}: ${avg.round()}");
  }
}

String getLetterGrade(double avg) {
  if (avg >= 90) return "A";
  if (avg >= 75) return "B";
  if (avg >= 60) return "C";
  return "F";
}

double calculateAverage(List<double> grades) {
  double total = 0.0;
  for (double grade in grades) {
    total += grade;
  }
  double average = total / grades.length;
  return average;
}

Set<String> studentNames = {};
void addStudent(String name) {
  studentNames.add(name);
}

void printStudentsRecursively(List<String> names, int index) {
  if (index < names.length) {
    print(names[index]);
    printStudentsRecursively(names, index + 1);
  }
}

void printStudentsLambda() {
  studentNames.forEach((name) => print(name));
}

// ==============================Part 2================================

Map<String, List<double>> studentCourses = {};

void addCourse(String student, String course, {double grade = 0}) {
  studentCourses.putIfAbsent(student, () => []);
  studentCourses[student]!.add(grade);
  print("Added course '$course' for $student with grade $grade");
}

double averageGrade(String student) {
  if (!studentCourses.containsKey(student) ||
      studentCourses[student]!.isEmpty) {
    print("No courses found for $student");
    return 0;
  }
  var grades = studentCourses[student]!;
  double sum = grades.fold(0, (prev, g) => prev + g); 
  return sum / grades.length;
}

void main() {
  addStudent("Fady");
  addStudent("Tom");
  addStudent("Fady 2");
  addStudent("Tome 2");

  print("\n--- Recursive Print ---");
  printStudentsRecursively(studentNames.toList(), 0);

  print("\n--- Lambda Print ---");
  printStudentsLambda();

  Set<String> newStudents = {"Ali", "Peter"};
  studentNames = {...studentNames, ...newStudents};

  print("\n--- After Merge ---");
  studentNames.forEach((name) => print(name));

  print("\t this code for part 2 \n ");

  addCourse("Fady", "Math", grade: 85);
  addCourse("Fady", "Physics", grade: 70);
  addCourse("Tom", "Math");

  print("\n--- Average Grades ---");
  print("Fady: ${averageGrade("Fady")}");
  print("Tom: ${averageGrade("Tom")}");
}
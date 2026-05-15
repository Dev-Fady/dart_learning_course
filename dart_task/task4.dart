class Person {
  String name;
  int _age; 

  Person(this.name, this._age);

  int get age {
    return _age;
  }

  set age(int value) {
    if (value > 0) {
      _age = value;
    } else {
      print("Age must be > 0 .");
    }
  }

  static String universityName = "Sohag University";
}

class Employee extends Person {
  double salary;

  Employee(String name, int age, this.salary) : super(name, age);

  void showInfo() {
    print("Name: $name \n Age: $age \n Salary: $salary");
  }
}

abstract class Skills {
  void programming();
  void communication();
}

class Developer extends Employee implements Skills {
  String language;

  Developer(String name, int age, double salary, this.language)
      : super(name, age, salary);

  @override
  void programming() {
    print("Programming Skill: $language developer");
  }

  @override
  void communication() {
    print("Communication Skill: Very good skills in communication");
  }
}

void main() {
  Developer dev = Developer("Fady", 21, 16000, ".NET");

  print("University: ${Person.universityName}");
  dev.showInfo();
  dev.programming();
  dev.communication();

  
}
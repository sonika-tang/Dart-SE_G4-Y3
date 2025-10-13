enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  const Address({
    required this.street,
    required this.city,
    required this.zipCode,
  });

  @override
  String toString() => '$street, $city $zipCode';

}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  // Constructor
  // Employee(this.name, this.baseSalary);
  Employee(this._name, this._baseSalary, 
      {List<Skill>? skills, required Address address, int yearsOfExperience = 0,})  : _skills = skills ?? [], _address = address, _yearsOfExperience = yearsOfExperience;

  // void printDetails() {
  //   print('Employee: $name, Base Salary: \$${baseSalary}');
  // }

  // Getters
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => List.unmodifiable(_skills);
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  // Named constructor for mobile developer
  Employee.mobileDeveloper(String name, double baseSalary, 
      {required Address address, int yearsOfExperience = 0})  : _name = name,_baseSalary = baseSalary,_skills = [Skill.FLUTTER, Skill.DART],_address = address,_yearsOfExperience = yearsOfExperience;

// Salary calculation
  double computeSalary() {
    double salary = _baseSalary + (_yearsOfExperience * 2000);
    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }
    return salary;
  }

  void printDetails() {
    print(
        '- Employee: $_name\n Base Salary: $_baseSalary\n Skills: $_skills\n Address: $_address\n Experience: $_yearsOfExperience years\n Total Salary: ${computeSalary()}\n');
  }
}

void main() {
  // var emp1 = Employee('Sokea', 40000);
  // emp1.printDetails();

  // var emp2 = Employee('Ronan', 45000);
  // emp2.printDetails();

  final addr = Address(street: 'P02', city: 'Phnom Penh', zipCode: '16122005');

  var emp1 = Employee('Nika', 40000, skills: [Skill.OTHER], address: addr, yearsOfExperience: 2);
  emp1.printDetails();

  var emp2 = Employee.mobileDeveloper('Sonika', 45000, address: addr, yearsOfExperience: 5);
  emp2.printDetails();
}
